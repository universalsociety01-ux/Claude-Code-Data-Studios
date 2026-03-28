# Review Workflow

Comprehensive review process for all code, data, and model changes in Data Studios projects.

## Review Philosophy

Every change is reviewed from multiple perspectives before approval. Reviews are not gatekeeping — they are collaborative quality assurance that catches issues early and spreads knowledge across the team.

## Four Review Perspectives

### 1. Standards Compliance
Checks adherence to coding standards defined in `.claude/rules/`.

| Check | Details |
|-------|---------|
| Style | PEP 8, type hints, docstrings, naming conventions |
| Imports | Organized (stdlib → third-party → local), no unused |
| Logging | `logging` module only, no `print()` in production |
| Exceptions | Specific exceptions, no bare `except:` |
| Constants | `UPPER_SNAKE_CASE`, no magic numbers |
| Line length | Maximum 120 characters |

### 2. Architecture
Evaluates structural quality and design patterns.

| Check | Details |
|-------|---------|
| Separation of concerns | Data loading separate from processing, models separate from serving |
| Modularity | Single responsibility, composable components |
| Dependencies | No circular imports, minimal coupling |
| Patterns | Consistent with existing codebase patterns |
| Scalability | Will this work at 10x data volume? |
| Testability | Can components be tested in isolation? |

### 3. Domain-Specific
Applies path-scoped rules based on what type of code changed.

| Path | Rule File | Key Checks |
|------|-----------|------------|
| `src/pipelines/` | `pipelines.md` | Idempotency, retry logic, config-driven |
| `src/models/` | `models.md` | Seeds, device-agnostic, no data loading |
| `src/features/` | `features.md` | No leakage, null handling, fit/transform |
| `src/data/` | `data.md` | Schema validation, encoding, immutable raw |
| `src/api/` | `api.md` | Pydantic validation, health checks, no PII |
| `src/monitoring/` | `monitoring.md` | Structured logging, metric naming, runbooks |
| `notebooks/` | `notebooks.md` | Sequential execution, no hardcoded paths |
| `tests/` | `tests.md` | Descriptive names, fixtures, deterministic |
| `configs/` | `configs.md` | Documented values, no secrets, defaults |
| SQL files | `sql.md` | CTEs, explicit columns, timezone-aware |

### 4. Security
Scans for security vulnerabilities and data protection issues.

| Check | Details |
|-------|---------|
| Secrets | No hardcoded credentials, API keys, tokens |
| PII | No personally identifiable information in logs or metrics |
| Injection | Input validation, parameterized queries |
| Access control | Proper authentication and authorization |
| Dependencies | No known vulnerabilities in packages |
| Data exposure | Sensitive data encrypted at rest and in transit |

## Review Verdicts

| Verdict | Meaning | Action |
|---------|---------|--------|
| **APPROVE** | No blocking issues found | Ready to merge/deploy |
| **REQUEST CHANGES** | Blocking issues identified | Must fix before proceeding |
| **DISCUSS** | Architectural questions or trade-offs | Needs team discussion before deciding |

## Specialized Review Types

### Data Review
Triggered when changes affect data schemas, pipelines, or datasets.

**Checklist:**
- [ ] Schema validation present on read and write boundaries
- [ ] Data quality checks (nulls, ranges, distributions)
- [ ] Data lineage documented (where does this data come from?)
- [ ] PII scan passed (no sensitive data exposed)
- [ ] Backward compatibility with existing consumers
- [ ] Data contracts updated if schema changed
- [ ] Null handling strategy documented

### Model Review
Triggered when changes affect model code, training, or deployment.

**Checklist:**
- [ ] Evaluation metrics meet thresholds (accuracy, F1, AUC, etc.)
- [ ] Fairness audit passed (bias across protected groups)
- [ ] Model card created or updated
- [ ] Reproducibility verified (seeds, data version, config version)
- [ ] No data leakage (temporal, target, or feature leakage)
- [ ] Inference latency benchmarked
- [ ] Model size and memory requirements documented
- [ ] Deployment readiness (export format, serving compatibility)
- [ ] Rollback plan defined

### Pipeline Review
Triggered when changes affect ETL/ELT pipelines.

**Checklist:**
- [ ] Idempotent (safe to re-run without side effects)
- [ ] Retry logic with exponential backoff
- [ ] Error handling with dead-letter queue or quarantine
- [ ] Checkpoint/resume for long-running jobs
- [ ] Monitoring and alerting configured
- [ ] Config-driven (no hardcoded paths or credentials)
- [ ] Resource cleanup (context managers, finally blocks)
- [ ] Backfill strategy documented

### API Review
Triggered when changes affect serving endpoints.

**Checklist:**
- [ ] Input validation with Pydantic models
- [ ] Health check endpoints (`/health`, `/ready`)
- [ ] Model version in response headers (`X-Model-Version`)
- [ ] Rate limiting configured
- [ ] Error responses structured (JSON with error codes)
- [ ] No PII in request/response logs
- [ ] Load tested under expected traffic
- [ ] Backward compatible (or versioned)

## Review by Code Type

| Code Type | Primary Reviewer | Additional Reviewer |
|-----------|-----------------|---------------------|
| Pipeline code | `data-engineering-lead` | `data-quality-engineer` |
| Model code | `ml-engineering-lead` | `experiment-analyst` |
| Feature code | `ml-engineering-lead` | `data-engineering-lead` |
| API code | `mlops-lead` | `security-engineer` |
| Schema changes | `data-director` | All downstream leads |
| Production deploys | `mlops-lead` + user | `monitoring-engineer` |
| Notebooks | `analytics-lead` | Domain specialist |
| Config changes | Team lead | `security-engineer` (if secrets-adjacent) |

## Review Process Flow

```
1. Author submits change
   │
2. Automated checks run (hooks, linting, tests)
   │ ← Blocks if checks fail
   │
3. Primary reviewer assigned based on code type
   │
4. Four-perspective review conducted
   │
5. Verdict issued
   │
   ├── APPROVE → Merge/deploy
   ├── REQUEST CHANGES → Author fixes → Back to step 2
   └── DISCUSS → Team discussion → Decision → Back to step 1
```

## Using the /code-review Skill

The `/code-review` skill automates the four-perspective review:

```
/code-review src/pipelines/user_events.py
```

This runs all four perspectives and produces a structured report with findings, severity levels, and suggested fixes.

## Cross-Team Reviews

Changes that span multiple domains require sign-off from each affected team:

| Change Scope | Required Sign-offs |
|-------------|-------------------|
| Schema change | `data-engineering-lead` + `ml-engineering-lead` + `analytics-lead` |
| Feature change | `ml-engineering-lead` + `data-engineering-lead` |
| API change | `mlops-lead` + downstream consumers |
| Infrastructure change | `platform-lead` + all affected leads |
