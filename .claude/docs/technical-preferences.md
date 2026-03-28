# Technical Preferences

Defaults — override in CLAUDE.local.md.

## ML: PyTorch + Lightning, scikit-learn, XGBoost, Hugging Face
## Tracking: MLflow (self-hosted) or W&B (cloud)
## Orchestration: Prefect (new), Airflow (existing)
## Transformation: dbt (SQL), Spark (large-scale)
## Local Analytics: DuckDB
## Storage: Parquet (default), Delta Lake (ACID)
## Database: PostgreSQL (OLTP), BigQuery/Snowflake (OLAP)
## API: FastAPI
## Serving: BentoML (simple), Triton (GPU)
## Containers: Docker (dev), Kubernetes (prod)
## Testing: pytest, Great Expectations, Pandera, Hypothesis
## Monitoring: Evidently AI, Prometheus + Grafana, structlog
## IaC: Terraform
## CI/CD: GitHub Actions
## Feature Store: Feast (simple), Tecton (managed)
