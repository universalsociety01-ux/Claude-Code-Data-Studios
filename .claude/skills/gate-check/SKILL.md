---
name: Gate Check
description: Run quality gate - tests, coverage, docs, model metrics
---
# /gate-check
## Purpose
Run comprehensive quality gate before a milestone or release.
## Workflow
1. Run all tests (unit, integration, data quality)
2. Check code coverage
3. Verify documentation completeness
4. Validate model metrics meet thresholds
5. Check security scan results
6. Generate gate report (pass/fail)
## Agents Involved
- producer (coordination), testing-specialist, data-quality-engineer, security-engineer
## Inputs
- Gate name (pre-merge, pre-deploy, pre-release)
## Outputs
- Gate check report with pass/fail per criterion
## Example Usage
```
/gate-check --gate pre-deploy
```
