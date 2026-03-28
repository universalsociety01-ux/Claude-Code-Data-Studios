---
name: Cost Report
description: Generate cloud/compute cost analysis report
---
# /cost-report
## Purpose
Analyze and report on cloud and compute spending.
## Workflow
1. Gather cost data by service/team/project
2. Identify top cost drivers
3. Compare against budget
4. Find optimization opportunities
5. Generate report with recommendations
## Agents Involved
- cost-analyst (execution), platform-lead (review)
## Inputs
- Time range, optional: team/project filter
## Outputs
- Cost breakdown report, optimization recommendations
## Example Usage
```
/cost-report --period last-30d --by team
```
