# Framework Reference

Version-pinned documentation for ML/data frameworks. LLM knowledge has a cutoff date, but frameworks update frequently with breaking changes. This directory provides accessible reference material so agents avoid suggesting outdated APIs.

## Structure

Each framework folder follows a consistent layout:

```
framework-name/
  VERSION.md                  — Pinned version and verification date
  breaking-changes.md         — API changes organized by risk level
  deprecated-apis.md          — Old → new API mappings
  current-best-practices.md   — Patterns beyond LLM training cutoff
  modules/                    — Subsystem quick references (max 150 lines each)
```

## Available Frameworks

| Framework | Directory | Primary Use |
|-----------|-----------|-------------|
| PyTorch | `pytorch/` | Deep learning, model development |
| scikit-learn | `sklearn/` | Classical ML, preprocessing |
| XGBoost | `xgboost/` | Gradient boosting for tabular data |
| Hugging Face | `huggingface/` | Transformers, NLP, model hub |
| FastAPI | `fastapi/` | Model serving APIs |
| Prefect | `prefect/` | Pipeline orchestration |
| MLflow | `mlflow/` | Experiment tracking, model registry |

## How to Use

### For Agents
When generating code for a specific framework, check the corresponding directory first:
1. Read `VERSION.md` to know which version is pinned
2. Check `breaking-changes.md` to avoid deprecated patterns
3. Reference `current-best-practices.md` for modern idioms

### For Users
Update these files when upgrading framework versions:
1. Update `VERSION.md` with new version and verification date
2. Add new breaking changes from release notes
3. Update deprecated APIs mappings
4. Refresh best practices

## Adding a New Framework

1. Create directory: `docs/framework-reference/<framework-name>/`
2. Add the 4 standard files (VERSION.md, breaking-changes.md, deprecated-apis.md, current-best-practices.md)
3. Optionally add `modules/` for subsystem references
4. Update this README's table

## Why This Matters

Without version-pinned references, agents may:
- Use deprecated APIs that produce warnings or errors
- Miss new features that simplify implementation
- Suggest patterns that conflict with newer versions
- Generate code incompatible with the project's pinned versions
