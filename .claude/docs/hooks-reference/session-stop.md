# Hook: session-stop.sh

## Trigger
Stop — runs when Claude Code session ends

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Records git branch and changes\n- Logs commits made during session\n- Lists modified files\n- Records agent activity\n- Prunes old session logs

## Configuration
Located in `.claude/hooks/session-stop.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
