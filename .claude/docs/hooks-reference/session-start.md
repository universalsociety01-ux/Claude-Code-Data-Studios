# Hook: session-start.sh

## Trigger
SessionStart — runs when Claude Code session begins

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Git branch and recent commits\n- Uncommitted changes\n- Project stage\n- Current sprint info\n- Latest experiment\n- Active task\n- Drift alerts

## Configuration
Located in `.claude/hooks/session-start.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
