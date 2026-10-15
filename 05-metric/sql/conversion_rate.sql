-- conversion_rate.sql
-- Funnel conversion: visitor -> signup -> paid (example)
-- Assumes table analytics.page_views (user_id, session_id, event_time)
-- and analytics.users (user_id, signed_up_at, paid_at)

WITH visitors AS (
  SELECT DISTINCT user_id FROM analytics.page_views
  WHERE page = 'landing' AND event_time BETWEEN :start_date AND :end_date
),
signups AS (
  SELECT DISTINCT user_id FROM analytics.users
  WHERE signed_up_at BETWEEN :start_date AND :end_date
),
paid AS (
  SELECT DISTINCT user_id FROM analytics.users
  WHERE paid_at BETWEEN :start_date AND :end_date
)
SELECT
  (SELECT COUNT(*) FROM visitors) AS visitors,
  (SELECT COUNT(*) FROM signups) AS signups,
  (SELECT COUNT(*) FROM paid) AS paid_users,
  ROUND((SELECT COUNT(*) FROM signups)::numeric / NULLIF((SELECT COUNT(*) FROM visitors),0) * 100,2) AS signup_rate_pct,
  ROUND((SELECT COUNT(*) FROM paid)::numeric / NULLIF((SELECT COUNT(*) FROM signups),0) * 100,2) AS paid_rate_from_signup_pct
;
