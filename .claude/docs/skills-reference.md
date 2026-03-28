# Skills Reference

42 slash commands organized by workflow category.

## Project Initialization

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/start` | Initialize or resume a data project | All directors | Beginning of session, new project |
| `/reverse-document` | Generate docs from existing code | documentation-specialist | Undocumented codebase |
| `/onboard` | Generate onboarding guide | documentation-specialist, directors | New team member, new project |
| `/map-systems` | Map all systems and dependencies | data-director, all leads | Understanding project architecture |

## Data Quality & Review

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/data-quality-check` | Run data validation suite | data-quality-engineer | After data ingestion, before modeling |
| `/pipeline-review` | Review pipeline code | pipeline-engineer, DE lead | Before merging pipeline changes |
| `/schema-review` | Validate schema changes | database-engineer, DE lead | Before applying schema migrations |
| `/data-audit` | Audit lineage, freshness, completeness | data-governance-lead, compliance | Compliance review, data issues |

## ML & Models

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/model-evaluate` | Evaluate with metrics, fairness, errors | model-developer, experiment-analyst | After training, before promotion |
| `/experiment-track` | Log experiment run | model-developer | During/after each training run |
| `/model-card` | Generate model card | documentation-specialist | Before model promotion to staging |
| `/feature-review` | Check for leakage, skew, quality | feature-engineer, ML lead | Before using new features in production |
| `/hyperparameter-sweep` | Design HPO strategy | model-developer, deep-learning-engineer | Optimizing model performance |
| `/model-compare` | Compare models on metrics, cost | model-developer, experiment-analyst | Choosing between candidate models |
| `/prototype` | Quick proof-of-concept | research-lead, relevant specialist | Validating new approach quickly |

## Analysis

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/eda` | Exploratory data analysis | data-analyst, data-viz-specialist | Starting a new analysis |
| `/ab-test-analyze` | A/B test statistical analysis | experiment-analyst, analytics-lead | Experiment results ready |
| `/cohort-analysis` | Cohort and retention analysis | product-analyst | User behavior, retention questions |
| `/drift-check` | Data/model drift detection | monitoring-engineer, ML lead | Production monitoring, performance issues |

## MLOps & Production

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/deploy-model` | Deploy to staging/production | ml-deploy-engineer, mlops-lead | Model ready for deployment |
| `/monitor-setup` | Set up model monitoring | monitoring-engineer | After deployment |
| `/incident-response` | Investigate incidents | mlops-lead, relevant specialist | Production issue detected |
| `/rollback` | Rollback model or pipeline | ml-deploy-engineer | Deployment issues |
| `/cost-report` | Cloud/compute cost analysis | cost-analyst, platform-lead | Budget review, optimization |

## Reviews & Quality Gates

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/code-review` | Multi-perspective code review | relevant lead + specialist | Before merging code |
| `/design-review` | Review system design docs | director, relevant lead | Before implementation |
| `/gate-check` | Quality gate: tests, docs, metrics | testing-specialist | Before releases |
| `/scope-check` | Assess task feasibility | producer, relevant lead | Before committing to work |
| `/perf-profile` | Performance profiling | performance-engineer | Slow pipeline/model/query |
| `/tech-debt` | Technical debt audit | producer, testing-specialist | Sprint planning, health checks |

## Project Management

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/sprint-plan` | Plan sprint with estimation | producer, all leads | Start of sprint |
| `/milestone-review` | Review milestone progress | producer, all leads | Milestone check-in |
| `/estimate` | Estimate task effort | producer, relevant lead | Before committing to work |
| `/retrospective` | Sprint retrospective | producer | End of sprint |
| `/bug-report` | File structured bug report | producer, relevant specialist | Bug discovered |

## Release

| Command | Description | Key Agents | When to Use |
|---------|-------------|------------|-------------|
| `/release-checklist` | Pre-release validation | mlops-lead, testing-specialist | Before release |
| `/changelog` | Generate changelog | documentation-specialist | After release |
| `/patch-notes` | Write patch notes | documentation-specialist | After release |

## Team Workflows (Multi-Agent)

| Command | Description | Agents Orchestrated | When to Use |
|---------|-------------|---------------------|-------------|
| `/team-pipeline` | Build/refactor data pipeline | DE lead + 5 specialists | New pipeline project |
| `/team-ml` | End-to-end model development | ML lead + relevant specialists | New model project |
| `/team-analysis` | Comprehensive data analysis | Analytics lead + 4 specialists | Deep business analysis |
| `/team-deploy` | Full model deployment | MLOps lead + 4 specialists | Production deployment |

## Quick Lookup: "I want to X, use /Y"

| I want to... | Use |
|--------------|-----|
| Start a new project | `/start` |
| Build a pipeline | `/team-pipeline` |
| Train a model | `/team-ml` |
| Run analysis | `/team-analysis` |
| Deploy to production | `/team-deploy` |
| Check data quality | `/data-quality-check` |
| Evaluate a model | `/model-evaluate` |
| Compare models | `/model-compare` |
| Check for drift | `/drift-check` |
| Review code | `/code-review` |
| Plan a sprint | `/sprint-plan` |
| Estimate a task | `/estimate` |
| Handle an incident | `/incident-response` |
| Rollback a deployment | `/rollback` |
| Find tech debt | `/tech-debt` |
| Generate documentation | `/reverse-document` |
| Profile performance | `/perf-profile` |
| Run quality gate | `/gate-check` |
