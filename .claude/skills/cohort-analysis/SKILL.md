---
name: Cohort Analysis
description: Run cohort analysis on user/event data
---

# /cohort-analysis

## Purpose
Analyze user behavior and retention across cohorts.

## Workflow
1. Define cohort criteria (signup date, first action, etc.)
2. Build cohort matrix
3. Calculate retention curves
4. Compare cohorts for significant differences
5. Visualize results
6. Generate insights report

## Agents Involved
- product-analyst (execution)
- data-viz-specialist (visualization)

## Inputs
- User/event data, cohort definition

## Outputs
- Cohort retention matrix and curves
- Insights report

## Example Usage
```
/cohort-analysis --data users --cohort signup_month --metric retention_d30
```
