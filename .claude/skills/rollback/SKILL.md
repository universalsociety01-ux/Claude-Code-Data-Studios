---
name: Rollback
description: Rollback a model or pipeline to previous version
---
# /rollback
## Purpose
Safely rollback a model or pipeline to a known-good previous version.
## Workflow
1. Identify current and target versions
2. Validate target version is available
3. Execute rollback
4. Run smoke tests
5. Verify monitoring shows improvement
6. Communicate rollback
## Agents Involved
- mlops-lead (decision), ml-deploy-engineer (execution)
## Inputs
- Model/pipeline name, target version
## Outputs
- Rollback confirmation, validation results
## Example Usage
```
/rollback --model fraud_detector --to v2.1.0
```
