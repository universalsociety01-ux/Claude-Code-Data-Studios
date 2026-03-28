#!/bin/bash
# Audit trail: logs agent invocations
TIMESTAMP=$(date '+%Y-%m-%dT%H:%M:%S')
LOG_DIR=".claude/agent-logs"
mkdir -p "$LOG_DIR"
AGENT_NAME="${1:-unknown}"
ACTION="${2:-invoked}"
echo "{\"timestamp\":\"$TIMESTAMP\",\"agent\":\"$AGENT_NAME\",\"action\":\"$ACTION\"}" >> "$LOG_DIR/agent-log.jsonl"
