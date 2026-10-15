-- Beginner case: Clean sales staging to cleaned table (Postgres)
-- Asumsi table staging: analytics.sales_staging(order_id TEXT, order_date TEXT, customer_name TEXT, product TEXT, quantity TEXT, price TEXT, country TEXT)

-- 1) Normalisasi dasar: cast kolom, trim string, drop baris tanpa order_id
CREATE TABLE IF NOT EXISTS analytics.sales_cleaned AS
SELECT
  order_id,
  -- ubah string ke date; kalau gagal akan NULL
  NULLIF(order_date,'')::date AS order_date,
  TRIM(customer_name) AS customer_name,
  TRIM(product) AS product,
  NULLIF(quantity,'')::INT AS quantity,
  NULLIF(price,'')::NUMERIC AS price,
  TRIM(country) AS country
FROM analytics.sales_staging
WHERE COALESCE(order_id, '') <> '';

-- 2) Isi price NULL dengan median per product (Postgres)
WITH med AS (
  SELECT product,
         percentile_cont(0.5) WITHIN GROUP (ORDER BY price) AS med_price
  FROM analytics.sales_cleaned
  WHERE price IS NOT NULL
  GROUP BY product
)
UPDATE analytics.sales_cleaned s
SET price = m.med_price
FROM med m
WHERE s.price IS NULL AND s.product = m.product;

-- 3) Isi quantity NULL dengan nilai default 1
UPDATE analytics.sales_cleaned
SET quantity = 1
WHERE quantity IS NULL;

-- 4) Hapus duplikat berdasarkan order_id (keep earliest/first)
DELETE FROM analytics.sales_cleaned a
USING (
  SELECT order_id, MIN(ctid) AS keep_ctid
  FROM analytics.sales_cleaned
  GROUP BY order_id
  HAVING COUNT(*) > 1
) d
WHERE a.order_id = d.order_id AND a.ctid <> d.keep_ctid;

-- 5) Tambahkan kolom total jika belum ada, lalu update
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema='analytics' AND table_name='sales_cleaned' AND column_name='total'
  ) THEN
    ALTER TABLE analytics.sales_cleaned ADD COLUMN total NUMERIC;
  END IF;
END$$;

UPDATE analytics.sales_cleaned
SET total = quantity * price;

-- Catatan: Pastikan privilege dan schema analytics ada. Sesuaikan parsing tanggal jika format berbeda.
