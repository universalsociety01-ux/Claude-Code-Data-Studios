---
name: Deploy Model
description: Deploy model to staging/production with validation gates
---
# /deploy-model
## Purpose
Deploy a trained model through validation gates to staging or production.
## Workflow
1. Validate model card exists and is complete
2. Run evaluation suite on held-out test set
3. Check fairness and bias metrics
4. Package model for serving (container/endpoint)
5. Deploy to staging, run smoke tests
6. Promote to production (with user approval)
7. Configure monitoring and alerting
## Agents Involved
- mlops-lead (coordination), ml-deploy-engineer (execution), monitoring-engineer (monitoring setup)
## Inputs
- Model path, target environment (staging/production)
## Outputs
- Deployed endpoint URL, monitoring dashboard link
## Example Usage
```
/deploy-model --model models/staging/churn_v3 --env production
```
