# The Metrics: Measure What Matters

## Ringkasan
Materi ini menjelaskan prinsip & praktik memilih, mendefinisikan, dan mengelola metrik yang benar-benar penting bagi produk atau organisasi. Fokus utama: hindari "vanity metrics", gunakan metrik yang actionable, dan pastikan metrik terdefinisi dengan jelas dan terinstrumentasi secara andal.

---

## Mengapa metrik penting?
- Metrik membantu tim membuat keputusan berbasis data.
- Metrik memberi sinyal kesehatan produk, adopsi pengguna, dan performa bisnis.
- Tanpa metrik yang tepat, tim mudah salah arah, mengejar angka yang tidak merepresentasikan nilai nyata.

---

## Karakteristik metrik yang baik
1. Relevan — berkaitan langsung dengan tujuan bisnis atau outcome pengguna.
2. Actionable — perubahan metrik memberi petunjuk tindakan yang jelas.
3. Measurable & reliable — dapat diukur secara konsisten dan data bersih/terverifikasi.
4. Understandable — setiap pihak memahami definisi dan formula metrik.
5. Sensitive (timely) — memberikan sinyal pada timeframe yang sesuai (harian/mingguan/bulanan).
6. Resistant to manipulation — sukar dipengaruhi oleh cara pelaporan atau permainan angka.

---

## Jenis metrik (contoh)
- Vanity metrics: jumlah like, views, total registrasi (tanpa konteks kualitas). Berguna untuk PR, tapi tidak selalu actional.
- Actionable metrics: conversion rate, retention rate, activation rate — metrik yang memicu keputusan.
- Leading indicators: metrik yang memprediksi outcome (mis. trial-to-activation rate) — berguna untuk cepat bereaksi.
- Lagging indicators: metrik hasil akhir (mis. revenue, churn) — konfirmasi outcome.

---

## Framework populer
- North Star Metric (NSM): metrik tunggal yang merepresentasikan nilai inti produk (mis. "weekly active users engaging with core feature"). NSM memandu fokus tim lintas fungsi.
- AARRR (Pirate metrics): Acquisition, Activation, Retention, Referral, Revenue — bagus untuk product/PM fokus funnel.
- HEART (Google): Happiness, Engagement, Adoption, Retention, Task success — cocok untuk UX/performance.

---

## Cara mendefinisikan metrik: Metric spec
Setiap metrik harus memiliki dokumentasi singkat (metric spec) — contoh struktur:
- Nama metrik: contohnya user_weekly_active
- Definisi: deskripsi satu kalimat
- Formula / query: rumus atau contoh SQL yang menghitungnya
- Dimensi: user_id, country, platform, plan
- Agregasi/time grain: daily / weekly / monthly
- SLO / target: (opsional) ambang sukses
- Owner: tim atau individu yang bertanggung jawab
- Data source & pipeline: tabel/stream yang dipakai
- Catatan: edge cases, inklusi/exklusi, deduplikasi, timezone

Contoh singkat (Retensi 7-hari):
- Nama: retention_d7
- Definisi: Persentase pengguna yang melakukan event "open_app" pada hari ke-7 setelah signup
- Formula (konseptual): users_who_returned_on_day_7 / cohort_size

---

## Instrumentasi dan data quality
- Pastikan event/kolom penting terinstrumentasi secara konsisten (user_id, timestamp, event_name, properties).
- Gunakan schema registry / tracking plan untuk mengontrol event yang diikutkan.
- Tangani timezone (simpan timestamp dalam UTC, definisikan day boundaries) dan idempotency.
- Lakukan monitoring data quality: row counts, null rates, schema changes.
- Buat alerts untuk anomali data (drop pipeline, schema drift).

---

## Contoh SQL (Retention sederhana)
Berikut contoh cara menghitung cohort retention 7-hari (Postgres-like):

```sql
-- cohort = signup_date
WITH users AS (
  SELECT user_id, date_trunc('day', signup_at) AS signup_day
  FROM analytics.users
), events AS (
  SELECT user_id, date_trunc('day', event_time) AS event_day
  FROM analytics.events
  WHERE event_name = 'open_app'
)
, cohort_size AS (
  SELECT signup_day, COUNT(DISTINCT user_id) AS cohort_users
  FROM users
  GROUP BY signup_day
)
, cohort_return AS (
  SELECT u.signup_day, e.event_day, COUNT(DISTINCT e.user_id) AS returning_users
  FROM users u
  JOIN events e ON u.user_id = e.user_id
  WHERE e.event_day BETWEEN u.signup_day AND u.signup_day + INTERVAL '14 days'
  GROUP BY u.signup_day, e.event_day
)
SELECT c.signup_day,
       cr.event_day,
       cr.returning_users,
       c.cohort_users,
       ROUND(cr.returning_users::numeric / c.cohort_users * 100, 2) AS retention_pct
FROM cohort_size c
LEFT JOIN cohort_return cr USING (signup_day)
WHERE cr.event_day = c.signup_day + INTERVAL '7 days'
ORDER BY signup_day DESC
LIMIT 30;
```

---

## Common pitfalls & anti-patterns
- Mengandalkan vanity metrics untuk keputusan operasional.
- Tidak mendokumentasikan definisi metrik → perbedaan versi di tim.
- Mengubah definisi metrik tanpa mencatat versi/historical impact.
- Metrik terinstrumentasi buruk (missing user_id, duplicate events).
- Terlalu banyak metrik (noise) → pilih 3–5 metrik utama per tim.

---

## Practical checklist untuk tim
1. Tentukan 1 North Star Metric dan 3–5 Supporting metrics.
2. Tuliskan metric spec untuk tiap metrik utama.
3. Pastikan instrumentation & data pipeline memadai.
4. Bangun dashboard (daily/weekly) dan alert sederhana.
5. Review metrik secara berkala (bulanan/quarterly) dan versi kontrol definisi.

---

## Contoh metrik per fungsi (suggestion)
- Product: activation_rate, retention_d7, daily_active_users (DAU), feature_engagement
- Growth/Marketing: CAC, conversion_rate (signup → paid), LTV, MQL → SQL conversion
- Ops/Platform: error_rate, latency_p95, job_success_rate
- Finance: MRR/ARR, churn_rate, ARPU

---

## Kesimpulan
Memilih metrik yang tepat bukan hanya soal menghitung angka tapi membangun proses: definisi yang jelas, instrumentasi yang andal, pemantauan kualitas data, dan tata kelola. Mulailah dari North Star + supporting metrics, dokumentasikan semuanya, dan jadwalkan review rutin.

---

## Next steps (recommended)
- Buat metric spec document untuk top 5 metrik tim Anda.
- Tambahkan query SQL dan contoh dataset pada repo untuk verifikasi.
- Implementasikan monitoring data quality dan simple alerting (e.g., Slack/email).

