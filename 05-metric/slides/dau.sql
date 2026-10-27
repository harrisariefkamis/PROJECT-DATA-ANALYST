-- DAU (Daily Active Users) - sintaks PostgreSQL
SELECT
  event_date AS day,
  COUNT(DISTINCT user_id) AS dau
FROM events
WHERE event_name = 'session'
GROUP BY 1
ORDER BY 1;
