# Directory Structure

Complete guide to the project directory layout, ownership, and conventions.

## Root Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Master configuration — loaded by Claude Code every session |
| `README.md` | Project overview for GitHub |
| `LICENSE` | MIT License |
| `SECURITY.md` | Security policy and built-in protections |
| `CONTRIBUTING.md` | Contribution guidelines |
| `CODE_OF_CONDUCT.md` | Contributor Covenant |
| `.gitignore` | Git exclusions (data, models, secrets, caches) |

## `.claude/` — Claude Code Configuration

| Path | Purpose |
|------|---------|
| `settings.json` | Hooks, permissions, safety rules — the runtime configuration |
| `statusline.sh` | Real-time status bar (stage, branch, experiment, sprint) |
| `agents/directors/` | 3 director agents (Opus) — strategic decisions |
| `agents/leads/` | 7 lead agents (Sonnet) — domain coordination |
| `agents/specialists/` | 31 specialist agents — deep execution |
| `skills/` | 42 slash commands in `{name}/SKILL.md` format |
| `hooks/` | 9 bash scripts for automated validation |
| `rules/` | 10 path-scoped coding standards |
| `docs/` | Framework documentation, templates, references |
| `docs/templates/` | 28 document templates |
| `docs/hooks-reference/` | Per-hook documentation |
| `session-state/` | Saved session state (auto-created by pre-compact hook) |
| `agent-logs/` | Agent invocation audit trail (auto-created) |

## `src/` — Production Source Code

| Directory | Owner | Rule File | Purpose |
|-----------|-------|-----------|---------|
| `src/pipelines/` | data-engineering-lead | `pipelines.md` | ETL/ELT pipeline code |
| `src/models/` | ml-engineering-lead | `models.md` | Model architectures and training loops |
| `src/features/` | feature-engineer | `features.md` | Feature engineering and transformations |
| `src/data/` | data-engineering-lead | `data.md` | Data loading, processing, validation |
| `src/utils/` | shared | — | Common utility functions |
| `src/api/` | mlops-lead | `api.md` | Model serving API (FastAPI) |
| `src/monitoring/` | monitoring-engineer | `monitoring.md` | Drift detection, alerting, dashboards |

## `data/` — Data Assets

| Directory | Mutable? | Gitignored? | Purpose |
|-----------|----------|-------------|---------|
| `data/raw/` | **NO** (immutable) | Yes | Original raw data — never modify |
| `data/processed/` | Yes | Selective | Cleaned, transformed data |
| `data/external/` | Yes | Selective | Third-party reference data |
| `data/interim/` | Yes | Selective | Intermediate processing artifacts |

**Naming convention:** snake_case, lowercase, no spaces. Example: `user_events_2024_q1.parquet`

**Documentation:** Each subdirectory with data should contain `README.md` or `schema.yaml`.

## `models/` — Model Artifacts

| Directory | Purpose | Gitignored? |
|-----------|---------|-------------|
| `models/trained/` | Serialized models from training runs | Yes |
| `models/staging/` | Models being validated pre-production | No |
| `models/production/` | Production-ready artifacts | Yes (use registry) |

**Requirement:** Every model directory must contain `MODEL_CARD.md`. Use template: `.claude/docs/templates/model-card.md`

## `notebooks/` — Jupyter Notebooks

| Directory | Purpose |
|-----------|---------|
| `notebooks/exploration/` | Exploratory Data Analysis |
| `notebooks/experiments/` | ML experiment notebooks |
| `notebooks/reports/` | Analysis report notebooks |

**Rule:** `notebooks.md` — sequential execution, imports at top, no hardcoded paths, outputs cleared.

**Naming:** `YYYY-MM-DD-descriptive-name.ipynb`

## `configs/` — Configuration Files

| Directory | Purpose |
|-----------|---------|
| `configs/pipelines/` | Pipeline configurations (YAML) |
| `configs/models/` | Model hyperparameters and training configs |
| `configs/infrastructure/` | Cloud and infrastructure configs |

**Rule:** `configs.md` — YAML preferred, documented values, no secrets, env overrides.

## `tests/` — Test Suites

| Directory | Purpose |
|-----------|---------|
| `tests/unit/` | Unit tests for individual functions |
| `tests/integration/` | Integration tests for pipelines and APIs |
| `tests/data-quality/` | Data quality validation test suites |

**Rule:** `tests.md` — descriptive names, fixtures, parametrized, deterministic.

## `docs/` — Project Documentation

| Directory | Purpose | Template |
|-----------|---------|----------|
| `docs/architecture/` | System architecture documents | `ml-system-design.md` |
| `docs/adr/` | Architecture Decision Records | `adr.md` |
| `docs/runbooks/` | Operational runbooks | `runbook.md` |

## Other Directories

| Directory | Purpose |
|-----------|---------|
| `experiments/` | Experiment logs and results. Naming: `YYYY-MM-DD-name.md` |
| `production/sprints/` | Sprint planning and tracking documents |
| `production/milestones/` | Milestone definitions and progress |
| `production/session-state/` | Active task tracking (auto-managed) |
| `production/session-logs/` | Session activity logs (auto-created by hook) |
| `tools/scripts/` | Utility scripts (data processing, maintenance) |
| `tools/cli/` | CLI tools for common operations |
