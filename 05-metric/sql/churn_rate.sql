-- churn_rate.sql
-- Monthly churn rate based on active customers in subscription model
-- Assumes table subscriptions(user_id, period_start, period_end, status)

WITH active_by_month AS (
  SELECT DATE_TRUNC('month', period_start)::date AS month, COUNT(DISTINCT user_id) AS active_users
  FROM analytics.subscriptions
  WHERE status = 'active'
  GROUP BY 1
),
churn_events AS (
  SELECT DATE_TRUNC('month', period_end)::date AS month, COUNT(DISTINCT user_id) AS churned_users
  FROM analytics.subscriptions
  WHERE status IN ('canceled','expired') AND period_end IS NOT NULL
  GROUP BY 1
)
SELECT
  a.month,
  a.active_users,
  COALESCE(c.churned_users,0) AS churned_users,
  ROUND(COALESCE(c.churned_users,0)::numeric / NULLIF(a.active_users,0) * 100,2) AS churn_rate_pct
FROM active_by_month a
LEFT JOIN churn_events c USING (month)
ORDER BY month DESC
LIMIT 24;
