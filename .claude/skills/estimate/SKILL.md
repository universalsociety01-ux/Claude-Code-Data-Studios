---
name: Estimate
description: Estimate effort for data/ML tasks
---
# /estimate
## Purpose
Provide effort estimates for data and ML tasks accounting for typical uncertainties.
## Workflow
1. Break task into subtasks
2. Estimate each subtask with confidence ranges
3. Account for ML-specific risks (data issues, convergence)
4. Provide optimistic/likely/pessimistic estimates
5. Identify assumptions and dependencies
## Agents Involved
- producer (methodology), relevant lead (domain expertise)
## Inputs
- Task description
## Outputs
- Estimate with breakdown and risk factors
## Example Usage
```
/estimate "Build churn prediction model from scratch"
```
