---
name: Model Compare
description: Compare multiple models on metrics, latency, cost, and fairness
---

# /model-compare

## Purpose
Side-by-side comparison of multiple models across all relevant dimensions.

## Workflow
1. Load all candidate models
2. Evaluate on same test set
3. Compare metrics, latency, memory, cost
4. Compare fairness across groups
5. Generate comparison report with recommendation

## Agents Involved
- ml-engineering-lead (comparison design)
- model-developer (execution)
- experiment-analyst (statistical comparison)

## Inputs
- List of model paths or experiment IDs
- Test dataset

## Outputs
- Comparison table and visualizations
- Statistical significance tests
- Recommendation with rationale

## Example Usage
```
/model-compare --models "churn_xgb_v2,churn_lgbm_v1,churn_nn_v1" --test data/processed/test.parquet
```
