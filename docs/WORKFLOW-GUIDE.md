# Claude Code Data Studios: Workflow Guide

A comprehensive guide to the data/ML development workflow using Claude Code Data Studios — from project initialization to production deployment.

## Overview

Data Studios follows the **CRISP-DM** lifecycle, enhanced with agent coordination, automated hooks, and quality gates at every stage.

```
Phase 0: Setup ──→ Phase 1: Business Understanding ──→ Phase 2: Data Understanding
    │                                                          │
    │         ┌────────────────────────────────────────────────┘
    ▼         ▼
Phase 3: Data Preparation ──→ Phase 4: Modeling ──→ Phase 5: Evaluation
                                                          │
              ┌───────────────────────────────────────────┘
              ▼
Phase 6: Deployment ──→ Phase 7: Monitoring ──→ Phase 8: Iteration
```

---

## Phase 0: Setup & Configuration

### Goal
Establish your project environment, configure agents, and set up tooling.

### Steps

1. **Initialize the project**
   ```
   /start
   ```
   This detects your project state and loads context. If starting fresh, it scaffolds the directory structure.

2. **Configure your local settings**
   ```bash
   cp .claude/docs/CLAUDE-local-template.md CLAUDE.local.md
   cp .claude/docs/settings-local-template.md .claude/settings.local.json
   ```
   Edit both files with your project-specific details (team, stack, data sources).

3. **Set up Python environment**
   ```bash
   python -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

4. **Verify hooks work**
   ```bash
   bash .claude/hooks/session-start.sh
   bash .claude/hooks/detect-gaps.sh
   ```

### Key Agents
- `producer` — Sprint planning and milestone tracking
- `platform-lead` — Infrastructure setup

### Key Skills
- `/start` — Initialize or resume project
- `/onboard` — Generate onboarding docs for new team members

---

## Phase 1: Business Understanding

### Goal
Define the problem, success metrics, and project scope.

### Steps

1. **Define the problem statement**
   Use the collaboration protocol: agent asks questions about your domain, constraints, and success criteria.

2. **Scope the project**
   ```
   /scope-check
   ```
   Assess feasibility, estimate effort, identify risks.

3. **Plan the sprint**
   ```
   /sprint-plan
   ```
   Break work into manageable tasks with estimates.

4. **Map data systems**
   ```
   /map-systems
   ```
   Understand all data sources, dependencies, and flows.

### Key Agents
- `data-director` — Data strategy and architecture decisions
- `ml-director` — ML strategy and model lifecycle planning
- `business-analyst` — KPI definition and stakeholder alignment

### Deliverables
- Problem statement and success metrics
- Project scope document
- Sprint plan
- Data system map

---

## Phase 2: Data Understanding

### Goal
Explore available data, assess quality, and identify gaps.

### Steps

1. **Run exploratory data analysis**
   ```
   /eda
   ```
   Automated profiling, distribution analysis, correlation discovery.

2. **Audit data quality**
   ```
   /data-audit
   ```
   Check lineage, freshness, completeness, and accuracy.

3. **Run data quality checks**
   ```
   /data-quality-check
   ```
   Profile datasets, validate schemas, report anomalies.

4. **Document data sources**
   Use template: `.claude/docs/templates/dataset-catalog.md`

### Key Agents
- `data-analyst` — Exploratory analysis and visualization
- `data-quality-engineer` — Validation frameworks and testing
- `database-engineer` — Schema design and query optimization

### Deliverables
- EDA report (in `notebooks/exploration/`)
- Data quality report
- Dataset catalog
- Data dictionary

---

## Phase 3: Data Preparation

### Goal
Build pipelines to clean, transform, and prepare data for modeling.

### Steps

1. **Design the pipeline**
   ```
   /team-pipeline
   ```
   Orchestrate pipeline build with data engineering specialists.

2. **Review pipeline code**
   ```
   /pipeline-review
   ```
   Check for reliability, performance, idempotency.

3. **Engineer features**
   ```
   /feature-review
   ```
   Review features for leakage, skew, and quality.

4. **Validate data contracts**
   ```
   /schema-review
   ```
   Validate schema changes and assess downstream impact.

### Key Agents
- `data-engineering-lead` — Pipeline architecture
- `pipeline-engineer` — ETL/ELT implementation
- `feature-engineer` — Feature extraction and transformation
- `data-quality-engineer` — Validation at boundaries

### Quality Gates
- [ ] Pipeline is idempotent (safe to re-run)
- [ ] Schema validation at input/output boundaries
- [ ] Data quality checks pass
- [ ] No data leakage in features
- [ ] Config-driven (no hardcoded paths)

### Deliverables
- Pipeline code (in `src/pipelines/`)
- Feature code (in `src/features/`)
- Pipeline configs (in `configs/pipelines/`)
- Data contracts

---

## Phase 4: Modeling

### Goal
Train, tune, and evaluate models.

### Steps

1. **Develop the model**
   ```
   /team-ml
   ```
   Orchestrate model development with ML specialists.

2. **Track experiments**
   ```
   /experiment-track
   ```
   Log parameters, metrics, and artifacts.

3. **Run hyperparameter optimization**
   ```
   /hyperparameter-sweep
   ```
   Design and execute optimization strategy.

4. **Compare models**
   ```
   /model-compare
   ```
   Compare on metrics, latency, cost, and fairness.

5. **Prototype quickly**
   ```
   /prototype
   ```
   Rapidly validate an approach before full implementation.

### Key Agents
- `ml-engineering-lead` — Model development strategy
- `model-developer` — Architecture and training loops
- Domain specialists: `nlp-specialist`, `cv-specialist`, `tabular-specialist`, `timeseries-specialist`, `recommender-specialist`
- `deep-learning-engineer` — Custom architectures, GPU optimization

### Quality Gates
- [ ] All random sources seeded
- [ ] Experiment tracked with full params/metrics
- [ ] No data leakage verified
- [ ] Model config-driven (no hardcoded hyperparameters)
- [ ] Device-agnostic code

### Deliverables
- Model code (in `src/models/`)
- Experiment logs (in `experiments/`)
- Model configs (in `configs/models/`)
- Experiment notebooks (in `notebooks/experiments/`)

---

## Phase 5: Evaluation

### Goal
Rigorously evaluate the best model(s) before deployment.

### Steps

1. **Run comprehensive evaluation**
   ```
   /model-evaluate
   ```
   Metrics, fairness analysis, error analysis.

2. **Generate model card**
   ```
   /model-card
   ```
   Document model for governance and transparency.

3. **Run fairness audit**
   Use template: `.claude/docs/templates/fairness-audit.md`

4. **Run A/B test analysis** (if applicable)
   ```
   /ab-test-analyze
   ```

5. **Conduct design review**
   ```
   /design-review
   ```

### Key Agents
- `experiment-analyst` — Evaluation and statistical rigor
- `ml-engineering-lead` — Sign-off on model quality
- `data-analyst` — Business impact analysis

### Quality Gates
- [ ] Metrics meet predefined thresholds
- [ ] Fairness audit passed
- [ ] Model card complete
- [ ] Error analysis documented
- [ ] Baseline comparison done

### Deliverables
- Evaluation report
- Model card
- Fairness audit report
- A/B test results (if applicable)

---

## Phase 6: Deployment

### Goal
Deploy the model to production with proper safeguards.

### Steps

1. **Prepare deployment**
   ```
   /team-deploy
   ```
   Orchestrate with MLOps specialists.

2. **Run pre-release checks**
   ```
   /release-checklist
   ```
   Validate all gates before deployment.

3. **Run quality gate**
   ```
   /gate-check
   ```
   Tests, coverage, docs, model metrics.

4. **Deploy the model**
   ```
   /deploy-model
   ```
   Deploy to staging, validate, promote to production.

5. **Set up monitoring**
   ```
   /monitor-setup
   ```
   Configure drift detection, alerting, dashboards.

### Key Agents
- `mlops-lead` — Deployment strategy and approval
- `ml-deploy-engineer` — Model serving and packaging
- `monitoring-engineer` — Observability setup
- `infrastructure-engineer` — Kubernetes, cloud, scaling

### Quality Gates (Handoff: ML → MLOps)
- [ ] Model card complete
- [ ] Metrics meet thresholds
- [ ] Export format specified
- [ ] Inference benchmarked
- [ ] Integration tests pass
- [ ] Monitoring configured
- [ ] Rollback tested
- [ ] Load tested
- [ ] SLA defined

### Deliverables
- API code (in `src/api/`)
- Monitoring config (in `src/monitoring/`)
- Infrastructure config (in `configs/infrastructure/`)
- Deployment runbook

---

## Phase 7: Monitoring & Operations

### Goal
Monitor production models and maintain data quality.

### Steps

1. **Check for drift**
   ```
   /drift-check
   ```
   Data drift and model drift detection.

2. **Generate cost report**
   ```
   /cost-report
   ```
   Cloud and compute cost analysis.

3. **Handle incidents**
   ```
   /incident-response
   ```
   Investigate and respond to production issues.

4. **Rollback if needed**
   ```
   /rollback
   ```
   Revert to previous model or pipeline version.

### Key Agents
- `monitoring-engineer` — Drift detection and alerting
- `cost-analyst` — Cloud spend optimization
- `infrastructure-engineer` — Scaling and reliability

---

## Phase 8: Iteration

### Goal
Continuously improve models, pipelines, and processes.

### Steps

1. **Review sprint**
   ```
   /retrospective
   ```

2. **Audit technical debt**
   ```
   /tech-debt
   ```

3. **Plan retraining**
   Use template: `.claude/docs/templates/retraining-strategy.md`

4. **Review milestones**
   ```
   /milestone-review
   ```

5. **Generate changelog**
   ```
   /changelog
   ```

### Key Agents
- `producer` — Sprint review and planning
- `research-lead` — Novel approaches and improvements
- `ml-engineering-lead` — Retraining strategy

---

## Cross-Phase Skills

These skills are useful across multiple phases:

| Skill | Purpose |
|-------|---------|
| `/code-review` | Multi-perspective code review |
| `/estimate` | Effort estimation for data/ML tasks |
| `/bug-report` | Structured bug reporting |
| `/patch-notes` | Write update notes |
| `/reverse-document` | Document existing undocumented code |
| `/perf-profile` | Profile and optimize performance |
| `/cohort-analysis` | Run cohort analysis |

## Hook Automation

Throughout all phases, hooks run automatically:

| Phase | Active Hooks |
|-------|-------------|
| All | `session-start.sh` (context loading), `detect-gaps.sh` (coverage scanning) |
| Development | `validate-commit.sh` (commit quality), `validate-assets.sh` (file validation) |
| Deployment | `validate-push.sh` (test + lint before push) |
| Context management | `pre-compact.sh` (state preservation) |
| Observability | `log-agent.sh` (agent tracking) |

## Tips for Effective Workflows

1. **Start every session with `/start`** — loads full project context
2. **Use `/map-systems` before diving into code** — understand dependencies first
3. **Track experiments religiously** — use `/experiment-track` for every training run
4. **Review before merging** — use `/code-review` and domain-specific reviews
5. **Monitor after deploying** — set up `/monitor-setup` immediately
6. **Iterate in sprints** — use `/sprint-plan` and `/retrospective` for structure
7. **Document decisions** — use ADR templates for architecture choices
8. **Keep context alive** — write findings to files so they survive compaction
