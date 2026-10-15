# Advanced Case: Transaction Data Cleaning & QA (for advanced analysts)

Goal: Clean and prepare an e-commerce transaction dataset for analysis and modeling. This case covers advanced topics: schema reconciliation, deduplication across sources, timezone-aware timestamp cleaning, data quality checks, outlier detection, and instrumentation for pipeline monitoring.

Sample dataset: `data/sample_transactions.csv` (columns: tx_id, user_id, event_time, amount, currency, product_id, channel, raw_notes)

Suggested steps & examples (pandas & SQL):

1. Load and normalize schema

- If multiple sources exist (e.g., `events` and `payments`), map columns to canonical names.
- Standardize NULL values and strip whitespace from strings.

```python
import pandas as pd
df = pd.read_csv('06-data-cleaning/data/sample_transactions.csv')
# normalize column names
df.columns = [c.strip().lower() for c in df.columns]
# trim strings
str_cols = df.select_dtypes(include='object').columns
df[str_cols] = df[str_cols].apply(lambda s: s.str.strip())
```

2. Parse timestamps with timezone handling

```python
df['event_time'] = pd.to_datetime(df['event_time'], utc=True, errors='coerce')
# convert to local timezone if needed
# df['event_time_local'] = df['event_time'].dt.tz_convert('Asia/Jakarta')
```

3. Deduplicate and resolve conflicts

- Some tx_id may be duplicated with slightly different fields. Keep the most complete record (non-null fields) or latest updated_at.

```python
# simple: keep first non-null by sorting completeness
cols = ['tx_id','user_id','amount','event_time']
df['non_null_count'] = df[cols].notna().sum(axis=1)
df = df.sort_values(['tx_id','non_null_count'], ascending=[True, False])
df = df.drop_duplicates(subset=['tx_id'], keep='first')
```

4. Currency & amount normalization

- If amounts are in multiple currencies, convert to a canonical currency using FX table. Example uses a provided mapping.

```python
fx = {'USD':1.0, 'IDR':1/15000.0}  # sample
df['amount_usd'] = df.apply(lambda r: r['amount'] * fx.get(r['currency'], 1.0), axis=1)
```

5. Outlier detection and handling

- Use robust statistical rules (IQR, z-score) or domain rules (max allowed amount)

```python
q1 = df['amount_usd'].quantile(0.25)
q3 = df['amount_usd'].quantile(0.75)
irq = q3 - q1
lower = q1 - 1.5 * irq
upper = q3 + 1.5 * irq
outliers = df[(df['amount_usd'] < lower) | (df['amount_usd'] > upper)]
```

6. Implement data quality checks & metrics

- Row counts per day (expected vs actual)
- Null rate per column
- Uniqueness of tx_id
- Schema drift detection (new columns)

Example checks (pandas):

```python
# null rates
null_rates = df.isna().mean()
# uniqueness
tx_unique = df['tx_id'].nunique() == len(df)
# daily counts
daily_counts = df.groupby(df['event_time'].dt.date).size()
```

7. SQL examples for dedup and basic QA (Postgres-like)

```sql
-- Find duplicate tx_ids
SELECT tx_id, COUNT(*) as cnt
FROM staging.transactions
GROUP BY tx_id
HAVING COUNT(*) > 1;

-- Daily row counts compare to previous day
SELECT date_trunc('day', event_time) as day, COUNT(*) as rows
FROM analytics.transactions
GROUP BY 1
ORDER BY 1 DESC
LIMIT 30;
```

8. Pipeline recommendations

- Add a schema registry / tracking plan that defines required fields and types.
- Validate incoming events at ingestion and tag malformed rows for review.
- Implement an automated daily QA job that runs checks and sends alerts (Slack/email) on anomalies.
- Version metric and schema changes; keep changelog.

9. Testing and reproducibility

- Create a small synthetic sample dataset and unit tests for cleaning functions (pytest).
- Example test: ensure `clean_amount()` correctly handles NaN and currency codes.

10. Documentation & metadata

- For each cleaned table, include provenance metadata: source, transformation time, row counts, and sample hash.

---

Advanced practitioners: extend the case by adding streaming deduplication (Kafka + idempotent writes), or by building a data quality dashboard (Great Expectations / dbt tests / Monte Carlo data observability).
