# Rules Reference

10 path-scoped rules automatically enforce coding standards when editing files that match the path pattern.

## How Rules Work

- Rules are in `.claude/rules/` as Markdown files
- Each rule specifies a path pattern in its frontmatter
- When you edit a file matching the pattern, Claude Code applies the rule
- Rules define: Standards, Required Patterns, Forbidden Patterns, Review Checklist

## All Rules

### 1. Pipelines (`src/pipelines/**`)

**Standards:** All operations idempotent, retry with backoff, structured logging, config-driven, checkpoint/resume, dead-letter queue.

**Required:** Logger at module level, config from YAML/env, schema validation at boundaries, resource cleanup.

**Forbidden:** Hardcoded paths or credentials, silent exception swallowing (`except: pass`), global mutable state, inline secrets.

**Checklist:** Idempotent, retry logic, logging, config-driven, error handling, tests, monitoring.

### 2. Models (`src/models/**`)

**Standards:** Seed all random sources, type hints mandatory, docstrings with tensor shapes, no data loading in model code, config-driven hyperparameters, device-agnostic.

**Required:** `__init__(self, config: ModelConfig)` pattern, type hints, shape docs `# (batch, seq_len, hidden)`, explicit device handling.

**Forbidden:** Data loading in model classes, hardcoded hyperparameters, `.cuda()` calls, unseeded random, print statements.

**Checklist:** Seeds set, type hints, docstrings, no data loading, config-driven, device-agnostic, experiment logged.

### 3. Features (`src/features/**`)

**Standards:** No future data leakage, handle nulls explicitly, document semantics, batch+online compatible, versioned schemas.

**Required:** Transformer pattern (fit/transform), null handling documented per feature, feature metadata.

**Forbidden:** Future data in computation, implicit null handling, batch-only features, unversioned schemas.

**Checklist:** No leakage, null handling, semantics documented, batch+online, versioned.

### 4. Data (`src/data/**`)

**Standards:** Schema validation on read, null handling documented, encoding explicit (UTF-8), data contracts, raw data immutable, processed data versioned.

**Required:** Schema validation, explicit encoding, null handling docs.

**Forbidden:** Modifying raw data, implicit encoding, schema-less reading, silent null dropping.

**Checklist:** Schema validation, null handling, encoding, immutable raw, contracts defined.

### 5. API (`src/api/**`)

**Standards:** Pydantic input validation, structured errors, health check endpoint, request/response logging (no PII), rate limiting, model version in headers, async for I/O.

**Required:** Pydantic models, `X-Model-Version` header, `/health` and `/ready`, structured JSON errors.

**Forbidden:** Unvalidated input to model, PII in logs, synchronous blocking I/O, missing error handling.

**Checklist:** Pydantic validation, health check, version header, structured errors, rate limiting.

### 6. Notebooks (`notebooks/**`)

**Standards:** Clear headers, sequential execution, no hardcoded paths, imports at top, conclusions at end, seeds stated.

**Required:** Title/objective in first cell, imports in cells 1-2, findings in final cell, data sources documented.

**Forbidden:** Hardcoded absolute paths, scattered imports, fails on Restart & Run All, outputs in git.

**Checklist:** Sequential, no hardcoded paths, imports at top, conclusions, seeds, outputs cleared.

### 7. Tests (`tests/**`)

**Standards:** Descriptive names `test_<what>_<condition>_<expected>`, fixtures, parametrized, no sleeping, deterministic, happy+error paths.

**Required:** Descriptive naming, fixtures, `@pytest.mark.parametrize`, clear assertion messages.

**Forbidden:** `time.sleep()`, execution order dependence, hardcoded paths, tests that pass when broken.

**Checklist:** Descriptive names, fixtures, edge cases, deterministic, happy+error paths.

### 8. Configs (`configs/**`)

**Standards:** YAML preferred, all values documented, environment overrides, no secrets, schema validation, sensible defaults.

**Required:** Comments for non-obvious values, env var references for secrets `${DB_PASSWORD}`, defaults section.

**Forbidden:** Secrets/passwords/API keys, undocumented magic numbers, no override mechanism.

**Checklist:** All documented, no secrets, defaults present, env overrides, valid syntax.

### 9. SQL (`**/*.sql`)

**Standards:** CTEs over subqueries, explicit column lists, explicit JOINs, timezone-aware, cost comments, idempotent DDL.

**Required:** `WITH cte AS (...)`, explicit columns, `ON` clause, comments for logic.

**Forbidden:** `SELECT *`, implicit joins, timezone-naive comparisons, DDL without IF EXISTS.

**Checklist:** CTEs used, no SELECT *, explicit JOINs, timezone-aware, idempotent DDL.

### 10. Monitoring (`src/monitoring/**`)

**Standards:** Structured JSON logging, metric naming `<service>_<domain>_<metric>_<unit>`, alert thresholds documented, runbook links, SLO-based, no PII, correlation IDs.

**Required:** JSON log entries, metric naming convention, alert runbook URLs, correlation IDs.

**Forbidden:** PII in logs/metrics, alerts without runbooks, unstructured logs, undocumented thresholds.

**Checklist:** JSON logging, naming convention, runbook links, no PII, correlation IDs.

## Creating Custom Rules

Create a new `.md` file in `.claude/rules/` with:

```yaml
---
path: your/path/pattern/**
description: What this rule enforces
---
```

Then add Standards, Required Patterns, Forbidden Patterns, and Review Checklist sections.

## Overriding Rules

Rules can be overridden locally via `CLAUDE.local.md` or by creating a more specific path-scoped rule.
