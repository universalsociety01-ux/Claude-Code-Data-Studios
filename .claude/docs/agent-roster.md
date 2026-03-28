# Agent Roster

42 specialized agents organized in a 3-tier hierarchy. Each agent has defined expertise, decision authority, and file scope.

## Tier 1 — Directors (Opus)

Strategic decision-makers who coordinate across departments.

| Agent | Domain | Manages | When to Invoke |
|-------|--------|---------|----------------|
| `data-director` | Data strategy, architecture, governance | DE Lead, Analytics Lead, Governance Lead, Platform Lead | Architecture decisions, schema changes, compliance, data incidents |
| `ml-director` | ML strategy, model lifecycle | ML Lead, MLOps Lead, Research Lead | New ML problems, model architecture, experiment governance, fairness |
| `producer` | Project management, coordination | All leads, Documentation Specialist | Sprint planning, milestones, cross-team conflicts, stakeholder updates |

## Tier 2 — Leads (Sonnet)

Domain experts who manage specialist teams and review all work in their area.

| Agent | Domain | Team Size | When to Invoke |
|-------|--------|-----------|----------------|
| `data-engineering-lead` | Pipelines, data platform | 5 specialists | New pipeline, schema change, data incident, platform decision |
| `ml-engineering-lead` | Model development, experiments | 7 specialists | New model, experiment review, feature engineering, production readiness |
| `analytics-lead` | BI, insights, experiments | 4 specialists | Analysis request, A/B test, KPI definition, dashboard design |
| `mlops-lead` | Deployment, monitoring, CI/CD | 4 specialists | Model deployment, drift alert, retraining, incident response |
| `research-lead` | Novel approaches, PoCs | 2 specialists | Performance plateau, new technique, LLM/prompt task, labeling |
| `data-governance-lead` | Quality, privacy, compliance | 3 specialists | Compliance question, PII concern, data audit, security review |
| `platform-lead` | Infrastructure, cost, tooling | 3 specialists | Infra provisioning, cost spike, GPU allocation, new tooling |

## Tier 3 — Specialists

### Data Engineering (Sonnet)
| Agent | Focus | Key Tools |
|-------|-------|-----------|
| `pipeline-engineer` | ETL/ELT design, orchestration | Airflow, Prefect, Dagster, dbt |
| `streaming-engineer` | Real-time processing | Kafka, Flink, Spark Streaming |
| `database-engineer` | Schema design, query optimization | PostgreSQL, BigQuery, Snowflake, DuckDB |
| `data-integration-specialist` | API connectors, CDC, federation | REST APIs, webhooks, Debezium, Airbyte |
| `data-quality-engineer` | Validation, data contracts | Great Expectations, Soda, Pandera, dbt tests |

### ML Engineering (Sonnet)
| Agent | Focus | Key Tools |
|-------|-------|-----------|
| `model-developer` | Architecture, training, tuning | PyTorch, Lightning, Optuna |
| `nlp-specialist` | NLP, LLMs, RAG, embeddings | Hugging Face, LangChain, sentence-transformers |
| `cv-specialist` | Vision, detection, segmentation | torchvision, timm, YOLO, Detectron2 |
| `tabular-specialist` | Structured data, ensembles | XGBoost, LightGBM, CatBoost, scikit-learn |
| `timeseries-specialist` | Forecasting, anomaly detection | Prophet, statsmodels, TFT |
| `recommender-specialist` | Recommendations, ranking | Collaborative filtering, two-tower, ALS |
| `deep-learning-engineer` | GPU optimization, distributed | DeepSpeed, FSDP, ONNX, TensorRT |

### Analytics (Sonnet)
| Agent | Focus | Key Tools |
|-------|-------|-----------|
| `business-analyst` | KPIs, dashboards, reporting | SQL, Tableau/Looker patterns, metric frameworks |
| `data-analyst` | EDA, statistics, visualization | pandas, scipy, matplotlib, seaborn, plotly |
| `experiment-analyst` | A/B testing, causal inference | statsmodels, scipy.stats, power analysis |
| `product-analyst` | Funnels, cohorts, retention | SQL window functions, survival analysis, LTV |

### MLOps (Sonnet)
| Agent | Focus | Key Tools |
|-------|-------|-----------|
| `ml-deploy-engineer` | Model serving, containers | FastAPI, BentoML, Triton, Docker |
| `monitoring-engineer` | Drift, performance, alerts | Evidently AI, Whylogs, Prometheus, Grafana |
| `ml-pipeline-engineer` | Training pipelines, feature stores | MLflow, Feast, model registry |
| `infrastructure-engineer` | Kubernetes, cloud, GPUs | Terraform, K8s, AWS/GCP/Azure |

### Support (Haiku/Sonnet)
| Agent | Focus | Key Tools |
|-------|-------|-----------|
| `data-viz-specialist` | Visualization, dashboards | Matplotlib, Plotly, Seaborn, D3.js |
| `documentation-specialist` | Model cards, docs, runbooks | Markdown, MkDocs, Sphinx |
| `testing-specialist` | Unit, integration, data tests | pytest, Hypothesis, data contract testing |
| `security-engineer` | Encryption, PII, access control | Vault, Presidio, IAM |
| `performance-engineer` | Profiling, optimization | cProfile, line_profiler, torch.profiler |
| `notebook-specialist` | Jupyter, reproducibility | Papermill, nbconvert, jupytext |
| `feature-engineer` | Feature stores, transformations | Feast, Tecton, custom transformers |
| `prompt-engineer` | LLM prompts, chains, RAG | LangChain, prompt templates, evaluation |
| `data-labeling-specialist` | Annotation, active learning | Label Studio, Prodigy, Snorkel |
| `cost-analyst` | Cloud spend, budget forecasting | Cloud billing APIs, cost dashboards |
| `compliance-specialist` | GDPR, CCPA, audit trails | DataHub, OpenLineage, consent management |

## Quick Lookup: "I want to X, which agent?"

| I want to... | Use agent |
|--------------|-----------|
| Build a data pipeline | `data-engineering-lead` → `pipeline-engineer` |
| Train a classification model | `ml-engineering-lead` → `tabular-specialist` or `model-developer` |
| Build a text classifier / chatbot | `ml-engineering-lead` → `nlp-specialist` |
| Analyze A/B test results | `analytics-lead` → `experiment-analyst` |
| Deploy a model to production | `mlops-lead` → `ml-deploy-engineer` |
| Set up model monitoring | `mlops-lead` → `monitoring-engineer` |
| Optimize a slow query | `data-engineering-lead` → `database-engineer` |
| Check data quality | `data-engineering-lead` → `data-quality-engineer` |
| Build a dashboard | `analytics-lead` → `business-analyst` + `data-viz-specialist` |
| Handle a production incident | `mlops-lead` → relevant specialist |
| Evaluate model fairness | `ml-director` → `model-developer` + fairness audit template |
| Plan a sprint | `producer` |
| Explore a new ML technique | `research-lead` |
| Optimize training speed | `ml-engineering-lead` → `deep-learning-engineer` |
| Build a real-time pipeline | `data-engineering-lead` → `streaming-engineer` |
| Set up feature store | `ml-engineering-lead` → `feature-engineer` + `ml-pipeline-engineer` |
| Review data compliance | `data-governance-lead` → `compliance-specialist` |
| Reduce cloud costs | `platform-lead` → `cost-analyst` |
