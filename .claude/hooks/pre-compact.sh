#!/bin/bash
# Pre-compact: saves session state before context compression
set -e
echo "=== Pre-Compact State Save ==="
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
STATE_DIR=".claude/session-state"
mkdir -p "$STATE_DIR"

if command -v git &>/dev/null; then
    git status --short > "$STATE_DIR/git-status-${TIMESTAMP}.txt" 2>/dev/null
    git log --oneline -10 > "$STATE_DIR/git-log-${TIMESTAMP}.txt" 2>/dev/null
fi
echo "Session state saved."
