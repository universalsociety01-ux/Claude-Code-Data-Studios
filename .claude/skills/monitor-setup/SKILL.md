---
name: Monitor Setup
description: Set up monitoring for a deployed model
---
# /monitor-setup
## Purpose
Configure comprehensive monitoring for a production model.
## Workflow
1. Define SLOs (latency, error rate, throughput)
2. Set up data drift detection
3. Configure performance tracking
4. Create alerting rules with runbook links
5. Build monitoring dashboard
## Agents Involved
- monitoring-engineer (execution), mlops-lead (review)
## Inputs
- Model/endpoint name
## Outputs
- Monitoring configuration, dashboard, alert rules
## Example Usage
```
/monitor-setup --model fraud_detector_v2
```
