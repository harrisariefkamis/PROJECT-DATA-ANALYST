# SQL Interview Case Studies — Exercises and Solutions

-- Case 1: Top 5 products by sales per region (last 12 months)
-- Solution:
WITH recent_orders AS (
  SELECT *
  FROM orders
  WHERE order_date >= CURRENT_DATE - INTERVAL '12 months'
), sales_per_product AS (
  SELECT region, product_name, SUM(sales) AS total_sales
  FROM recent_orders
  GROUP BY region, product_name
), ranked AS (
  SELECT region, product_name, total_sales,
         ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_sales DESC) AS rn
  FROM sales_per_product
)
SELECT region, product_name, total_sales
FROM ranked
WHERE rn <= 5
ORDER BY region, total_sales DESC;

-- Case 2: Weekly Active Users (WAU) & WoW growth
-- Solution:
WITH weekly_users AS (
  SELECT date_trunc('week', event_time)::date AS week_start,
         COUNT(DISTINCT user_id) AS wau
  FROM events
  GROUP BY 1
), with_lag AS (
  SELECT week_start, wau,
         LAG(wau) OVER (ORDER BY week_start) AS prev_wau
  FROM weekly_users
)
SELECT week_start, wau,
       CASE WHEN prev_wau IS NULL THEN NULL
            WHEN prev_wau = 0 THEN NULL
            ELSE (wau - prev_wau)::numeric / prev_wau END AS wow_growth
FROM with_lag
ORDER BY week_start;

-- Case 3: Sessionization (30-min threshold)
-- Solution:
WITH ordered_events AS (
  SELECT user_id, event_time,
         LAG(event_time) OVER (PARTITION BY user_id ORDER BY event_time) AS prev_time
  FROM events
), flagged AS (
  SELECT user_id, event_time,
         CASE WHEN prev_time IS NULL OR event_time - prev_time > INTERVAL '30 minutes' THEN 1 ELSE 0 END AS is_new_session
  FROM ordered_events
), sessions AS (
  SELECT user_id, event_time,
         SUM(is_new_session) OVER (PARTITION BY user_id ORDER BY event_time) AS session_no
  FROM flagged
)
SELECT user_id, session_no, MIN(event_time) AS session_start, MAX(event_time) AS session_end, COUNT(*) AS events_in_session
FROM sessions
GROUP BY user_id, session_no
ORDER BY user_id, session_no;

-- Case 4: Deduplicate customers by email
-- Solution:
WITH ranked AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY source_priority DESC, created_at DESC) AS rn
  FROM customers_raw
)
SELECT *
FROM ranked
WHERE rn = 1;

-- Case 5: Retention cohort analysis (monthly cohorts)
-- Solution:
WITH user_cohort AS (
  SELECT user_id, date_trunc('month', signup_date)::date AS cohort_month
  FROM users
), events_month AS (
  SELECT user_id, date_trunc('month', event_date)::date AS event_month
  FROM events
), cohort_activity AS (
  SELECT uc.cohort_month, em.event_month, COUNT(DISTINCT em.user_id) AS active_users
  FROM user_cohort uc
  JOIN events_month em ON uc.user_id = em.user_id
  GROUP BY uc.cohort_month, em.event_month
), cohort_size AS (
  SELECT cohort_month, COUNT(DISTINCT user_id) AS cohort_users
  FROM user_cohort
  GROUP BY cohort_month
)
SELECT ca.cohort_month,
       ca.event_month,
       ca.active_users,
       cs.cohort_users,
       ROUND((ca.active_users::numeric / cs.cohort_users) * 100,2) AS retention_pct
FROM cohort_activity ca
JOIN cohort_size cs USING (cohort_month)
ORDER BY ca.cohort_month, ca.event_month;
