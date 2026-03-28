---
name: Pipeline Review
description: Review pipeline code for reliability, performance, and best practices
---

# /pipeline-review

## Purpose
Comprehensive code review of a data pipeline for idempotency, error handling, performance, and observability.

## Workflow
1. Read pipeline code and configuration
2. Check idempotency and resumability
3. Review error handling and retry logic
4. Assess performance and resource usage
5. Verify logging and monitoring
6. Check data validation at boundaries
7. Generate review report with recommendations

## Agents Involved
- pipeline-engineer (technical review)
- data-engineering-lead (architecture review)

## Inputs
- Pipeline file path or directory

## Outputs
- Review report with findings and recommendations
- Severity ratings (critical/warning/info)

## Example Usage
```
/pipeline-review src/pipelines/user_events.py
```
