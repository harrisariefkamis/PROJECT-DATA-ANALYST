-- lifetime_value.sql
-- Simple cohort LTV calculation using revenue per user over first N days
-- Assumes analytics.revenue(user_id, revenue_amount, revenue_time) and users(signup_at)

WITH user_cohort AS (
  SELECT user_id, DATE_TRUNC('day', signup_at)::date AS signup_day
  FROM analytics.users
),
revenue_in_window AS (
  SELECT
    uc.signup_day,
    r.user_id,
    SUM(r.revenue_amount) AS revenue_0_n
  FROM user_cohort uc
  JOIN analytics.revenue r ON uc.user_id = r.user_id
  WHERE r.revenue_time BETWEEN uc.signup_day AND uc.signup_day + INTERVAL '30 days'
  GROUP BY uc.signup_day, r.user_id
),
cohort_size AS (
  SELECT signup_day, COUNT(DISTINCT user_id) AS cohort_users
  FROM user_cohort
  GROUP BY signup_day
)
SELECT
  r.signup_day,
  ROUND(AVG(r.revenue_0_n)::numeric, 2) AS avg_ltv_30d,
  c.cohort_users
FROM revenue_in_window r
JOIN cohort_size c USING (signup_day)
GROUP BY r.signup_day, c.cohort_users
ORDER BY signup_day DESC
LIMIT 50;
