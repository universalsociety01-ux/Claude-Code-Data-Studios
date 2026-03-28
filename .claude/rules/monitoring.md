---
path: src/monitoring/**
description: Standards for monitoring and observability code
---

# Rules for Monitoring

## Standards
- Structured logging (JSON format)
- Metric naming: `<service>_<domain>_<metric>_<unit>`
- Alert thresholds documented with rationale
- Runbook links in every alert definition
- SLO-based monitoring (not just threshold)
- No PII in logs or metrics
- Correlation IDs for request tracing

## Required Patterns
- JSON-structured log entries
- Metric names following convention
- Alert definitions include runbook URL
- Correlation ID in log context

## Forbidden Patterns
- PII in log messages or metric labels
- Alerts without runbook links
- Unstructured log messages
- Magic threshold numbers without documentation

## Review Checklist
- [ ] Structured JSON logging
- [ ] Metric naming convention followed
- [ ] Alerts have runbook links
- [ ] No PII in logs
- [ ] Correlation IDs present
