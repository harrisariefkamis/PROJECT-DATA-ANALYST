-- Advanced: Normalisasi, dedup, konversi mata uang, dan deteksi outlier (Postgres-like)
-- Asumsi: staging.transactions(tx_id TEXT, user_id TEXT, event_time TEXT, amount TEXT, currency TEXT, product_id TEXT, channel TEXT, notes TEXT)
-- Asumsi: reference table fx_rates(rate_date DATE, currency TEXT, rate_to_usd NUMERIC)

-- 1) Normalisasi kolom dasar
CREATE TABLE IF NOT EXISTS analytics.transactions_normalized AS
SELECT
  tx_id,
  user_id,
  -- coba parse ISO/TZ; jika gagal set NULL
  CASE
    WHEN event_time ~ '\\+\\d{2}:?\\d{2}$' THEN (event_time::timestamptz)
    WHEN event_time ~ 'T' THEN NULLIF(event_time,'')::timestamptz
    ELSE NULL
  END AS event_time,
  NULLIF(amount,'')::NUMERIC AS amount,
  currency,
  product_id,
  channel,
  notes
FROM staging.transactions;

-- 2) Dedup: pilih baris dengan completeness tertinggi, tie -> event_time terbaru
WITH scored AS (
  SELECT *,
    ((CASE WHEN user_id IS NOT NULL THEN 1 ELSE 0 END)
    + (CASE WHEN event_time IS NOT NULL THEN 1 ELSE 0 END)
    + (CASE WHEN amount IS NOT NULL THEN 1 ELSE 0 END)
    + (CASE WHEN currency IS NOT NULL THEN 1 ELSE 0 END)
    ) AS completeness,
    ROW_NUMBER() OVER (PARTITION BY tx_id ORDER BY 
      ((CASE WHEN user_id IS NOT NULL THEN 1 ELSE 0 END)
       + (CASE WHEN event_time IS NOT NULL THEN 1 ELSE 0 END)
       + (CASE WHEN amount IS NOT NULL THEN 1 ELSE 0 END)
       + (CASE WHEN currency IS NOT NULL THEN 1 ELSE 0 END)
      ) DESC, event_time DESC) AS rn
  FROM analytics.transactions_normalized
)
SELECT * INTO analytics.transactions_dedup
FROM scored
WHERE rn = 1;

-- 3) Konversi ke USD menggunakan fx_rates berdasarkan date(event_time)
CREATE TABLE IF NOT EXISTS analytics.transactions_usd AS
SELECT t.*,
       COALESCE(t.amount * f.rate_to_usd, t.amount) AS amount_usd
FROM analytics.transactions_dedup t
LEFT JOIN fx_rates f
  ON f.currency = t.currency
  AND f.rate_date = DATE(t.event_time);

-- 4) Deteksi outlier per bulan menggunakan IQR
WITH stats AS (
  SELECT date_trunc('month', event_time)::date as month,
         percentile_cont(0.25) WITHIN GROUP (ORDER BY amount_usd) AS q1,
         percentile_cont(0.75) WITHIN GROUP (ORDER BY amount_usd) AS q3
  FROM analytics.transactions_usd
  WHERE amount_usd IS NOT NULL
  GROUP BY 1
)
SELECT t.*, s.q1, s.q3,
       CASE WHEN amount_usd < (s.q1 - 1.5*(s.q3-s.q1)) OR amount_usd > (s.q3 + 1.5*(s.q3-s.q1)) THEN true ELSE false END AS is_outlier
FROM analytics.transactions_usd t
JOIN stats s ON date_trunc('month', t.event_time)::date = s.month
ORDER BY event_time DESC
LIMIT 100;

-- Catatan: parsing event_time heterogen membutuhkan ETL lebih robust; gunakan fungsi parsing custom bila perlu.
