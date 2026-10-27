# Metric Spec Template

Gunakan template ini untuk mendokumentasikan setiap metrik. Simpan metric spec di repo sebagai sumber kebenaran.

| Field | Description | Example |
|---|---|---|
| Name | Short canonical metric name (snake_case) | retention_d7 |
| Display name | Human-friendly name | 7-day retention |
| Owner | Team or person responsible | Product / Data PM |
| Definition | One-sentence definition | % of users who return on day 7 after signup |
| SQL / Formula | SQL query or formula used to compute metric | (see SQL in /05-metric/sql/retention_cohort.sql) |
| Time grain | Reporting grain (daily/weekly/monthly) | daily cohort result |
| Dimensions | Slice-by columns (country, platform, plan) | country, platform |
| Data sources | Source tables / events | analytics.users, analytics.events |
| Inclusion rules | Who is included / excluded | Only users with non-null signup_at, exclude test accounts |
| Edge cases | Notes on ties, duplicates, timezone | Use UTC; dedupe by user_id and event_id |
| SLO / Target | Optional target or SLO | retention_d7 >= 25% |
| Notes | Additional context / version history | v1 defined 2026-10-15 by @owner |

---

## Example: retention_d7 (filled)
```teks
- Name: retention_d7
- Display name: 7-day retention
- Owner: Product / Data PM
- Definition: Percent of users who performed the event `open_app` on day 7 after their signup day.
- SQL / Formula: See `05-metric/sql/retention_cohort.sql` (filter event_name = 'open_app')
- Time grain: daily cohorts, reported as retention % per cohort
- Dimensions: platform, country
- Data sources: analytics.users(signup_at), analytics.events(event_time, event_name)
- Inclusion rules: exclude internal/test users (user_id starting with 'test_'); only include signups with signup_at in [start,end]
- Edge cases: handle timezone by truncating timestamps to UTC date; treat multiple events same day as single return
- SLO / Target: >= 25% after 7 days
- Notes: v1 created 2026-10-15
```
