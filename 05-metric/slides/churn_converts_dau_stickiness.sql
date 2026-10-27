-- churn_rate.sql
-- Monthly churn rate: % of users active last month who did not return this month
-- Assumes table analytics.subscriptions(user_id, period_start, period_end, status)

WITH monthly_active AS (
  SELECT 
    DATE_TRUNC('month', period_start)::date AS month,
    user_id
  FROM analytics.subscriptions
  WHERE status = 'active'
  GROUP BY 1, 2
),
churned_users AS (
  -- Users who were active in month M but have no active record in month M+1
  SELECT 
    m1.month,
    COUNT(m1.user_id) AS active_this_month,
    COUNT(m1.user_id) - COUNT(m2.user_id) AS churned_count
  FROM monthly_active m1
  LEFT JOIN monthly_active m2 
    ON m1.user_id = m2.user_id 
    AND m2.month = (m1.month + INTERVAL '1 month')::date
  GROUP BY 1
)
SELECT
  month,
  active_this_month,
  churned_count,
  ROUND(churned_count::numeric / NULLIF(active_this_month, 0) * 100, 2) AS churn_rate_pct
FROM churned_users
ORDER BY month DESC;
========================================================================================
-- conversion_rate.sql
-- AARRR Funnel: Visitor -> Signup -> Activated -> Paid
-- Insight from Image 02: AARRR Funnel stages definition

WITH base_events AS (
  SELECT 
    user_id,
    MIN(CASE WHEN page = 'landing' THEN event_time END) AS first_seen,
    MIN(CASE WHEN event_name = 'signup' THEN event_time END) AS signup_at,
    MIN(CASE WHEN event_name = 'key_action' THEN event_time END) AS activated_at, -- Key action per Image 02
    MIN(CASE WHEN event_name = 'purchase' THEN event_time END) AS paid_at
  FROM analytics.events
  GROUP BY 1
)
SELECT
  COUNT(DISTINCT user_id) AS total_visitors,
  COUNT(DISTINCT CASE WHEN signup_at IS NOT NULL THEN user_id END) AS signups,
  COUNT(DISTINCT CASE WHEN activated_at IS NOT NULL THEN user_id END) AS activated_users,
  COUNT(DISTINCT CASE WHEN paid_at IS NOT NULL THEN user_id END) AS paid_users,
  -- Rates
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN signup_at IS NOT NULL THEN user_id END) / COUNT(DISTINCT user_id), 2) AS visitor_to_signup_pct,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN activated_at IS NOT NULL THEN user_id END) / NULLIF(COUNT(DISTINCT CASE WHEN signup_at IS NOT NULL THEN user_id END), 0), 2) AS signup_to_activation_pct,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN paid_at IS NOT NULL THEN user_id END) / NULLIF(COUNT(DISTINCT CASE WHEN activated_at IS NOT NULL THEN user_id END), 0), 2) AS activation_to_paid_pct
FROM base_events
WHERE first_seen BETWEEN :start_date AND :end_date;
===========================================================================================
-- dau_stickiness.sql
-- DAU & Stickiness (DAU/MAU) - Actionable engagement metrics
-- Reference Image 01: DAU is actionable, Total Users is vanity.

WITH daily_active AS (
  SELECT 
    DATE_TRUNC('day', event_time)::date AS day,
    COUNT(DISTINCT user_id) AS dau
  FROM analytics.events
  WHERE event_name IN ('open_app', 'key_action') -- Definition of engagement
  GROUP BY 1
),
monthly_active AS (
  SELECT 
    DATE_TRUNC('day', event_time)::date AS day,
    (
      SELECT COUNT(DISTINCT user_id)
      FROM analytics.events e2
      WHERE e2.event_time BETWEEN DATE_TRUNC('day', e1.event_time) - INTERVAL '29 days' AND DATE_TRUNC('day', e1.event_time)
    ) AS mau
  FROM analytics.events e1
  GROUP BY 1
)
SELECT
  d.day,
  d.dau,
  m.mau,
  ROUND(100.0 * d.dau / NULLIF(m.mau, 0), 2) AS stickiness_pct
FROM daily_active d
JOIN monthly_active m ON d.day = m.day
ORDER BY d.day DESC;
==============================================================================================
-- ltv_30d_cohort.sql
-- 30-Day LTV by Signup Cohort
-- Assumes analytics.revenue(user_id, revenue_amount, revenue_time) and users(signup_at)

WITH cohorts AS (
  SELECT 
    user_id, 
    DATE_TRUNC('month', signup_at)::date AS cohort_month
  FROM analytics.users
),
revenue_30d AS (
  SELECT
    c.cohort_month,
    c.user_id,
    SUM(r.revenue_amount) AS rev_30d
  FROM cohorts c
  LEFT JOIN analytics.revenue r 
    ON c.user_id = r.user_id 
    AND r.revenue_time <= c.signup_at + INTERVAL '30 days'
  GROUP BY 1, 2
)
SELECT
  cohort_month,
  COUNT(DISTINCT user_id) AS cohort_size,
  ROUND(SUM(rev_30d) / COUNT(DISTINCT user_id), 2) AS ltv_30d
FROM revenue_30d
GROUP BY 1
ORDER BY 1 DESC;
======================================================================
-- retention_cohort_heatmap.sql
-- Heatmap-ready Day-N Retention
-- Reference Image 03: Retention Heatmap logic (exact day retention)

WITH users AS (
  SELECT
    user_id,
    DATE_TRUNC('day', signup_at)::date AS signup_day
  FROM analytics.users
  WHERE signup_at IS NOT NULL
),
activity AS (
  SELECT
    user_id,
    DATE_TRUNC('day', event_time)::date AS activity_day
  FROM analytics.events
),
cohort_sizes AS (
  SELECT signup_day, COUNT(DISTINCT user_id) AS cohort_size
  FROM users
  GROUP BY 1
),
retention AS (
  SELECT
    u.signup_day,
    a.activity_day - u.signup_day AS day_number,
    COUNT(DISTINCT u.user_id) AS retained_users
  FROM users u
  JOIN activity a ON u.user_id = a.user_id
  WHERE a.activity_day >= u.signup_day
  GROUP BY 1, 2
)
SELECT
  r.signup_day,
  cs.cohort_size,
  r.day_number,
  r.retained_users,
  ROUND(100.0 * r.retained_users / cs.cohort_size, 2) AS retention_pct
FROM retention r
JOIN cohort_sizes cs ON r.signup_day = cs.signup_day
WHERE r.day_number IN (0, 1, 3, 7, 14, 30) -- Standard Day-N intervals
ORDER BY r.signup_day DESC, r.day_number ASC;
=====================================================================

