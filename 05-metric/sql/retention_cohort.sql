-- retention_cohort.sql
-- Calculate day-7 retention for signup cohorts (Postgres syntax)
-- Parameters to adjust: analytics.users table, analytics.events table, signup event column names

WITH users AS (
  SELECT
    user_id,
    DATE_TRUNC('day', signup_at)::date AS signup_day
  FROM analytics.users
  WHERE signup_at IS NOT NULL
),
opens AS (
  SELECT
    user_id,
    DATE_TRUNC('day', event_time)::date AS event_day
  FROM analytics.events
  WHERE event_name = 'open_app'
),
cohort_size AS (
  SELECT signup_day, COUNT(DISTINCT user_id) AS cohort_users
  FROM users
  GROUP BY signup_day
),
cohort_return AS (
  SELECT
    u.signup_day,
    e.event_day,
    COUNT(DISTINCT e.user_id) AS returning_users
  FROM users u
  JOIN opens e ON u.user_id = e.user_id
  WHERE e.event_day BETWEEN u.signup_day AND u.signup_day + INTERVAL '14 days'
  GROUP BY u.signup_day, e.event_day
)
SELECT
  c.signup_day,
  COALESCE(cr.returning_users, 0) AS returning_users,
  c.cohort_users,
  ROUND(COALESCE(cr.returning_users, 0)::numeric / c.cohort_users * 100, 2) AS retention_pct
FROM cohort_size c
LEFT JOIN cohort_return cr
  ON c.signup_day = cr.signup_day
  AND cr.event_day = c.signup_day + INTERVAL '7 days'
ORDER BY c.signup_day DESC
LIMIT 60;
