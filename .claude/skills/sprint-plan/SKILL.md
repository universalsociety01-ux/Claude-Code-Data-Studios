---
name: Sprint Plan
description: Plan sprint with data/ML task estimation
---
# /sprint-plan
## Purpose
Plan a sprint with properly estimated data and ML tasks.
## Workflow
1. Review backlog and priorities
2. Estimate tasks (data prep, modeling, evaluation, deployment)
3. Account for ML-specific uncertainties
4. Allocate agent resources
5. Define sprint goals and success criteria
6. Generate sprint plan document
## Agents Involved
- producer (coordination), all leads (estimation)
## Inputs
- Sprint duration, priority items
## Outputs
- Sprint plan in production/sprints/
## Example Usage
```
/sprint-plan --duration 2w --priorities "churn model v3, pipeline refactor"
```
