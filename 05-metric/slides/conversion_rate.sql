-- Conversion rate signup -> purchase dalam 7 hari, per channel - sintaks PostgreSQL
SELECT
  u.channel,
  COUNT(DISTINCT u.user_id) AS signups,
  COUNT(DISTINCT e.user_id) AS buyers,
  ROUND(100.0 * COUNT(DISTINCT e.user_id) / COUNT(DISTINCT u.user_id), 1) AS conversion_pct
FROM users u
LEFT JOIN events e
  ON e.user_id = u.user_id
 AND e.event_name = 'purchase'
 AND e.event_date <= u.signup_date + 7
WHERE u.signup_date + 7 <= (SELECT MAX(event_date) FROM events)
GROUP BY 1
ORDER BY 1;
