# Hook: log-agent.sh

## Trigger
SubagentStart — runs when a subagent is launched

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Logs agent name, type, description\n- Timestamps all invocations\n- Rotates log at 500 entries\n- Tracks daily invocation count

## Configuration
Located in `.claude/hooks/log-agent.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
