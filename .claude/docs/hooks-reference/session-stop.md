# Hook: session-stop.sh

## Overview
Records session accomplishments when Claude Code exits. Creates audit trail.

## Trigger
- **Event**: Stop
- **Timeout**: 10 seconds

## What It Records
Log saved to production/session-logs/session-{timestamp}.md:

- Branch name
- Changes made (git diff --stat)
- Commits this session (last 8 hours)
- Files modified (first 30)
- Agent activity (count + last 10 entries from agent-log.jsonl)

## Cleanup
Keeps last 20 session logs, prunes older ones.

## Dependencies
- Required: bash
- Optional: git
