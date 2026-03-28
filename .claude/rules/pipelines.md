---
path: src/pipelines/**
description: Standards for data pipeline code
---

# Rules for Data Pipelines

## Standards
- All operations must be idempotent (safe to re-run)
- Retry logic with exponential backoff on transient failures
- Structured logging at each pipeline stage
- Config-driven behavior (no hardcoded paths, credentials, or thresholds)
- Checkpoint/resume support for long-running pipelines
- Dead-letter queue or quarantine for failed records

## Required Patterns
- Logger initialized at module level
- Configuration loaded from YAML/env, never hardcoded
- Input/output schema validation at boundaries
- Proper resource cleanup (context managers, try/finally)

## Forbidden Patterns
- Hardcoded file paths or connection strings
- Silent exception swallowing (bare `except: pass`)
- Global mutable state
- Inline credentials or secrets
- Non-idempotent writes without deduplication

## Review Checklist
- [ ] Pipeline is idempotent
- [ ] Retry logic with backoff present
- [ ] Logging at each stage
- [ ] Config-driven (no hardcoded values)
- [ ] Error handling with quarantine
- [ ] Tests cover happy path and failures
- [ ] Monitoring/alerting configured
