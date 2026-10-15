# SQL Technical Interview Case Studies — SQL for Data Analysis 5

## Tujuan Modul
Mempersiapkan peserta menghadapi tes teknis SQL pada proses rekrutmen: menyelesaikan studi kasus, menulis query yang benar, efisien, dan dapat dijelaskan, serta memahami trade-off performa.

## Format Modul
- Penjelasan pendek tiap tipe soal interview SQL
- Contoh soal & solusi (query) yang diuji di meja
- Tips menjawab: cara berpikir, asumsi, dan optimasi
- Latihan: file .sql berisi soal dan solusi

---

## Tipe soal umum di interview SQL
1. Aggregation & GROUP BY — top-N per group, summary metrics
2. Joins & Multi-table — gabungkan tabel, handle missing/NULLs
3. Window Functions — ranking, running totals, lag/lead
4. Subquery / CTE — memecah langkah analitis
5. Sessionization / Event sequences — mengelompokkan event per user
6. Data cleaning & deduplication — identify canonical records
7. Time-series / Temporal analysis — cohort, retention, daily/weekly metrics
8. Performance / Explain — indexing, explain plan tips

---

## Interview Strategy (cara berpikir)
1. Clarify the question: tanyakan definisi (mis. apa maksud "active user"?), time window, timezone, termasuk/excluding bots.
2. Define sample output: tunjukkan 2–3 baris contoh output dan kolom yang diharapkan.
3. Sketch approach: Bicarakan langkah (CTE → aggregates → joins → window) sebelum mengetik.
4. Write query incrementally: mulai dari simple SELECT, lalu GROUP BY, lalu optimisasi.
5. Validate with edge cases: nulls, duplicates, no data.
6. Performance note: sebutkan indeks yang membantu dan kompleksitas.

---

## Contoh Study Cases

Case 1 — Top 5 products by sales per region (last 12 months)
- Input: tabel `orders` (order_date, region, product_name, sales)
- Output: region, product_name, total_sales_rank (1..5)

Hints & solusi (sketch): use SUM + ROW_NUMBER() OVER(PARTITION BY region ORDER BY SUM(sales) DESC) inside CTE, then filter rank <= 5.

Case 2 — Weekly active users (WAU) and week-over-week growth
- Input: `events` (user_id, event_time)
- Output: week_start, wau, WoW_growth

Hints: normalize timestamps to week start (date_trunc('week', event_time)), count distinct user_id per week, then use LAG() to compute growth.

Case 3 — Sessionization: count sessions per user (30-min inactivity threshold)
- Input: events (user_id, event_time)
- Task: define sessions and count sessions per user

Hints: use LAG(event_time) OVER(PARTITION BY user_id ORDER BY event_time) to compute gap and flag new session when gap > interval '30 minutes'. Then cumulative SUM to assign session_id.

Case 4 — Deduplicate customers by email with priority rule
- Input: customers_raw (customer_id, name, email, created_at, source_priority)
- Task: pick one canonical record per email preferring highest source_priority then latest created_at

Hints: use ROW_NUMBER() OVER(PARTITION BY email ORDER BY source_priority DESC, created_at DESC) and pick row_number =1.

Case 5 — Retention cohort (user signup cohort)
- Input: users (user_id, signup_date), events (user_id, event_date)
- Output: cohort_month, retention_month_n (percent of users returning in month n)

Hints: use cohort_month = date_trunc('month', signup_date), then join events aggregated by month and compute percentages using COUNT DISTINCT and window/conditional aggregation.

---

## Practical tips for the interview
- Always confirm timezone and inclusive/exclusive ranges (<= / <).
- When asked for "top N" mention tie-handling rule (ORDER BY ... , product_name).
- For large tables mention indexing strategy (index on order_date, user_id, foreign keys) and consider pre-aggregation.
- Use CTEs to explain multi-step logic; interviewer prefers clear steps.
- If performance asked, discuss cardinality, explain analyze, and potential materialized views.

---

## Latihan dan Deliverables
- exercises/sql_interview_cases.sql (soal + model solution) — tersedia di folder exercises.
- Buat PR dengan solusi Anda, jelaskan asumsi, dan sertakan EXPLAIN ANALYZE jika memungkinkan.

---

## Referensi
- PostgreSQL docs (window functions, date_trunc, indexing)  
- "SQL Practice Problems" book / online resources  
- Kaggle / datasets untuk latihan (superstore, e-commerce logs)
