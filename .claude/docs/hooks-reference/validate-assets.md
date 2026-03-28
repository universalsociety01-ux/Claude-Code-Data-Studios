# Hook: validate-assets.sh

## Trigger
PostToolUse — runs after Write/Edit tool operations

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- YAML syntax validation\n- JSON syntax validation\n- Python syntax check\n- Hardcoded credentials detection\n- PII field handling in data code\n- SQL safety (destructive statements, SELECT *)\n- Notebook output warnings\n- Config secrets check\n- Hardcoded paths in pipelines\n- .cuda() usage in model code

## Configuration
Located in `.claude/hooks/validate-assets.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
