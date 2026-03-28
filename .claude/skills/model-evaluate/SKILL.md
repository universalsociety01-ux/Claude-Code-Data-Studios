---
name: Model Evaluate
description: Run model evaluation with metrics, fairness, and error analysis
---

# /model-evaluate

## Purpose
Comprehensive model evaluation including performance metrics, fairness analysis, robustness checks, and error analysis.

## Workflow
1. Load model and test dataset
2. Compute performance metrics (accuracy, F1, AUC, RMSE, etc.)
3. Run fairness analysis across protected groups
4. Perform error analysis (confusion matrix, worst cases)
5. Check robustness (noise, perturbations)
6. Generate evaluation report

## Agents Involved
- model-developer (evaluation execution)
- ml-engineering-lead (review)
- experiment-analyst (statistical validation)

## Inputs
- Model path or experiment ID
- Test dataset path
- Optional: fairness groups, custom metrics

## Outputs
- Evaluation report with all metrics
- Fairness analysis results
- Error analysis with examples
- Recommendation (promote/iterate/reject)

## Example Usage
```
/model-evaluate --model models/trained/churn_v2 --test data/processed/test.parquet
```
