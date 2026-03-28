# Quick Start Guide

## Prerequisites

### Required
| Tool | Version | Install |
|------|---------|---------|
| Git | 2.30+ | [git-scm.com](https://git-scm.com) |
| Claude Code CLI | Latest | `npm install -g @anthropic-ai/claude-code` |
| Node.js | 18+ | Required for Claude Code CLI |

### Recommended
| Tool | Version | Purpose |
|------|---------|---------|
| Python | 3.9+ | Hook validation, ML code |
| jq | Latest | JSON parsing in hooks |
| pytest | 7+ | Test runner |

### Optional (per workflow)
| Workflow | Tools |
|----------|-------|
| Data Engineering | Airflow/Prefect/Dagster, dbt, DuckDB |
| ML Training | PyTorch, scikit-learn, XGBoost, Hugging Face |
| MLOps | MLflow, Docker, BentoML, FastAPI |
| Data Quality | Great Expectations, Soda, Pandera |
| Monitoring | Evidently AI, Prometheus, Grafana |
| Infrastructure | Terraform, kubectl, AWS/GCP/Azure CLI |

## Installation

### Step 1: Clone the Repository
```bash
git clone https://github.com/your-org/Claude-Code-Data-Studios.git my-data-project
cd my-data-project
```

### Step 2: Set Up Python Environment (Recommended)
```bash
python -m venv .venv
source .venv/bin/activate        # Linux/macOS
# .venv\Scripts\activate         # Windows
pip install -r requirements.txt  # if exists
```

### Step 3: Start Claude Code
```bash
claude
```

Claude Code will automatically load:
- `CLAUDE.md` — master configuration
- `.claude/settings.json` — hooks, permissions, safety rules
- `.claude/rules/` — path-scoped coding standards
- `.claude/skills/` — all 42 slash commands

### Step 4: Initialize Your Project
```
/start
```

The `/start` skill will:
1. Scan the project directory structure
2. Detect current project stage (Init → Setup → Data Prep → EDA → Modeling → Evaluation → Deployment)
3. Check for existing data, models, notebooks, and configs
4. Show project status and suggest next steps

## First Session Walkthrough

### What Happens at Session Start
Two hooks run automatically:
1. **session-start.sh** — Shows git branch, recent commits, sprint info, experiments
2. **detect-gaps.sh** — Reports missing tests, model cards, monitoring

### Your First Commands

**Explore the project:**
```
/map-systems          # Map all data systems and dependencies
/onboard              # Generate onboarding documentation
```

**Build something:**
```
/team-pipeline "Build daily user events ETL from Postgres to warehouse"
/team-ml "Build customer churn prediction model using last 90 days of events"
/team-analysis "Investigate why conversion dropped 15% last month"
```

**Check quality:**
```
/data-quality-check data/processed/users.parquet
/model-evaluate models/staging/churn_v1
/drift-check --model fraud_detector --window 7d
```

**Plan work:**
```
/sprint-plan --duration 2w --priorities "churn model v3, pipeline refactor"
/estimate "Build real-time fraud detection system"
/scope-check "Add recommender system with <100ms latency"
```

## Common Workflows

### 1. New Data Pipeline
```
/team-pipeline "Description of what pipeline should do"
```
This orchestrates: data-engineering-lead → pipeline-engineer + database-engineer + data-quality-engineer → review → deploy

### 2. Train a New Model
```
/team-ml "Description of what to predict/classify"
```
This orchestrates: ml-engineering-lead → feature-engineer + relevant specialist → experiment-analyst → model card → handoff

### 3. Run Comprehensive Analysis
```
/team-analysis "Business question to investigate"
```
This orchestrates: analytics-lead → data-analyst + experiment-analyst + product-analyst → visualization → report

### 4. Deploy to Production
```
/team-deploy "Model name and version to deploy"
```
This orchestrates: mlops-lead → ml-deploy-engineer + monitoring-engineer + infrastructure-engineer → validation → go-live

### 5. Review Code
```
/code-review src/pipelines/user_events.py
/code-review src/models/ --focus "reproducibility"
```

### 6. Handle Incidents
```
/incident-response "Model predictions returning all 0.5 since 3am"
```

## Troubleshooting

### Hooks not running
- Check `.claude/settings.json` has correct hook configuration
- Verify hook scripts are executable: `chmod +x .claude/hooks/*.sh`
- Check hook timeout (default: 10-15 seconds)

### Skills not showing
- Skills must be in `.claude/skills/{name}/SKILL.md` format
- Check YAML frontmatter has `name` and `description` fields

### Context getting compressed
- Use `/start` to reload context after compaction
- Pre-compact hook saves state to `.claude/session-state/`
- See `.claude/docs/context-management.md`

### Python validation not working
- Install Python 3.9+: hooks use python3 for YAML/JSON/syntax validation
- Hooks degrade gracefully without Python (skip validation checks)

## Next Steps

- Read `.claude/docs/agent-roster.md` to understand all 42 agents
- Read `.claude/docs/skills-reference.md` for all 42 slash commands
- Read `.claude/docs/coding-standards.md` for coding standards
- Customize via `CLAUDE.local.md` (see `.claude/docs/CLAUDE-local-template.md`)
- Customize settings via `.claude/settings.local.json` (see `.claude/docs/settings-local-template.md`)
