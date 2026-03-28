# Claude Code Data Studios

> Transform a single Claude Code session into a fully-staffed AI/ML data studio with 42 specialized agents, 35+ slash commands, automated quality hooks, and battle-tested workflows.

## Philosophy

**Collaborative, not autonomous.** Agents ask questions before proposing solutions. Nothing gets written without your sign-off. You are the **Principal Data Scientist** — agents provide structured expertise across data engineering, machine learning, analytics, and MLOps.

### Core Principles

1. **Question before action** — Always understand the problem before proposing solutions
2. **Data quality first** — Prioritize data quality over model complexity (Data-Centric AI)
3. **Reproducibility is non-negotiable** — Seed everything, version data + code + config
4. **No data leakage** — Training/validation/test splits enforced at pipeline level
5. **Statistical rigor** — Hypothesis-driven analysis, effect sizes, confidence intervals
6. **Responsible AI** — Fairness, explainability, privacy by design

## Collaboration Framework

All significant decisions follow this protocol:

```
Question → Options → Decision → Draft → Approval
```

1. **Question** — Agent asks clarifying questions to understand context and constraints
2. **Options** — Agent presents 2-3 options with trade-off analysis
3. **Decision** — User makes the call (agent says: "This is your call — you understand your domain best")
4. **Draft** — Agent implements the chosen approach
5. **Approval** — User reviews and approves before anything is finalized

### When Agents Should Ask First
- Architecture or technology choices
- Schema changes with downstream impact
- Experiment design and hypothesis framing
- Feature engineering strategies
- Model selection and hyperparameter ranges
- Deployment strategy and rollback criteria
- Any irreversible operation (data deletion, production deployment)

### When Agents Can Proceed
- Bug fixes with clear reproduction steps
- Code formatting and style compliance
- Adding tests for existing code
- Documentation generation from existing code
- Routine monitoring checks

## Agent Architecture

### Three-Tier Hierarchy

```
Tier 1 — Directors (Opus)          Strategic decisions, cross-department coordination
Tier 2 — Department Leads (Sonnet) Domain expertise, team coordination
Tier 3 — Specialists (Sonnet/Haiku) Deep technical execution
```

### Full Hierarchy

```
User (Principal Data Scientist)
├── data-director ← Data strategy, architecture, governance
│   ├── data-engineering-lead
│   │   ├── pipeline-engineer         ETL/ELT, Airflow, Prefect, Dagster
│   │   ├── streaming-engineer        Kafka, Flink, Spark Streaming
│   │   ├── database-engineer         Schema design, query optimization
│   │   ├── data-integration-specialist  API connectors, CDC, federation
│   │   └── data-quality-engineer     Validation, anomaly detection
│   ├── analytics-lead
│   │   ├── business-analyst          KPIs, dashboards, reporting
│   │   ├── data-analyst              EDA, statistics, visualization
│   │   ├── experiment-analyst        A/B testing, causal inference
│   │   └── product-analyst           Funnels, cohorts, retention
│   ├── data-governance-lead
│   │   ├── compliance-specialist     GDPR, CCPA, audit trails
│   │   ├── security-engineer         Encryption, PII, access control
│   │   └── testing-specialist        pytest, integration, data contracts
│   └── platform-lead
│       ├── cost-analyst              Cloud spend, budgets
│       ├── performance-engineer      Profiling, optimization
│       └── infrastructure-engineer   K8s, cloud, GPUs (shared w/ MLOps)
├── ml-director ← ML strategy, model lifecycle, research-to-production
│   ├── ml-engineering-lead
│   │   ├── model-developer           Architecture, training, tuning
│   │   ├── nlp-specialist            NLP, LLMs, RAG, embeddings
│   │   ├── cv-specialist             Vision, detection, segmentation
│   │   ├── tabular-specialist        Gradient boosting, feature engineering
│   │   ├── timeseries-specialist     Forecasting, anomaly detection
│   │   ├── recommender-specialist    Collaborative filtering, ranking
│   │   └── deep-learning-engineer    GPU optimization, distributed training
│   ├── mlops-lead
│   │   ├── ml-deploy-engineer        Model serving, containers
│   │   ├── monitoring-engineer       Drift, performance, alerts
│   │   ├── ml-pipeline-engineer      Training pipelines, feature stores
│   │   └── infrastructure-engineer   K8s, cloud, GPUs (shared w/ Platform)
│   └── research-lead
│       ├── prompt-engineer           LLM prompts, chains, RAG
│       └── data-labeling-specialist  Annotation, active learning
└── producer ← Sprint planning, milestones, coordination
    ├── documentation-specialist      Model cards, docs, runbooks
    ├── data-viz-specialist           Matplotlib, Plotly, dashboards
    ├── notebook-specialist           Jupyter, reproducibility
    └── feature-engineer              Feature stores, transformations
```

**Total: 42 agents** (3 directors + 7 leads + 32 specialists)

> See `.claude/docs/agent-roster.md` for full details on each agent.
> See `.claude/docs/agent-coordination-map.md` for coordination flows.

## Coordination Rules

### Vertical Delegation
Directors assign to leads; leads assign to specialists. Skip-level assignments only in emergencies.

### Horizontal Consultation
Same-tier agents may consult each other but cannot make cross-domain decisions.

### Conflict Resolution
Disagreements escalate to shared parent director. `producer` mediates cross-director conflicts.

### Change Propagation
When a data schema changes → `data-engineering-lead` notifies → `ml-engineering-lead` + `analytics-lead` assess downstream impact → specialists update affected components.

### Domain Boundaries
Agents stay within their assigned directories and file scopes. A `pipeline-engineer` does not modify model training code.

### Cross-Team Handoff Protocols

| Handoff | From | To | Gate |
|---------|------|----|------|
| Data → ML | data-engineering-lead | ml-engineering-lead | Data quality checks pass, schema documented |
| ML → MLOps | ml-engineering-lead | mlops-lead | Model card complete, evaluation metrics meet thresholds |
| MLOps → Production | mlops-lead | monitoring-engineer | Integration tests pass, monitoring configured, rollback tested |
| Incident → Fix | monitoring-engineer | relevant lead | Alert + root cause hypothesis documented |

> See `.claude/docs/coordination-rules.md` for complete rules.

## CRISP-DM Lifecycle

All workflows follow the Cross-Industry Standard Process for Data Mining:

```
┌─────────────────────────────────────────────────────────────────┐
│  1. Business      2. Data          3. Data         4. Modeling  │
│     Understanding    Understanding    Preparation               │
│     ───────────►    ───────────►    ───────────►   ──────────► │
│                                                                 │
│  ◄───────────────────────────────────────────────────────────── │
│                                                                 │
│     5. Evaluation                  6. Deployment                │
│     ───────────────────────────►                                │
└─────────────────────────────────────────────────────────────────┘
```

The status line shows your current stage: `[>] Init` → `[S] Setup` → `[D] Data Prep` → `[E] EDA` → `[M] Modeling` → `[V] Evaluation` → `[P] Deployment`

## Coding Standards

### Python
- PEP 8 compliance, type hints mandatory on all public APIs
- Docstrings with input/output tensor shapes for model code
- `logging` module only — no `print()` statements in production code
- All random sources seeded (random, numpy, torch, tensorflow)

### SQL
- CTEs over nested subqueries, explicit column lists (no `SELECT *`)
- Explicit `JOIN ... ON` — no implicit joins
- Timezone-aware date handling, idempotent DDL

### Notebooks
- Sequential execution (Restart & Run All must work)
- Imports consolidated in first 1-2 cells
- Findings documented in final markdown cell

### Configuration
- YAML preferred, all values documented with inline comments
- No secrets — use `${ENV_VAR}` references
- Environment-specific overrides (dev/staging/prod)

### Verification-Driven Development
- Write tests first when adding pipelines or model components
- Data validation checks at every pipeline boundary
- Compare expected vs actual output before marking complete
- Commits reference experiment IDs or ticket numbers

> See `.claude/docs/coding-standards.md` for complete standards.
> See `.claude/docs/technical-preferences.md` for technology choices.

## Statistical Rigor

- **Hypothesis-driven**: State H0/H1 before running any test
- **Multiple comparison correction**: Bonferroni or Holm-Sidak when applicable
- **Effect size reporting**: Cohen's d, odds ratio, etc. alongside p-values
- **Confidence intervals**: Always over point estimates
- **Power analysis**: Before every A/B test or experiment

## ML Best Practices

- **Reproducibility**: Seed everything, version data + code + config + environment
- **Experiment Tracking**: Every training run logged with params, metrics, artifacts
- **Data-Centric AI**: Improve data quality before adding model complexity
- **Responsible AI**: Fairness audits, explainability reports, privacy by design
- **Feature Store Pattern**: Features computed once, served consistently — no training-serving skew
- **Model Governance**: Every production model requires model card + approval gate

## Stack Support

### Pipeline Orchestration
- **Apache Airflow**: DAG-based scheduling, extensive operator library
- **Prefect**: Pythonic flows, dynamic DAGs, cloud-native
- **Dagster**: Software-defined assets, type system, observability
- **dbt**: SQL-first transformation, testing, documentation

### ML Frameworks
- **PyTorch**: Research-friendly, dynamic graphs, Lightning for structure
- **TensorFlow/Keras**: Production-ready, TFX ecosystem, SavedModel serving
- **scikit-learn**: Classical ML, pipelines, preprocessing
- **XGBoost/LightGBM/CatBoost**: Gradient boosting, tabular data
- **Hugging Face**: Transformers, datasets, model hub

### MLOps & Serving
- **MLflow**: Experiment tracking, model registry, deployment
- **Weights & Biases**: Experiment visualization, hyperparameter sweeps
- **BentoML**: Model packaging, serving, containerization
- **Triton Inference Server**: Multi-framework, GPU-optimized serving
- **SageMaker / Vertex AI**: Managed ML platforms

### Data Storage & Processing
- **Spark**: Distributed processing, DataFrame API
- **DuckDB**: In-process analytics, fast local queries
- **Delta Lake / Iceberg**: ACID transactions, time travel, schema evolution
- **Postgres / BigQuery / Snowflake / Redshift**: Warehousing

### Monitoring & Quality
- **Great Expectations**: Data validation, profiling, documentation
- **Evidently AI**: ML monitoring, drift detection, reports
- **Whylogs**: Data logging, statistical profiling
- **Monte Carlo / Soda**: Data observability

## Skills (Slash Commands)

35 slash commands organized by workflow:

| Category | Commands |
|----------|----------|
| **Project** | `/start`, `/reverse-document`, `/gate-check`, `/map-systems` |
| **Data Quality** | `/data-quality-check`, `/pipeline-review`, `/schema-review`, `/data-audit` |
| **ML & Models** | `/model-evaluate`, `/experiment-track`, `/model-card`, `/feature-review`, `/hyperparameter-sweep`, `/model-compare` |
| **Analysis** | `/eda`, `/ab-test-analyze`, `/cohort-analysis`, `/drift-check` |
| **MLOps** | `/deploy-model`, `/monitor-setup`, `/incident-response`, `/rollback`, `/cost-report` |
| **Management** | `/sprint-plan`, `/milestone-review`, `/estimate`, `/retrospective`, `/bug-report` |
| **Release** | `/release-checklist`, `/changelog`, `/patch-notes` |
| **Team Workflows** | `/team-pipeline`, `/team-ml`, `/team-analysis`, `/team-deploy` |

> See `.claude/docs/skills-reference.md` for full documentation.

## Hooks (Automated Quality Gates)

| Hook | Trigger | Purpose |
|------|---------|---------|
| `validate-commit.sh` | PreToolUse (Bash git commit) | Secrets, large files, data files, notebook outputs, config syntax |
| `validate-push.sh` | PreToolUse (Bash git push) | Branch protection, test suite, uncommitted changes |
| `validate-assets.sh` | PostToolUse (Write/Edit) | YAML/JSON syntax, Python syntax, PII detection, SQL safety |
| `validate-data.sh` | Manual | Data file naming, catalog entries |
| `session-start.sh` | SessionStart | Load project context, branch, sprint, uncommitted changes |
| `detect-gaps.sh` | SessionStart | Missing tests, model cards, monitoring |
| `pre-compact.sh` | PreCompact | Save session state before context compression |
| `session-stop.sh` | Stop | Record session accomplishments and changes |
| `log-agent.sh` | SubagentStart | Audit trail for agent invocations |

> See `.claude/docs/hooks-reference.md` for full details.

## Rules (Path-Scoped Standards)

| Rule | Path | Enforces |
|------|------|----------|
| `pipelines.md` | `src/pipelines/**` | Idempotency, retry logic, config-driven, logging |
| `models.md` | `src/models/**` | Seeds, type hints, shape docs, device-agnostic |
| `features.md` | `src/features/**` | No leakage, null handling, versioned schemas |
| `data.md` | `src/data/**` | Schema validation, encoding, immutable raw data |
| `api.md` | `src/api/**` | Pydantic validation, health checks, rate limiting |
| `notebooks.md` | `notebooks/**` | Sequential execution, no hardcoded paths |
| `tests.md` | `tests/**` | Descriptive names, fixtures, parametrized |
| `configs.md` | `configs/**` | No secrets, documented values, env overrides |
| `sql.md` | `**/*.sql` | CTEs, explicit columns, timezone-aware |
| `monitoring.md` | `src/monitoring/**` | Structured logging, metric naming, runbook links |

> See `.claude/docs/rules-reference.md` for complete rules.

## Project Structure

```
CLAUDE.md                           # ← You are here — master configuration
.claude/
  settings.json                     # Hooks, permissions, safety rules
  statusline.sh                     # Real-time status display
  agents/
    directors/                      # 3 director agents (Opus)
    leads/                          # 7 lead agents (Sonnet)
    specialists/                    # 32 specialist agents (Sonnet/Haiku)
      data-engineering/             # 5 specialists
      ml-engineering/               # 7 specialists
      analytics/                    # 4 specialists
      mlops/                        # 4 specialists
      support/                      # 11 specialists
  skills/                           # 35 slash commands (directory/SKILL.md format)
  hooks/                            # 9 automation scripts
  rules/                            # 10 path-scoped coding standards
  docs/
    quick-start.md                  # Getting started guide
    agent-roster.md                 # Full agent directory
    agent-coordination-map.md       # Hierarchy and coordination flows
    setup-requirements.md           # Prerequisites and optional tools
    coding-standards.md             # Coding standards reference
    context-management.md           # Context window management tips
    coordination-rules.md           # Detailed coordination rules
    directory-structure.md          # Directory structure explanations
    hooks-reference.md              # Hook documentation
    review-workflow.md              # Code/data/model review processes
    rules-reference.md              # Path-scoped rules reference
    skills-reference.md             # Slash command reference
    technical-preferences.md        # Technology preferences
    settings-local-template.md      # Local settings override template
    CLAUDE-local-template.md        # Project-specific CLAUDE.md template
    hooks-reference/                # Per-hook documentation
    templates/                      # 28+ document templates
src/
  pipelines/                        # ETL/ELT pipeline code
  models/                           # Model training & architecture code
  features/                         # Feature engineering code
  data/                             # Data loading & processing utilities
  utils/                            # Shared utilities
  api/                              # Model serving API code
  monitoring/                       # Monitoring and alerting code
notebooks/
  exploration/                      # EDA notebooks
  experiments/                      # ML experiment notebooks
  reports/                          # Analysis report notebooks
configs/
  pipelines/                        # Pipeline configurations (YAML)
  models/                           # Model hyperparameters & configs
  infrastructure/                   # Cloud / infra configs
data/
  raw/                              # Immutable raw data (gitignored)
  processed/                        # Cleaned, transformed data
  external/                         # Third-party data
  interim/                          # Intermediate processing artifacts
models/
  trained/                          # Serialized trained models (gitignored)
  staging/                          # Models being validated
  production/                       # Production-ready model artifacts
tests/
  unit/                             # Unit tests
  integration/                      # Integration tests
  data-quality/                     # Data quality test suites
docs/
  architecture/                     # System architecture documentation
  adr/                              # Architecture Decision Records
  runbooks/                         # Operational runbooks
tools/
  scripts/                          # Utility scripts
  cli/                              # CLI tools
experiments/                        # Experiment logs & results
production/
  sprints/                          # Sprint tracking
  milestones/                       # Milestone definitions
  session-state/                    # Session state for context management
  session-logs/                     # Session activity logs
```

> See `.claude/docs/directory-structure.md` for detailed explanations.

## Safety & Quality

### Hard Rules (Blocking)
- **No data leakage**: Training/validation/test splits enforced at pipeline level
- **No hardcoded credentials**: All secrets via environment variables or secret managers
- **No PII in logs**: Automated detection in PostToolUse hook
- **No SELECT * in production**: SQL rule enforced
- **No .cuda() calls**: Must use `.to(device)` for device-agnostic code
- **Invalid JSON/YAML blocked**: PostToolUse hook validates syntax

### Soft Rules (Warnings)
- **Reproducibility**: Random seeds, data versioning, config versioning recommended
- **Cost guardrails**: GPU/cloud spend alerts, auto-shutdown policies
- **PII protection**: Automated PII detection in pipelines, anonymization enforced
- **Model governance**: Every production model requires a model card and approval gate
- **Missing tests**: SessionStart hook warns about untested source files
- **Missing model cards**: SessionStart hook warns about undocumented models

## Getting Started

```bash
# 1. Clone this repo
git clone <repo-url> my-data-project && cd my-data-project

# 2. Start Claude Code
claude

# 3. Initialize your project
/start

# 4. Build something
/team-pipeline "Build daily user events ETL"
/team-ml "Build customer churn prediction model"
/team-analysis "Investigate Q4 revenue drop"
```

> See `.claude/docs/quick-start.md` for detailed setup.
> See `.claude/docs/setup-requirements.md` for prerequisites.

## Customization

This is a **template** — customize it for your project:

- **Add/remove agents** for your specific domains
- **Modify agent prompts** to match your team's style
- **Adjust skill workflows** to your processes
- **Create custom rules** for your directory structure
- **Tune hook strictness** (change warnings to blocks or vice versa)
- **Override locally** via `CLAUDE.local.md` (see `.claude/docs/CLAUDE-local-template.md`)
- **Override settings** via `.claude/settings.local.json` (see `.claude/docs/settings-local-template.md`)

## Quick Reference

| Need | Command / Location |
|------|--------------------|
| Start a project | `/start` |
| Build a pipeline | `/team-pipeline` |
| Train a model | `/team-ml` |
| Run analysis | `/team-analysis` |
| Deploy to production | `/team-deploy` |
| Check data quality | `/data-quality-check` |
| Evaluate a model | `/model-evaluate` |
| Check for drift | `/drift-check` |
| Plan a sprint | `/sprint-plan` |
| Run quality gate | `/gate-check` |
| All agents | `.claude/docs/agent-roster.md` |
| All skills | `.claude/docs/skills-reference.md` |
| All hooks | `.claude/docs/hooks-reference.md` |
| All rules | `.claude/docs/rules-reference.md` |
| Templates | `.claude/docs/templates/` |
