# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.x     | Yes       |

## Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly.

### How to Report

1. **DO NOT** open a public GitHub issue for security vulnerabilities
2. Email your findings to the repository maintainer
3. Include: description, reproduction steps, potential impact, suggested fix

### What to Expect

- Acknowledgment within 48 hours
- Status update within 7 days
- Fix timeline based on severity

### Scope

**In scope:**
- Hook scripts (command injection, path traversal)
- Settings/configurations (credential exposure, unsafe defaults)
- Agent definitions (prompt injection vectors)
- Templates (sensitive data exposure patterns)

**Out of scope:**
- Claude Code CLI itself (report to [Anthropic](https://github.com/anthropics/claude-code/issues))
- Third-party tools (MLflow, Airflow, etc.)

## Built-in Security Measures

### Automated Protections (Hooks)

| Hook | Protection |
|------|-----------|
| validate-commit.sh | Blocks hardcoded secrets, credentials, .env, .pem files |
| validate-assets.sh | Detects PII in data code, secrets in configs |
| validate-push.sh | Blocks force push, detects debug breakpoints |

### Permission Controls (settings.json)

- Destructive commands denied: rm -rf, git push --force, sudo
- .env files blocked from reading
- SQL destructive statements blocked (DROP TABLE, TRUNCATE)
- Protected directories: data/raw, models/production

### Data Security

- **PII Detection**: Automated scanning in pipeline and data processing code
- **No Secrets in Code**: Hooks block commits with passwords, API keys, tokens
- **No Secrets in Config**: PostToolUse hook warns about credentials in YAML/JSON
- **Immutable Raw Data**: Hooks warn when raw data is modified
- **Access Control**: Data governance policies enforce least-privilege

### ML-Specific Security

- **Data Leakage Prevention**: Rules enforce proper train/test separation
- **Model Artifacts Protected**: Production models gitignored, stored in registries
- **Input Validation**: API rules require Pydantic validation on all endpoints
- **Data Quality Gates**: Validation at every pipeline boundary

## Secrets Management

**Never store secrets in:** source code, config files, committed .env files, notebook outputs

**Always use:** environment variables, secret managers (Vault, AWS SM, GCP SM), gitignored .env files
