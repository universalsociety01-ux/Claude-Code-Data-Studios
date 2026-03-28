# Project Documentation

This directory contains project-specific documentation generated during development.

## Top-Level Documents

| Document | Purpose |
|----------|---------|
| [COLLABORATIVE-DESIGN-PRINCIPLE.md](COLLABORATIVE-DESIGN-PRINCIPLE.md) | Core principle: user-driven collaboration, not autonomous AI |
| [WORKFLOW-GUIDE.md](WORKFLOW-GUIDE.md) | Complete 8-phase workflow from setup to production |

## Directory Structure

| Directory | Purpose | Contents |
|-----------|---------|----------|
| [architecture/](architecture/) | System architecture documents, diagrams, design docs | Use template: `.claude/docs/templates/ml-system-design.md` |
| [adr/](adr/) | Architecture Decision Records | Use template: `.claude/docs/templates/adr.md` |
| [runbooks/](runbooks/) | Operational runbooks for common procedures | Use template: `.claude/docs/templates/runbook.md` |
| [examples/](examples/) | Annotated session transcripts showing agent collaboration | 4 workflow examples |
| [framework-reference/](framework-reference/) | Version-pinned framework docs for agents | PyTorch, scikit-learn, XGBoost, etc. |

## Examples

Annotated session transcripts demonstrating the collaborative workflow:

| Example | Phase | Duration |
|---------|-------|----------|
| [Design a Feature Pipeline](examples/session-design-feature-pipeline.md) | Data Preparation | ~40 min |
| [Train a Classification Model](examples/session-train-classification-model.md) | Modeling | ~35 min |
| [Handle a Data Incident](examples/session-data-incident-response.md) | Monitoring | ~25 min |
| [Deploy Model to Production](examples/session-deploy-model.md) | Deployment | ~30 min |

## Framework Reference

Version-pinned documentation so agents don't suggest outdated APIs:

| Framework | Directory | Use |
|-----------|-----------|-----|
| PyTorch | [framework-reference/pytorch/](framework-reference/pytorch/) | Deep learning |
| scikit-learn | framework-reference/sklearn/ | Classical ML |
| XGBoost | framework-reference/xgboost/ | Gradient boosting |
| Hugging Face | framework-reference/huggingface/ | Transformers, NLP |
| FastAPI | framework-reference/fastapi/ | Model serving |
| Prefect | framework-reference/prefect/ | Pipeline orchestration |
| MLflow | framework-reference/mlflow/ | Experiment tracking |

> Only PyTorch is populated as a reference example. Add framework docs as needed for your project.

## Framework Documentation (in .claude/docs/)

| Document | Purpose |
|----------|---------|
| quick-start.md | Getting started guide |
| agent-roster.md | All 42 agents with roles and expertise |
| agent-coordination-map.md | Agent hierarchy and coordination flows |
| coding-standards.md | Python, SQL, notebook, config standards |
| context-management.md | How to manage Claude Code context window |
| coordination-rules.md | Agent delegation, handoff, and conflict rules |
| directory-structure.md | Project directory explanations |
| hooks-reference.md | All 9 automation hooks |
| review-workflow.md | Code, data, and model review processes |
| rules-reference.md | 10 path-scoped coding standards |
| skills-reference.md | All 42 slash commands |
| technical-preferences.md | Default technology choices |
| setup-requirements.md | Prerequisites and setup |
| settings-local-template.md | How to customize settings |
| CLAUDE-local-template.md | How to customize CLAUDE.md |

## Templates (in .claude/docs/templates/)

28 document templates for common data/ML artifacts:

| Category | Templates |
|----------|-----------|
| Models | model-card, model-evaluation-report, fairness-audit, retraining-strategy |
| Data | data-contract, dataset-catalog, data-dictionary, data-governance-policy |
| Architecture | adr, ml-system-design, pipeline-spec, feature-spec |
| Operations | runbook, deployment-runbook, monitoring-config, sla-definition, incident-report |
| Analysis | experiment-log, ab-test-design, performance-benchmark, cost-analysis |
| Management | sprint-plan, retrospective, stakeholder-update, migration-plan, onboarding-guide |
| API | api-documentation |
| Tracking | tech-debt-tracker |

## How to Add Documentation

1. **Architecture decisions:** `docs/adr/NNN-title-of-decision.md`
2. **System designs:** `docs/architecture/system-name.md`
3. **Operational procedures:** `docs/runbooks/operation-name.md`
4. **Session examples:** `docs/examples/session-description.md`
5. **Framework references:** `docs/framework-reference/<framework>/`

Use templates from `.claude/docs/templates/` as starting points.

## Documentation Standards

- Use Markdown with proper headings
- Include date and author
- Keep documents up to date with code changes
- Link to related documents and code
- Follow naming conventions per directory
