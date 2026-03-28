# Models

| Directory | Purpose |
|-----------|---------|
| trained/ | Serialized models from training (gitignored) |
| staging/ | Models being validated before production |
| production/ | Production-ready model artifacts |

## Requirements
- Every model directory must contain a MODEL_CARD.md
- Use .claude/docs/templates/model-card.md as template
- Model binaries are gitignored (use model registry)
