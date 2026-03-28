---
name: Feature Review
description: Review feature engineering for leakage, skew, and quality
---

# /feature-review

## Purpose
Review feature engineering code for data leakage, training-serving skew, and quality.

## Workflow
1. Analyze feature transformations
2. Check for future data leakage
3. Verify training-serving consistency
4. Review null handling
5. Check feature documentation
6. Generate review report

## Agents Involved
- feature-engineer (primary review)
- ml-engineering-lead (oversight)

## Inputs
- Feature engineering file or directory

## Outputs
- Review report with findings
- Leakage risk assessment
- Skew risk assessment

## Example Usage
```
/feature-review src/features/user_features.py
```
