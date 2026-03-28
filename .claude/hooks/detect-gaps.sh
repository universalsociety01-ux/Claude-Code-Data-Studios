#!/bin/bash
# Detects missing documentation, tests, model cards, monitoring
set -e
echo "=== Data Studios Gap Detection ==="
GAPS=0

for src in $(find src -name "*.py" -not -name "__init__.py" 2>/dev/null); do
    module=$(basename "$src" .py)
    if ! find tests -name "test_${module}.py" -o -name "${module}_test.py" 2>/dev/null | grep -q .; then
        echo "  MISSING TEST: $src"; GAPS=$((GAPS + 1))
    fi
done

for model_dir in models/trained/*/ models/production/*/ 2>/dev/null; do
    [ -d "$model_dir" ] || continue
    [ ! -f "${model_dir}MODEL_CARD.md" ] && [ ! -f "${model_dir}model_card.md" ] && { echo "  MISSING MODEL CARD: $model_dir"; GAPS=$((GAPS + 1)); }
done

[ "$GAPS" -gt 0 ] && echo "Found $GAPS gap(s)." || echo "No gaps detected."
