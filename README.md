<p align="center">
  <h1 align="center">🔬 Claude Code Data Studios</h1>
  <p align="center">
    Turn a single Claude Code session into a fully-staffed AI/ML data studio.
    <br />
    42 agents · 42 workflows · 9 hooks · 10 rules · 28 templates
    <br /><br />
    <em>You are the Principal Data Scientist. They are your expert team.</em>
  </p>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <a href=".claude/agents"><img src="https://img.shields.io/badge/agents-42-blueviolet" alt="42 Agents"></a>
  <a href=".claude/skills"><img src="https://img.shields.io/badge/skills-42-green" alt="42 Skills"></a>
  <a href=".claude/hooks"><img src="https://img.shields.io/badge/hooks-9-orange" alt="9 Hooks"></a>
  <a href=".claude/rules"><img src="https://img.shields.io/badge/rules-10-red" alt="10 Rules"></a>
  <a href=".claude/docs/templates"><img src="https://img.shields.io/badge/templates-28-yellow" alt="28 Templates"></a>
  <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/built%20for-Claude%20Code-f5f5f5?logo=anthropic" alt="Built for Claude Code"></a>
</p>

---

## Why This Exists

Building ML systems solo with AI is powerful — but a single chat session has no structure. No one stops you from leaking future data into training sets, hardcoding credentials, skipping model cards, or deploying without monitoring. There's no code review, no experiment tracking discipline, no one asking "did you check for fairness?"

**Claude Code Data Studios** solves this by giving your AI session the structure of a real data team. Instead of one general-purpose assistant, you get 42 specialized agents organized into a studio hierarchy — directors who guard strategy, department leads who own their domains, and specialists who do the hands-on work. Each agent has defined responsibilities, quality gates, and escalation paths.

The result: you still make every decision, but now you have a team that asks the right questions, catches mistakes early, enforces best practices, and keeps your project organized from first EDA to production deployment.

---

## Table of Contents

- [What's Included](#whats-included)
- [Studio Hierarchy](#studio-hierarchy)
- [Slash Commands](#slash-commands)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [How It Works](#how-it-works)
- [Design Philosophy](#design-philosophy)
- [Stack Support](#stack-support)
- [Safety & Quality](#safety--quality)
- [Customization](#customization)
- [Documentation](#documentation)
- [Platform Support](#platform-support)
- [Contributing](#contributing)
- [License](#license)

---

## What's Included

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 42 | Specialized subagents across data engineering, ML, analytics, MLOps, and support |
| **Skills** | 42 | Slash commands for every workflow (`/start`, `/team-ml`, `/deploy-model`, `/drift-check`, etc.) |
| **Hooks** | 9 | Automated validation on commits, pushes, file writes, sessions, compaction, and agent audit |
| **Rules** | 10 | Path-scoped coding standards for pipelines, models, features, APIs, notebooks, SQL, and more |
| **Templates** | 28 | Document templates for model cards, data contracts, experiments, ADRs, runbooks, and more |
| **Docs** | 15+ | Comprehensive documentation covering agents, skills, hooks, rules, coordination, and workflow |
| **Status Line** | 1 | Real-time display of project stage, branch, context usage, and active work |

---

## Studio Hierarchy

Agents are organized into three tiers, matching how real data teams operate:

```
You (Principal Data Scientist)
│
├── 📊 Data Director (Opus) — data strategy, architecture, cross-team alignment
│   ├── Data Engineering Lead
│   │   ├── pipeline-engineer         — ETL/ELT, Airflow, Prefect, Dagster
│   │   ├── streaming-engineer        — Kafka, Flink, Spark Streaming
│   │   ├── database-engineer         — schema design, query optimization
│   │   ├── data-integration-specialist — API connectors, CDC, federation
│   │   └── data-quality-engineer     — validation, anomaly detection
│   ├── Analytics Lead
│   │   ├── business-analyst          — KPIs, dashboards, reporting
│   │   ├── data-analyst              — EDA, statistical testing
│   │   ├── experiment-analyst        — A/B testing, causal inference
│   │   └── product-analyst           — funnels, cohorts, user behavior
│   ├── Data Governance Lead
│   │   ├── security-engineer         — encryption, access control, PII
│   │   └── compliance-specialist     — GDPR, CCPA, audit trails
│   └── Platform Lead
│       ├── infrastructure-engineer   — Kubernetes, cloud, cost management
│       └── cost-analyst              — cloud spend, budget forecasting
│
├── 🤖 ML Director (Opus) — ML strategy, model lifecycle, research-to-production
│   ├── ML Engineering Lead
│   │   ├── model-developer           — architectures, training loops
│   │   ├── nlp-specialist            — text, LLMs, embeddings, RAG
│   │   ├── cv-specialist             — image/video, detection, segmentation
│   │   ├── tabular-specialist        — structured data, feature engineering
│   │   ├── timeseries-specialist     — forecasting, anomaly detection
│   │   ├── recommender-specialist    — collaborative filtering, hybrid
│   │   └── deep-learning-engineer    — PyTorch, custom architectures, GPU
│   ├── MLOps Lead
│   │   ├── ml-deploy-engineer        — FastAPI, Triton, BentoML, SageMaker
│   │   ├── monitoring-engineer       — drift detection, alerting
│   │   ├── ml-pipeline-engineer      — training pipelines, feature stores
│   │   └── performance-engineer      — query optimization, caching
│   └── Research Lead
│       └── prompt-engineer           — LLM prompts, evaluation, chains
│
└── 🎬 Producer (Opus) — sprint planning, milestones, resource allocation
    ├── documentation-specialist      — model cards, data dictionaries
    ├── testing-specialist            — unit, integration, data contracts
    ├── data-viz-specialist           — Matplotlib, Plotly, dashboards
    ├── notebook-specialist           — Jupyter, reproducibility
    ├── feature-engineer              — feature extraction, feature stores
    └── data-labeling-specialist      — annotation, quality control
```

---

## Slash Commands

Type `/` in Claude Code to access all 42 skills:

### Data & Analysis
`/eda` `/data-quality-check` `/data-audit` `/schema-review` `/cohort-analysis` `/ab-test-analyze`

### ML Development
`/team-ml` `/experiment-track` `/hyperparameter-sweep` `/model-evaluate` `/model-compare` `/model-card` `/prototype`

### Pipelines & Features
`/team-pipeline` `/pipeline-review` `/feature-review`

### Deployment & Operations
`/team-deploy` `/deploy-model` `/monitor-setup` `/drift-check` `/incident-response` `/rollback`

### Reviews & Quality
`/code-review` `/design-review` `/gate-check` `/release-checklist` `/perf-profile` `/scope-check` `/tech-debt`

### Production & Planning
`/sprint-plan` `/milestone-review` `/estimate` `/retrospective` `/changelog` `/patch-notes` `/bug-report`

### Team Orchestration
`/team-pipeline` `/team-ml` `/team-analysis` `/team-deploy` — coordinate multiple specialists on complex tasks

### Utilities
`/start` `/onboard` `/map-systems` `/reverse-document` `/cost-report`

---

## Getting Started

### Prerequisites

| Tool | Required | Install |
|------|----------|---------|
| Git 2.30+ | ✅ | [git-scm.com](https://git-scm.com) |
| Node.js 18+ | ✅ | [nodejs.org](https://nodejs.org) |
| Claude Code | ✅ | `npm install -g @anthropic-ai/claude-code` |
| Python 3.9+ | Recommended | [python.org](https://python.org) |
| jq | Optional | `brew install jq` / `apt install jq` / `choco install jq` |

All hooks degrade gracefully when optional tools are missing — nothing breaks.

### Setup

```bash
# 1. Clone this repo
git clone https://github.com/rasyalab/Claude-Code-Data-Studios.git my-data-project
cd my-data-project

# 2. (Optional) Set up Python environment
python -m venv .venv
source .venv/bin/activate          # Linux/macOS
# .venv\Scripts\activate           # Windows
pip install -r requirements.txt

# 3. Open Claude Code
claude

# 4. Initialize your project
/start
```

The `/start` command detects your project state and guides you to the right workflow. Or jump directly to what you need:

- `/eda` — explore a dataset
- `/team-pipeline` — build a data pipeline
- `/team-ml` — develop a model
- `/deploy-model` — ship to production

### Customize for Your Project

```bash
# Create local overrides (gitignored)
cp .claude/docs/CLAUDE-local-template.md CLAUDE.local.md
cp .claude/docs/settings-local-template.md .claude/settings.local.json
```

Edit these files with your team details, stack preferences, and data sources.

---

## Project Structure

```
CLAUDE.md                           # Master configuration — agent roster, standards, philosophy
.claude/
  settings.json                     # Hooks, permissions, safety rules
  statusline.sh                     # Real-time status display
  agents/
    directors/                      # 3 director agents (Opus-tier)
    leads/                          # 7 department lead agents (Sonnet-tier)
    specialists/                    # 32 specialist agents (Sonnet/Haiku-tier)
      data-engineering/             #   pipeline, streaming, database, integration, quality
      ml-engineering/               #   model, NLP, CV, tabular, timeseries, recommender, DL
      analytics/                    #   business, data, experiment, product analysts
      mlops/                        #   deploy, monitoring, ML pipeline, performance
      support/                      #   viz, docs, testing, security, notebooks, features, etc.
  skills/                           # 42 slash commands (subdirectory per skill)
  hooks/                            # 9 automation scripts (bash, cross-platform)
  rules/                            # 10 path-scoped coding standards
  docs/
    templates/                      # 28 document templates
    hooks-reference/                # Per-hook documentation
    *.md                            # 15 reference docs (agents, skills, standards, etc.)
src/
  pipelines/                        # ETL/ELT pipeline code
  models/                           # Model training & architecture code
  features/                         # Feature engineering code
  data/                             # Data loading & processing utilities
  api/                              # Model serving API code
  monitoring/                       # Monitoring & alerting code
  utils/                            # Shared utilities
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
  COLLABORATIVE-DESIGN-PRINCIPLE.md # Core collaboration philosophy
  WORKFLOW-GUIDE.md                 # Complete 8-phase workflow guide
  architecture/                     # System architecture documents
  adr/                              # Architecture Decision Records
  runbooks/                         # Operational runbooks
  examples/                         # Annotated session transcripts
  framework-reference/              # Version-pinned framework docs
experiments/                        # Experiment logs & results
production/
  sprints/                          # Sprint tracking
  milestones/                       # Milestone definitions
tools/
  scripts/                          # Utility scripts
  cli/                              # CLI tools
```

---

## How It Works

### Agent Coordination

Agents follow a structured delegation model:

1. **Vertical delegation** — directors assign to leads, leads assign to specialists. Each assignment has a clear owner, objective, and acceptance criteria.
2. **Horizontal consultation** — same-tier agents consult each other freely but cannot make cross-domain decisions.
3. **Conflict resolution** — disagreements escalate to shared parent director. `producer` mediates cross-director conflicts.
4. **Change propagation** — schema changes notify all downstream teams. Feature changes require ML + data engineering sign-off.
5. **Domain boundaries** — agents don't modify files outside their scope. A `pipeline-engineer` doesn't touch model code.

### Collaborative, Not Autonomous

This is **not** an auto-pilot system. Every agent follows a strict collaboration protocol:

```
Question → Options → Decision → Draft → Approval
```

1. **Ask** — agents ask clarifying questions before proposing solutions
2. **Present options** — agents show 2-4 options with trade-offs and effort estimates
3. **You decide** — the user always makes the call ("This is your domain — you know best")
4. **Draft** — agents show their work before writing any files
5. **Approve** — nothing gets committed without your explicit sign-off

See [docs/COLLABORATIVE-DESIGN-PRINCIPLE.md](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md) for the full philosophy.

### Automated Safety

**Hooks** run automatically throughout your session:

| Hook | Trigger | What It Does |
|------|---------|--------------|
| `session-start.sh` | Session open | Loads project context, detects CRISP-DM stage, shows status |
| `detect-gaps.sh` | Session open | Scans for missing docs, tests, configs — suggests next steps |
| `validate-commit.sh` | `git commit` | Checks for debug code, secrets, large files, TODO format |
| `validate-push.sh` | `git push` | Runs tests, lint, verifies branch policy |
| `validate-assets.sh` | File write/edit | Validates YAML syntax, JSON schema, Python imports |
| `validate-data.sh` | Manual | Runs data quality checks on datasets |
| `pre-compact.sh` | Context compression | Saves session state before context window compaction |
| `session-stop.sh` | Session close | Archives session logs, cleanup |
| `log-agent.sh` | Agent spawned | Audit trail of all subagent invocations |

### Path-Scoped Rules

Coding standards are automatically enforced based on file location:

| Path | Enforces |
|------|----------|
| `src/pipelines/**` | Idempotency, retry logic, config-driven, structured logging |
| `src/models/**` | Seeded random, device-agnostic, config-driven hyperparameters, no data loading |
| `src/features/**` | No future data leakage, null handling documented, fit/transform pattern |
| `src/data/**` | Schema validation, encoding explicit, raw data immutable |
| `src/api/**` | Pydantic validation, health checks, model version headers, no PII in logs |
| `src/monitoring/**` | Structured JSON logging, metric naming convention, runbook links |
| `notebooks/**` | Sequential execution, imports at top, no hardcoded paths, seeds set |
| `tests/**` | Descriptive names, fixtures, parametrized, deterministic |
| `configs/**` | All values documented, no secrets, defaults provided |
| SQL files | CTEs over subqueries, explicit columns, timezone-aware |

---

## Design Philosophy

This framework is grounded in professional data science and ML engineering practices:

### CRISP-DM Lifecycle
All workflows follow the Cross-Industry Standard Process for Data Mining:
Business Understanding → Data Understanding → Data Preparation → Modeling → Evaluation → Deployment

### Statistical Rigor
- Hypothesis-driven analysis: state H₀/H₁ before running tests
- Multiple comparison correction when applicable
- Effect size reporting alongside p-values
- Confidence intervals over point estimates

### ML Best Practices
- **Reproducibility** — seed everything, version data + code + config
- **Experiment Tracking** — every training run logged with params, metrics, artifacts
- **Data-Centric AI** — prioritize data quality over model complexity
- **Responsible AI** — fairness, explainability, privacy by design

### Feature Store Pattern
Features computed once, served consistently for training and inference. No training-serving skew.

### Verification-Driven Development
Write tests first. Validate at every boundary. Compare expected vs actual before marking complete.

---

## Stack Support

Data Studios agents are trained on all major data/ML tools:

### Pipeline Orchestration
**Airflow** · **Prefect** · **Dagster** · **dbt** · **Spark**

### ML Frameworks
**PyTorch + Lightning** · **TensorFlow/Keras** · **scikit-learn** · **XGBoost** · **LightGBM** · **CatBoost** · **Hugging Face**

### Experiment Tracking
**MLflow** · **Weights & Biases** · **Neptune.ai**

### Model Serving
**FastAPI** · **BentoML** · **Triton** · **SageMaker** · **Vertex AI**

### Data Storage
**Parquet** · **Delta Lake** · **Iceberg** · **DuckDB** · **PostgreSQL** · **BigQuery** · **Snowflake**

### Data Quality
**Great Expectations** · **Soda** · **Pandera** · **dbt tests**

### Monitoring
**Evidently AI** · **Whylogs** · **Prometheus + Grafana** · **NannyML**

### Infrastructure
**Docker** · **Kubernetes** · **Terraform** · **GitHub Actions**

---

## Safety & Quality

Built-in guardrails protect your project from common pitfalls:

| Guard | How |
|-------|-----|
| **No data leakage** | Features enforced as timestamp-aware, train/test splits at pipeline level |
| **No hardcoded credentials** | Hooks detect secrets, rules enforce env var references |
| **Reproducibility** | Rules mandate seeds, data versioning, config versioning |
| **Cost guardrails** | Cost analyst agent, GPU/cloud spend alerts |
| **PII protection** | Automated detection in pipelines, no PII in logs/metrics |
| **Model governance** | Model cards required, fairness audit before production |
| **Code quality** | Path-scoped rules, multi-perspective code review |
| **Data quality** | Validation at every pipeline boundary, schema contracts |

---

## Customization

This is a **template**, not a locked framework. Everything is designed to be customized:

| What | How |
|------|-----|
| **Add/remove agents** | Delete agent files you don't need, add new ones for your domains |
| **Edit agent behavior** | Modify agent markdown files with project-specific knowledge |
| **Adjust skills** | Customize workflow steps in `SKILL.md` files |
| **Add rules** | Create new `.claude/rules/*.md` for your directory structure |
| **Tune hooks** | Adjust validation strictness, add new checks |
| **Override defaults** | Use `CLAUDE.local.md` for stack preferences and team context |
| **Customize templates** | Modify `.claude/docs/templates/` to match your standards |

### Local Overrides

Two gitignored files let you customize without touching shared config:

- **`CLAUDE.local.md`** — stack overrides, team context, active agents, data sources
- **`.claude/settings.local.json`** — personal permissions, disabled hooks, custom tools

---

## Documentation

### In This Repository

| Document | Description |
|----------|-------------|
| [docs/COLLABORATIVE-DESIGN-PRINCIPLE.md](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md) | Core collaboration philosophy |
| [docs/WORKFLOW-GUIDE.md](docs/WORKFLOW-GUIDE.md) | Complete 8-phase workflow guide |
| [docs/examples/](docs/examples/) | 4 annotated session transcripts |
| [docs/framework-reference/](docs/framework-reference/) | Version-pinned framework docs |

### Framework Docs (in .claude/docs/)

| Document | Description |
|----------|-------------|
| [Quick Start](.claude/docs/quick-start.md) | Getting started guide |
| [Agent Roster](.claude/docs/agent-roster.md) | All 42 agents with roles |
| [Agent Coordination Map](.claude/docs/agent-coordination-map.md) | Hierarchy and delegation flows |
| [Skills Reference](.claude/docs/skills-reference.md) | All 42 slash commands |
| [Hooks Reference](.claude/docs/hooks-reference.md) | All 9 automation hooks |
| [Rules Reference](.claude/docs/rules-reference.md) | 10 path-scoped standards |
| [Coding Standards](.claude/docs/coding-standards.md) | Python, SQL, notebook standards |
| [Coordination Rules](.claude/docs/coordination-rules.md) | Delegation, handoff, conflict rules |
| [Technical Preferences](.claude/docs/technical-preferences.md) | Default technology choices |
| [Setup Requirements](.claude/docs/setup-requirements.md) | Prerequisites and setup |
| [Context Management](.claude/docs/context-management.md) | Managing the context window |
| [Directory Structure](.claude/docs/directory-structure.md) | Project directory guide |
| [Review Workflow](.claude/docs/review-workflow.md) | Code, data, and model reviews |

---

## Platform Support

| Platform | Shell | Notes |
|----------|-------|-------|
| **Windows 10/11** | Git Bash | Install [Git for Windows](https://git-scm.com); hooks use bash syntax |
| **macOS** | bash/zsh | Native support |
| **Linux** | bash | Native support |

All hooks use POSIX-compatible patterns and include fallbacks for missing tools.

---

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

- **Bug reports** — [Open an issue](https://github.com/rasyalab/Claude-Code-Data-Studios/issues)
- **Feature requests** — [Open a discussion](https://github.com/rasyalab/Claude-Code-Data-Studios/discussions)
- **Security issues** — See [SECURITY.md](SECURITY.md)

---

## License

MIT License — see [LICENSE](LICENSE) for details.

---

<p align="center">
  <em>Built with ❤️ for the data science community</em>
  <br />
  <strong>You bring the data. We bring the team.</strong>
</p>
