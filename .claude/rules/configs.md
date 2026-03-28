---
path: configs/**
description: Standards for configuration files
---

# Rules for Configurations

## Standards
- YAML preferred over JSON for human-edited configs
- All values documented with inline comments
- Environment-specific overrides supported (dev/staging/prod)
- No secrets in config files (use env vars or secret managers)
- Schema validation for all configs
- Sensible defaults for all optional fields

## Required Patterns
- Comments explaining non-obvious values
- Environment variable references for secrets: `${DB_PASSWORD}`
- Default values section

## Forbidden Patterns
- Secrets, passwords, or API keys in config files
- Undocumented magic numbers
- Environment-specific values without override mechanism

## Review Checklist
- [ ] All values documented
- [ ] No secrets present
- [ ] Defaults for optional fields
- [ ] Environment overrides supported
- [ ] Valid YAML/JSON syntax
