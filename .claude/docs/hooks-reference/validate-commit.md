# Hook: validate-commit.sh

## Trigger
PreToolUse — runs before `git commit` commands

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Hardcoded secrets and credentials\n- Large files (>10MB)\n- Binary data/model files\n- Notebook cell outputs\n- YAML/JSON syntax\n- Python syntax\n- Sensitive files (.env, .pem)\n- TODO format (requires attribution)

## Configuration
Located in `.claude/hooks/validate-commit.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
