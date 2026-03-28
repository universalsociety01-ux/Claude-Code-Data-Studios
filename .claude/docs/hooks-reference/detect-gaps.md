# Hook: detect-gaps.sh

## Trigger
SessionStart — runs when Claude Code session begins

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Untested source modules\n- Models without model cards\n- Pipelines without monitoring\n- Missing docstrings in key files\n- Missing ADRs for large projects

## Configuration
Located in `.claude/hooks/detect-gaps.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
