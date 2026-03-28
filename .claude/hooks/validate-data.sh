#!/bin/bash
# Manual Hook: Validate Data Files
set -e
echo "=== Data Studios Data Validation ==="
ERRORS=0
WARNINGS=0

echo "[1/4] Checking data file naming..."
for f in $(find data -type f -not -name ".*" -not -name "README*" 2>/dev/null); do
    bn=$(basename "$f")
    if echo "$bn" | grep -qE "[A-Z]|[[:space:]]"; then
        echo "  WARNING: $f should use snake_case"
        WARNINGS=$((WARNINGS + 1))
    fi
done

echo "[2/4] Checking for large CSV files..."
for f in $(find data -name "*.csv" 2>/dev/null); do
    size=$(wc -c < "$f" 2>/dev/null || echo 0)
    if [ "$size" -gt 104857600 ]; then
        echo "  WARNING: $f is $(( size / 1048576 ))MB CSV — convert to Parquet"
        WARNINGS=$((WARNINGS + 1))
    fi
done

echo "[3/4] Checking raw data immutability..."
if [ -d "data/raw" ] && command -v git &>/dev/null; then
    RAW_CHANGES=$(git diff --name-only data/raw/ 2>/dev/null)
    if [ -n "$RAW_CHANGES" ]; then
        echo "  ERROR: Raw data modified (should be immutable)"
        ERRORS=$((ERRORS + 1))
    fi
fi

echo "[4/4] Checking dataset documentation..."
for dir in data/processed/*/ data/external/*/ 2>/dev/null; do
    [ -d "$dir" ] || continue
    if [ ! -f "${dir}README.md" ] && [ ! -f "${dir}schema.yaml" ]; then
        echo "  WARNING: $dir has no README.md or schema.yaml"
        WARNINGS=$((WARNINGS + 1))
    fi
done

echo ""
[ "$ERRORS" -gt 0 ] && { echo "Found $ERRORS error(s), $WARNINGS warning(s)."; exit 1; }
echo "Passed with $WARNINGS warning(s)."
