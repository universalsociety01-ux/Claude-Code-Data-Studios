# Hook: log-agent.sh

## Overview
Logs every subagent invocation to .claude/agent-logs/agent-log.jsonl for audit trail.

## Trigger
- **Event**: SubagentStart
- **Timeout**: 5 seconds

## Log Format
JSONL (one JSON object per line):
- timestamp: ISO 8601
- agent: agent name or prompt (first 100 chars)
- type: subagent type (general, Explore, Plan, etc.)
- description: task description (first 200 chars)

## Log Management
- Rotates at 500 entries, keeps most recent 300
- Tracks daily invocation count
- Reports first agent of the day

## Dependencies
- Required: bash
- Optional: jq (falls back to grep)
