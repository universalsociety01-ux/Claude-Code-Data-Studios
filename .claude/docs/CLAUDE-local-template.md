# CLAUDE.local.md Template

Template for `CLAUDE.local.md` — your project-specific overrides that extend or modify the base `CLAUDE.md` configuration. This file is gitignored and will not be committed.

## Setup

```bash
cp .claude/docs/CLAUDE-local-template.md CLAUDE.local.md
# Then edit CLAUDE.local.md with your project details
```

## Template

Copy everything below this line into your `CLAUDE.local.md`:

---

```markdown
# CLAUDE.local.md

## Project Identity

- **Project name:** [Your Project Name]
- **Team:** [Team name / members]
- **Domain:** [e.g., e-commerce recommendations, fraud detection, NLP platform]
- **Repository:** [GitHub/GitLab URL]

## Stack Overrides

Override any default from `.claude/docs/technical-preferences.md`:

<!-- Uncomment and modify lines relevant to your project -->
<!-- - Use TensorFlow instead of PyTorch (existing TF codebase) -->
<!-- - Use Airflow instead of Prefect (company standard) -->
<!-- - Use Snowflake instead of BigQuery (existing warehouse) -->
<!-- - Use GitLab CI instead of GitHub Actions -->
<!-- - Use Datadog instead of Prometheus + Grafana -->

## Active Agents

Only activate agents relevant to your project. This reduces noise and focuses recommendations:

### Always Active
- `data-director`, `ml-director`, `producer`
- `data-engineering-lead`, `ml-engineering-lead`

### Activate as Needed
<!-- Uncomment agents you need -->
<!-- - `analytics-lead` + analytics specialists -->
<!-- - `mlops-lead` + MLOps specialists -->
<!-- - `research-lead` -->
<!-- - `data-governance-lead` -->
<!-- - `platform-lead` -->

## Data Sources

Document your data connections so agents understand what's available:

| Source | Type | Location | Refresh | Notes |
|--------|------|----------|---------|-------|
| <!-- users --> | <!-- PostgreSQL --> | <!-- prod-db.example.com --> | <!-- Real-time --> | <!-- PII: yes --> |
| <!-- events --> | <!-- Kafka --> | <!-- kafka.example.com --> | <!-- Streaming --> | <!-- Retention: 30d --> |
| <!-- features --> | <!-- S3 --> | <!-- s3://my-bucket/features/ --> | <!-- Daily --> | <!-- Parquet --> |

## Environment Variables

Required environment variables for this project:

```bash
# Database
export DB_HOST=localhost
export DB_PORT=5432
export DB_NAME=myproject
export DB_PASSWORD=  # from secrets manager

# Cloud
export AWS_PROFILE=myproject-dev
export AWS_REGION=us-east-1

# ML
export MLFLOW_TRACKING_URI=http://localhost:5000
export WANDB_PROJECT=myproject
export WANDB_API_KEY=  # from secrets manager

# API Keys
export HF_TOKEN=  # Hugging Face token
```

## Project-Specific Rules

Add rules that apply only to this project:

<!-- Example rules: -->
<!-- - All models must achieve >0.85 F1 before production consideration -->
<!-- - Pipeline SLA: all daily jobs complete by 06:00 UTC -->
<!-- - Maximum inference latency: 100ms p99 -->
<!-- - Data retention: 90 days for raw, 1 year for aggregated -->
<!-- - All new features require A/B test before full rollout -->

## Known Issues & Technical Debt

Document ongoing issues so agents don't waste time rediscovering them:

| Issue | Impact | Status | Notes |
|-------|--------|--------|-------|
| <!-- Legacy auth middleware --> | <!-- High --> | <!-- In progress --> | <!-- Replacing by Q2 --> |
| <!-- Slow query in user_features --> | <!-- Medium --> | <!-- Known --> | <!-- Needs index optimization --> |

## Deployment Constraints

| Constraint | Value | Notes |
|-----------|-------|-------|
| Deployment window | <!-- Tue-Thu, 10am-4pm UTC --> | <!-- No Friday deploys --> |
| Approval required | <!-- Yes, from ML lead --> | <!-- For model changes --> |
| Canary duration | <!-- 2 hours --> | <!-- Before full rollout --> |
| Rollback SLA | <!-- < 5 minutes --> | <!-- Automated rollback on alert --> |

## Compliance Requirements

<!-- Uncomment applicable requirements -->
<!-- - GDPR: EU user data must be deletable on request -->
<!-- - CCPA: California user data opt-out supported -->
<!-- - SOC 2: Audit logs for all data access -->
<!-- - HIPAA: Health data encrypted, access logged -->
<!-- - PCI DSS: Payment data isolated, tokenized -->

## Team Communication

| Channel | Purpose |
|---------|---------|
| <!-- #ml-team (Slack) --> | <!-- Daily updates, questions --> |
| <!-- Linear: PROJECT --> | <!-- Task tracking --> |
| <!-- Confluence: ML Wiki --> | <!-- Documentation --> |
| <!-- Grafana dashboard --> | <!-- Production monitoring --> |

## Sprint Context

<!-- Update this each sprint -->
<!-- Current sprint: Sprint 14 (2026-03-15 to 2026-03-29) -->
<!-- Sprint goal: Improve recommendation model accuracy by 5% -->
<!-- Key milestones: -->
<!-- - [ ] Feature engineering complete (Mar 20) -->
<!-- - [ ] Model training and evaluation (Mar 25) -->
<!-- - [ ] A/B test launch (Mar 28) -->
```

## Usage Notes

- `CLAUDE.local.md` is loaded alongside `CLAUDE.md` at session start
- Local overrides take precedence over base configuration
- Keep this file updated as your project evolves
- Commented-out sections serve as reminders of available configuration options
- Delete sections you don't need to keep the file concise
