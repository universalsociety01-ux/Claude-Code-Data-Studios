---
name: Data Quality Check
description: Run data validation suite, profile datasets, report anomalies
---

# /data-quality-check

## Purpose
Run comprehensive data quality checks on a dataset or pipeline output.

## Workflow
1. Identify target dataset or table
2. Run schema validation (column types, constraints)
3. Profile data (distributions, nulls, cardinality)
4. Check for anomalies (outliers, unexpected patterns)
5. Compare against historical baselines
6. Generate quality report with pass/fail status

## Agents Involved
- data-quality-engineer (primary executor)
- data-engineering-lead (review)

## Inputs
- Dataset path or table name
- Optional: expected schema, quality thresholds

## Outputs
- Quality report with metrics and pass/fail
- Anomaly alerts if detected
- Profiling summary

## Example Usage
```
/data-quality-check data/processed/users.parquet
/data-quality-check --table analytics.events --since 2024-01-01
```
