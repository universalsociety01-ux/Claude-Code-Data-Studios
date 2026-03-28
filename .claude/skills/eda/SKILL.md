---
name: EDA
description: Run exploratory data analysis with automated profiling
---

# /eda

## Purpose
Run automated exploratory data analysis on a dataset.

## Workflow
1. Load and profile dataset (shape, types, nulls)
2. Generate distribution plots for all columns
3. Compute correlations and relationships
4. Identify outliers and anomalies
5. Summarize key findings
6. Create EDA notebook

## Agents Involved
- data-analyst (execution)
- data-viz-specialist (visualizations)

## Inputs
- Dataset path

## Outputs
- EDA notebook in notebooks/exploration/
- Summary of key findings

## Example Usage
```
/eda data/processed/transactions.parquet
```
