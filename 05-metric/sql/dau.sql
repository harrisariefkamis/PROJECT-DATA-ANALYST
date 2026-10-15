-- dau.sql
-- Daily Active Users (DAU) based on an engagement event (e.g., 'open_app')

SELECT
  DATE_TRUNC('day', event_time)::date AS day,
  COUNT(DISTINCT user_id) AS dau
FROM analytics.events
WHERE event_name IN ('open_app','view_item','purchase') -- choose representative engagement events
  AND event_time BETWEEN CURRENT_DATE - INTERVAL '90 days' AND CURRENT_DATE
GROUP BY 1
ORDER BY 1 DESC;
