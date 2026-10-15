# SQL Interview Case Studies — Slides (Ringkas)

## Fokus utama
- Aggregation + GROUP BY
- Window functions (ROW_NUMBER, LAG, SUM OVER)
- CTE untuk memecah langkah analitis
- Sessionization patterns
- Deduplication pattern (ROW_NUMBER)
- Retention & cohort patterns

## Contoh pattern: Top-N per group
1. Aggregate per group  
2. Rank using ROW_NUMBER() OVER (PARTITION BY group ORDER BY metric DESC)  
3. Filter rank <= N

## Contoh pattern: Sessionization
- Use LAG to compute gap  
- Flag new session when gap > threshold  
- Cumulate flags to form session id

## Contoh pattern: Deduplication
- ROW_NUMBER() OVER (PARTITION BY dedupe_key ORDER BY priority DESC, ts DESC)  
- Take row_number = 1

## Tips wawancara
- Clarify, show sample output, break down steps, write iteratively, test edge cases, comment on performance.
