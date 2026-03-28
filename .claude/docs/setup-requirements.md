# Setup Requirements

## Required
- **Git** — version control
- **Claude Code CLI** — `npm install -g @anthropic-ai/claude-code`

## Recommended
- **Python 3.9+** — for validation hooks and ML code
- **jq** — JSON validation in hooks
- **pytest** — test runner

## Optional (per stack)

### Data Engineering
- Apache Airflow / Prefect / Dagster
- dbt
- DuckDB

### ML Frameworks
- PyTorch / TensorFlow
- scikit-learn
- XGBoost / LightGBM

### MLOps
- MLflow / Weights & Biases
- Docker
- BentoML / FastAPI

### Data Quality
- Great Expectations
- Soda

### Cloud
- AWS CLI / gcloud / az CLI
- Terraform

## Hook Compatibility
All hooks gracefully degrade when optional tools are unavailable. No critical failures.

## Platform Support
- Windows 10/11 (Git Bash)
- macOS
- Linux
