# Technical Preferences

Default technology choices for Data Studios projects. Override any preference in `CLAUDE.local.md` at project root.

## How Preferences Work

These are sensible defaults — not mandates. Every project is different. Override by adding a section to your `CLAUDE.local.md`:

```markdown
## Stack Overrides
- Use TensorFlow instead of PyTorch (existing TF codebase)
- Use Airflow instead of Prefect (team familiarity)
```

Agents will respect overrides and adapt their recommendations accordingly.

## ML Frameworks

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| Deep learning | PyTorch + Lightning | TensorFlow/Keras | Existing TF codebase, TFX ecosystem, TPU-first |
| Classical ML | scikit-learn | — | Always use for classical ML |
| Gradient boosting | XGBoost | LightGBM, CatBoost | LightGBM for speed, CatBoost for categorical-heavy data |
| NLP/LLMs | Hugging Face Transformers | — | Always use for transformer-based models |
| Hyperparameter tuning | Optuna | Ray Tune | Ray Tune for distributed search |

## Experiment Tracking

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| Tracking | MLflow (self-hosted) | Weights & Biases (cloud) | W&B for team collaboration, sweeps, rich visualization |
| Model registry | MLflow Model Registry | SageMaker Registry | SageMaker if already on AWS ML stack |
| Artifact storage | MLflow + S3/GCS | DVC | DVC for git-native data versioning |

## Pipeline Orchestration

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| New pipelines | Prefect | Dagster | Dagster for software-defined assets, strong typing |
| Existing pipelines | Airflow | — | Keep Airflow if already in use |
| SQL transforms | dbt | — | Always use for SQL-first transformation |
| Large-scale ETL | Spark | Dask, Polars | Dask for Python-native, Polars for single-node speed |

## Data Storage

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| File format | Parquet | Delta Lake, Iceberg | Delta/Iceberg for ACID, time travel, schema evolution |
| Local analytics | DuckDB | SQLite | SQLite only for simple key-value or small datasets |
| OLTP database | PostgreSQL | MySQL | MySQL only for legacy compatibility |
| OLAP warehouse | BigQuery | Snowflake, Redshift | Snowflake for multi-cloud, Redshift if AWS-native |
| Object storage | S3 | GCS, Azure Blob | Match cloud provider |
| Cache | Redis | Memcached | Memcached for simple key-value only |

## Model Serving

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| API framework | FastAPI | Flask | Flask only for very simple endpoints |
| Simple serving | BentoML | Seldon Core | Seldon for Kubernetes-native serving |
| GPU serving | Triton Inference Server | TorchServe | TorchServe for PyTorch-only workloads |
| Managed serving | SageMaker Endpoints | Vertex AI | Match cloud provider |
| Feature serving | Feast | Tecton | Tecton for managed, real-time features |

## Infrastructure

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| Containers | Docker | Podman | Podman for rootless containers |
| Orchestration | Kubernetes | ECS, Cloud Run | ECS/Cloud Run for simpler deployments |
| IaC | Terraform | Pulumi, CDK | Pulumi for programmatic IaC, CDK if AWS-only |
| CI/CD | GitHub Actions | GitLab CI, Jenkins | Match git hosting platform |
| Secrets | AWS Secrets Manager | HashiCorp Vault | Vault for multi-cloud or on-prem |

## Testing & Quality

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| Test runner | pytest | unittest | Always prefer pytest |
| Data validation | Great Expectations | Pandera, Soda | Pandera for DataFrame-level, Soda for SQL-native |
| Property testing | Hypothesis | — | Use for edge case generation |
| Load testing | Locust | k6 | k6 for JavaScript-native teams |
| Code quality | ruff | flake8 + black | ruff is faster, combines linting + formatting |

## Monitoring & Observability

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| ML monitoring | Evidently AI | Whylogs, NannyML | Whylogs for lightweight profiling |
| Metrics | Prometheus + Grafana | Datadog | Datadog for managed, all-in-one |
| Logging | structlog (JSON) | loguru | structlog for production, loguru for simplicity |
| Tracing | OpenTelemetry | Jaeger | OpenTelemetry is the standard |
| Alerting | PagerDuty | OpsGenie | Match existing incident management |

## Notebook & Analysis

| Category | Default | Alternative | When to Switch |
|----------|---------|-------------|---------------|
| Notebooks | JupyterLab | VS Code notebooks | VS Code for integrated development |
| Visualization | Plotly | Matplotlib, Seaborn | Matplotlib for publication figures |
| Dashboards | Streamlit | Gradio, Panel | Gradio for ML demos, Panel for complex dashboards |
| Profiling | ydata-profiling | — | Always use for initial EDA |

## Configuration Conventions

| Setting | Default | Notes |
|---------|---------|-------|
| Python version | 3.11 | Minimum 3.9 supported |
| Package manager | pip + venv | poetry for library projects |
| Config format | YAML | JSON for machine-generated configs |
| Random seed | 42 | Consistent across all experiments |
| Batch size | 32 | Adjust per GPU memory |
| Learning rate | 1e-3 | With scheduler (cosine or reduce-on-plateau) |
| Train/val/test split | 70/15/15 | Stratified for classification |
| Max line length | 120 | PEP 8 extended |
| Log level (dev) | DEBUG | |
| Log level (prod) | INFO | |

## Overriding Preferences

Create `CLAUDE.local.md` in project root (gitignored):

```markdown
# CLAUDE.local.md

## Stack Overrides
- Use TensorFlow 2.x (existing codebase)
- Use Airflow 2.7 (company standard)
- Use Snowflake (data warehouse)
- Use GitLab CI (company git platform)

## Team Context
- Team of 5 ML engineers, 2 data engineers
- Primary cloud: AWS
- Budget: moderate (prefer managed services)

## Project-Specific
- Target latency: <100ms p99
- Data size: ~500GB, growing 10GB/month
- Compliance: GDPR, SOC 2
```
