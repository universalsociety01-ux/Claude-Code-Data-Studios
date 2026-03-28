#!/bin/bash
# Validates pushes — protects main branches, ensures tests pass
set -e
echo "=== Data Studios Push Validation ==="

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
for pb in main master production; do
    [ "$BRANCH" = "$pb" ] && echo "WARNING: Pushing directly to $BRANCH. Consider a feature branch."
done

if command -v pytest &>/dev/null; then
    echo "Running tests..."
    pytest tests/ --tb=short -q 2>/dev/null || { echo "ERROR: Tests failed."; exit 1; }
else
    echo "INFO: pytest not available, skipping tests."
fi

[ -n "$(git status --porcelain 2>/dev/null)" ] && echo "WARNING: Uncommitted changes present."
echo "Push validation complete."
