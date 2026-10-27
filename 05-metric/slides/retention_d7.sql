-- Retention cohort day-7 - sintaks PostgreSQL
WITH signups AS (
  SELECT user_id, event_date AS signup_date
  FROM events
  WHERE event_name = 'signup'
),
active AS (
  SELECT DISTINCT user_id, event_date
  FROM events
  WHERE event_name = 'session'
)
SELECT
  s.signup_date,
  COUNT(DISTINCT s.user_id) AS cohort_size,
  COUNT(DISTINCT a.user_id) AS retained_d7,
  ROUND(100.0 * COUNT(DISTINCT a.user_id) / COUNT(DISTINCT s.user_id), 1) AS d7_retention_pct
FROM signups s
LEFT JOIN active a
  ON a.user_id = s.user_id
 AND a.event_date = s.signup_date + 7
WHERE s.signup_date + 7 <= (SELECT MAX(event_date) FROM events)  -- hanya cohort yang sudah genap 7 hari
GROUP BY 1
ORDER BY 1;
