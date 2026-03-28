---
name: Drift Check
description: Check for data drift and model drift in production
---

# /drift-check

## Purpose
Detect data and concept drift in production models.

## Workflow
1. Load reference (training) and current (production) data
2. Compute feature distribution drift (PSI, KS test)
3. Check prediction distribution changes
4. Compare model performance vs baseline
5. Generate drift report with severity

## Agents Involved
- monitoring-engineer (execution)
- ml-engineering-lead (assessment)

## Inputs
- Model name or endpoint
- Time range for comparison

## Outputs
- Drift report with severity levels
- Feature-level drift scores
- Recommendation (retrain/monitor/ok)

## Example Usage
```
/drift-check --model fraud_detector --window 7d
```
