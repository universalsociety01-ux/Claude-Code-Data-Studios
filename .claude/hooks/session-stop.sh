#!/bin/bash
# Session stop: records session accomplishments
set -e
echo "=== Data Studios Session End ==="
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
LOG_DIR="production/session-logs"
mkdir -p "$LOG_DIR"

{
    echo "# Session Log: $TIMESTAMP"
    echo "## Changes Made"
    git diff --stat HEAD 2>/dev/null || echo "No uncommitted changes"
    echo "## Commits This Session"
    git log --oneline --since="8 hours ago" 2>/dev/null || echo "None"
} > "$LOG_DIR/session-${TIMESTAMP}.md" 2>/dev/null

echo "Session log saved."
