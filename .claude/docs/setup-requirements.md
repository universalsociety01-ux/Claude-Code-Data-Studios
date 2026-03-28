# Setup Requirements

Everything needed to use Claude Code Data Studios, from required tools to optional frameworks.

## Required Tools

| Tool | Version | Purpose | Install |
|------|---------|---------|---------|
| Git | 2.30+ | Version control | [git-scm.com](https://git-scm.com) |
| Node.js | 18+ | Required for Claude Code CLI | [nodejs.org](https://nodejs.org) |
| Claude Code | Latest | The CLI tool | `npm install -g @anthropic-ai/claude-code` |

## Recommended Tools

| Tool | Version | Purpose | Install |
|------|---------|---------|---------|
| Python | 3.9+ | Hook validation, ML code, notebooks | [python.org](https://python.org) |
| jq | Latest | JSON parsing in hooks (faster than grep fallback) | `brew install jq` / `apt install jq` / `choco install jq` |
| pytest | 7+ | Test runner (used by push validation hook) | `pip install pytest` |

## Optional Tools by Workflow

### Data Engineering
| Tool | Purpose |
|------|---------|
| Apache Airflow | DAG-based pipeline orchestration |
| Prefect | Pythonic pipeline orchestration |
| Dagster | Software-defined asset pipelines |
| dbt | SQL-first data transformation |
| DuckDB | Local analytical queries |
| Apache Spark | Distributed data processing |

### ML Training
| Tool | Purpose |
|------|---------|
| PyTorch + Lightning | Model development and training |
| scikit-learn | Classical ML and preprocessing |
| XGBoost / LightGBM | Gradient boosting for tabular data |
| Hugging Face | Transformers, datasets, model hub |
| Optuna | Hyperparameter optimization |

### MLOps & Serving
| Tool | Purpose |
|------|---------|
| MLflow | Experiment tracking, model registry |
| Weights & Biases | Experiment visualization |
| BentoML | Model serving and packaging |
| FastAPI | API framework for model serving |
| Docker | Containerization |
| Triton | GPU-optimized model serving |

### Data Quality & Monitoring
| Tool | Purpose |
|------|---------|
| Great Expectations | Data validation and profiling |
| Soda | Data quality monitoring |
| Pandera | DataFrame schema validation |
| Evidently AI | ML monitoring and drift detection |
| Whylogs | Data logging and profiling |

### Infrastructure
| Tool | Purpose |
|------|---------|
| Terraform | Infrastructure as Code |
| kubectl | Kubernetes cluster management |
| AWS CLI / gcloud / az | Cloud provider CLIs |
| DVC | Data version control |

## Python Environment Setup

### Option 1: venv (Recommended for simplicity)
```bash
python -m venv .venv
source .venv/bin/activate        # Linux/macOS
# .venv\Scripts\activate         # Windows
pip install -r requirements.txt
```

### Option 2: conda
```bash
conda create -n datastudios python=3.11
conda activate datastudios
pip install -r requirements.txt
```

### Option 3: poetry
```bash
poetry install
poetry shell
```

## Verification Commands

After setup, verify your environment:

```bash
# Required
git --version                    # Should be 2.30+
claude --version                 # Claude Code CLI

# Recommended
python3 --version                # 3.9+
jq --version                     # Any version
pytest --version                 # 7+

# Verify hooks work
bash .claude/hooks/session-start.sh    # Should show project context
bash .claude/hooks/detect-gaps.sh      # Should report gaps
bash .claude/hooks/validate-data.sh    # Should run data checks
```

## Hook Compatibility

All hooks gracefully degrade when optional tools are unavailable:

| Tool Missing | Impact |
|-------------|--------|
| python3 | YAML/JSON/Python validation skipped, notebook checks skipped |
| jq | Falls back to grep for JSON parsing (slower but functional) |
| pytest | Test suite skipped during push validation |
| git | Git-related context not shown at session start |

**No hook will fail** due to a missing optional tool. They print "INFO" and skip.

## Platform Support

| Platform | Shell | Notes |
|----------|-------|-------|
| Windows 10/11 | Git Bash | Install Git for Windows; hooks use bash syntax |
| macOS | bash/zsh | Native support |
| Linux | bash | Native support |

## Troubleshooting

### "claude: command not found"
```bash
npm install -g @anthropic-ai/claude-code
```

### Hooks not executable (Linux/macOS)
```bash
chmod +x .claude/hooks/*.sh
```

### Python validation not working
```bash
pip install pyyaml  # Required for YAML validation in hooks
```

### jq not found (hooks still work)
Hooks fall back to grep-based JSON parsing. Install jq for better performance:
```bash
# macOS
brew install jq
# Ubuntu/Debian
sudo apt install jq
# Windows
choco install jq
```
