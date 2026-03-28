---
name: Experiment Track
description: Log experiment with parameters, metrics, and artifacts
---

# /experiment-track

## Purpose
Log a complete experiment run with all parameters, metrics, artifacts, and conclusions.

## Workflow
1. Capture experiment metadata (name, hypothesis, date)
2. Log all parameters and configuration
3. Record metrics and results
4. Save artifacts (model, plots, data samples)
5. Write experiment summary with conclusions
6. Update experiment catalog

## Agents Involved
- model-developer (experiment execution)
- documentation-specialist (logging)

## Inputs
- Experiment name and hypothesis
- Parameters and results (auto-detected if MLflow/W&B configured)

## Outputs
- Experiment log entry
- Artifacts saved to experiment directory
- Updated experiment catalog

## Example Usage
```
/experiment-track --name "churn_xgb_v3" --hypothesis "Adding recency features improves AUC"
```
