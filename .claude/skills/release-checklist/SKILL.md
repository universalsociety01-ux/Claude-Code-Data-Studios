---
name: Release Checklist
description: Pre-release validation checklist
---
# /release-checklist
## Purpose
Comprehensive pre-release validation checklist.
## Workflow
1. Verify all tests pass
2. Check model performance metrics
3. Validate monitoring is configured
4. Review rollback procedures
5. Check documentation is up-to-date
6. Verify security scan
7. Confirm stakeholder sign-off
## Agents Involved
- producer (coordination), all leads (domain checks)
## Inputs
- Release version
## Outputs
- Release checklist with status per item
## Example Usage
```
/release-checklist --version v2.0.0
```
