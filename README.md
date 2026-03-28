# Claude Code Data Studios

> Transform a single Claude Code session into a fully-staffed AI/ML data studio with 42 specialized agents, 42 slash commands, automated quality hooks, and battle-tested workflows.

## What is This?

Claude Code Data Studios is a comprehensive framework that turns Claude Code into an AI-powered data science and ML engineering studio. It provides:

- **42 Specialized Agents** organized in a 3-tier hierarchy (Directors → Leads → Specialists)
- **42 Slash Commands** for common data/ML workflows
- **9 Git Hooks** for automated validation and session management
- **10 Path-Scoped Rules** enforcing coding standards by file location
- **28 Document Templates** for model cards, experiments, data contracts, and more
- **15 Documentation Files** covering standards, coordination, and references
- **Real-time Status Line** showing project stage, branch, and active work

## Philosophy

**Collaborative, not autonomous.** Agents ask questions before proposing solutions. Nothing gets written without your sign-off. You are the Principal Data Scientist — agents provide structured expertise.

## Quick Start

```bash
# 1. Install Claude Code
npm install -g @anthropic-ai/claude-code

# 2. Clone this repo
git clone <repo-url> my-data-project
cd my-data-project

# 3. Start Claude Code
claude

# 4. Initialize your project
/start
```

## Agent Architecture

```
User (Principal Data Scientist)
├── Data Director (Opus) — data strategy, architecture
│   ├── Data Engineering Lead → 5 specialists
│   ├── Analytics Lead → 4 specialists
│   ├── Data Governance Lead → 3 specialists
│   └── Platform Lead → 3 specialists
├── ML Director (Opus) — ML strategy, model lifecycle
│   ├── ML Engineering Lead → 7 specialists
│   ├── MLOps Lead → 4 specialists
│   └── Research Lead → 2 specialists
└── Producer (Opus) — planning, coordination
    └── Documentation Specialist
```

## Key Commands

| Command | Purpose |
|---------|---------|
| `/start` | Initialize or resume a project |
| `/team-pipeline` | Build a data pipeline (multi-agent) |
| `/team-ml` | Develop a model (multi-agent) |
| `/team-analysis` | Run comprehensive analysis (multi-agent) |
| `/team-deploy` | Deploy to production (multi-agent) |
| `/data-quality-check` | Validate data quality |
| `/model-evaluate` | Evaluate model performance |
| `/drift-check` | Check for data/model drift |
| `/eda` | Exploratory data analysis |
| `/ab-test-analyze` | Analyze A/B test results |
| `/sprint-plan` | Plan a sprint |
| `/gate-check` | Run quality gate |
| `/deploy-model` | Deploy a model |
| `/incident-response` | Handle incidents |

## Stack Support

### Pipeline Orchestration
Airflow, Prefect, Dagster, dbt

### ML Frameworks
PyTorch, TensorFlow, scikit-learn, XGBoost, LightGBM, Hugging Face

### MLOps
MLflow, W&B, BentoML, Triton, SageMaker, Vertex AI

### Data Quality
Great Expectations, Soda, Pandera, dbt tests

### Monitoring
Evidently AI, Whylogs, Prometheus, Grafana

## Project Structure

```
CLAUDE.md                    # Master configuration
.claude/
  settings.json              # Hooks, permissions, safety
  agents/                    # 42 agent definitions
  skills/                    # 35 slash commands
  hooks/                     # 8 automation scripts
  rules/                     # 10 coding standards
  docs/templates/            # Document templates
src/                         # Source code
notebooks/                   # Jupyter notebooks
configs/                     # Configuration files
data/                        # Data (raw, processed, external)
models/                      # Trained models
tests/                       # Test suites
docs/                        # Documentation
experiments/                 # Experiment logs
production/                  # Sprint tracking
```

## Safety & Quality

- **No data leakage** — training/test splits enforced
- **No hardcoded credentials** — secrets via env vars only
- **Reproducibility** — seeds, data versioning, config versioning
- **Cost guardrails** — GPU/cloud spend alerts
- **PII protection** — automated detection and anonymization
- **Model governance** — model cards required for production

## Customization

- Add/remove agents for your specific domains
- Modify agent prompts and behavior
- Adjust skill workflows to your team's processes
- Create custom rules for your directory structure
- Tune hook validation strictness

## Requirements

- **Git** — version control
- **Claude Code CLI** — `npm install -g @anthropic-ai/claude-code`
- **Python 3.9+** — recommended for hooks and ML code
- Optional: jq, pytest, DVC

## License

MIT
