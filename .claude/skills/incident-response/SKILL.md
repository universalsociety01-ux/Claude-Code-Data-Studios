---
name: Incident Response
description: Investigate and respond to data/model incidents
---
# /incident-response
## Purpose
Structured incident response for data quality or model performance issues.
## Workflow
1. Assess severity and impact
2. Identify affected systems and users
3. Investigate root cause
4. Implement mitigation (rollback, feature flag, etc.)
5. Communicate status
6. Write post-mortem
## Agents Involved
- producer (coordination), mlops-lead (technical), monitoring-engineer (investigation)
## Inputs
- Incident description, severity
## Outputs
- Incident timeline, root cause analysis, post-mortem document
## Example Usage
```
/incident-response --severity high --description "Fraud model latency spike"
```
