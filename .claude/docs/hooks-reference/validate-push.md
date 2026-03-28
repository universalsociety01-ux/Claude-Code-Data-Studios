# Hook: validate-push.sh

## Trigger
PreToolUse — runs before `git push` commands

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- Force push detection (blocked)\n- Protected branch warnings\n- Test suite execution\n- Debug breakpoints in code\n- Uncommitted changes warning

## Configuration
Located in `.claude/hooks/validate-push.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
