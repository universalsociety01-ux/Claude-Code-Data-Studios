# Hook: pre-compact.sh

## Trigger
PreCompact — runs before context compression

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Saves git status, diff, log, branch\n- Saves latest experiment state\n- Saves current sprint\n- Saves active task\n- Saves TODO items\n- Prunes old state files

## Configuration
Located in `.claude/hooks/pre-compact.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
