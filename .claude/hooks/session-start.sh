#!/bin/bash
# Session start: loads project context
set -e
echo "=== Data Studios Session Start ==="
echo "Date: $(date '+%Y-%m-%d %H:%M')"

if command -v git &>/dev/null && git rev-parse --git-dir &>/dev/null 2>&1; then
    echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    echo "Recent commits:"
    git log --oneline -5 2>/dev/null || echo "  (no commits yet)"
fi

[ -f "production/sprints/current.md" ] && { echo ""; echo "Current Sprint:"; head -20 production/sprints/current.md; }
[ -n "$(git status --porcelain 2>/dev/null)" ] && { echo ""; echo "Uncommitted changes:"; git status --short | head -10; }
echo ""
echo "Session ready. Use /start to initialize or resume a project."
