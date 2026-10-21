![Statistics](https://img.shields.io/badge/Statistics-Expert-8B5CF6?labelColor=1E293B&logo=scipy&logoColor=white)
![Data Cleaning](https://img.shields.io/badge/Data%20Cleaning-Advanced-10B981?labelColor=1E293B&logo=pandas&logoColor=white)
![Metrics](https://img.shields.io/badge/Metrics-Analytics-3B82F6?labelColor=1E293B&logo=googleanalytics&logoColor=white)
# Metrics for Product & Analytics — Formal Guide

## Purpose
Dokumen ini ditujukan untuk tim produk dan analytics startup/scale-up yang ingin mendirikan praktik pengukuran (measurement) yang dapat dioperasionalkan, terkontrol, dan dapat dipercaya.

## Executive summary
- Pilih satu North Star Metric yang merepresentasikan value delivery.
- Lengkapi dengan 3–5 supporting metrics yang menjelaskan funnel dan kualitas pengalaman.
- Standarisasi definisi metrik di metric spec (repo).
- Pastikan instrumentasi event-driven dengan schema registry dan monitoring kualitas data.

## Roles & responsibilities
- Product Manager: menentukan NSM dan prioritas eksperimen.
- Data/Product Analyst: implementasi definisi, query, dashboard, analytics.
- Engineering: instrumentasi event, menjaga kualitas pipeline.
- Data Platform/Owner: schema registry, pipelines, access control.

## Measurement lifecycle
1. Define: write metric spec with precise definition and SQL
2. Implement: instrument events, publish to analytics warehouse
3. Validate: data QA, reconciliation against source systems
4. Monitor: dashboards + alerts for metric and pipeline health
5. Iterate: version metric spec when definition changes (keep history)

## Governance & versioning
- Store metric specs in git (this repo) and tag versions (v1, v2)
- Use change request process for metric definition changes (PR + sign-off from product & data)
- Maintain a changelog for each metric and communicate impact on historical dashboards

## Data quality & monitoring
- Key checks: row counts, null rate, uniqueness of IDs, schema drift
- Nightly job to validate expected daily counts; alert if deviation > X%
- Sample-based reconciliation between event store and warehouse

## Practical templates & artifacts (in repo)
- Metric spec template (`05-metric/metric_spec_template.md`)
- Example SQL queries (`05-metric/sql/*.sql`)
- Slide deck summary (`05-metric/slides/metrics_presentation.md`)

## Recommended next steps
- Run a metrics discovery workshop with stakeholders to identify NSM + supporting metrics
- Create metric specs for top 5 metrics and implement monitoring in next sprint
- Add dashboards and simple alerts (e.g., Slack) for sudden drops or pipeline failures

---

Prepared for: Product & Analytics teams
Date: 2026-10-15
Author: Data Team / Analytics
