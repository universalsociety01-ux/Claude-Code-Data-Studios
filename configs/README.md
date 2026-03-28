# Configuration Files

| Directory | Purpose |
|-----------|---------|
| pipelines/ | Pipeline configurations (YAML) |
| models/ | Model hyperparameters and configs |
| infrastructure/ | Cloud and infrastructure configs |

## Standards
- YAML preferred over JSON
- All values documented with inline comments
- No secrets (use environment variable references)
- Environment-specific overrides (dev/staging/prod)
