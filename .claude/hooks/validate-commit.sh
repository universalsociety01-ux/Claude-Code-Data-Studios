#!/bin/bash
# =============================================================================
# PreToolUse Hook: Validate Git Commits
# Triggered: Before git commit operations
# Exit 0 = allow, Exit 2 = block
# =============================================================================
set -e

INPUT=""
if [ ! -t 0 ]; then
    INPUT=$(cat 2>/dev/null)
fi

# --- Extract tool info from JSON stdin ---
TOOL_NAME=""
COMMAND=""
if command -v jq &>/dev/null 2>&1 && [ -n "$INPUT" ]; then
    TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""' 2>/dev/null)
    COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null)
else
    TOOL_NAME=$(echo "$INPUT" | grep -o '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"tool_name"[[:space:]]*:[[:space:]]*"//' | sed 's/"//')
    COMMAND=$(echo "$INPUT" | grep -o '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"command"[[:space:]]*:[[:space:]]*"//' | sed 's/"//')
fi

# Only run on git commit commands
echo "$COMMAND" | grep -q "git commit" || exit 0

echo "=== Data Studios Commit Validation ===" >&2
ERRORS=0
WARNINGS=0

# [1/8] Check for hardcoded secrets
echo "[1/8] Checking for hardcoded secrets..." >&2
SECRET_HITS=$(grep -rn -E "(password|secret|api_key|access_key|token|private_key)\s*=\s*['\"][^'\"]{8,}['\"]" --include="*.py" . 2>/dev/null | grep -v "test_" | grep -v "#.*noqa" | grep -v "venv/" | head -5)
if [ -n "$SECRET_HITS" ]; then
    echo "BLOCK: Hardcoded secrets detected:" >&2
    echo "$SECRET_HITS" >&2
    ERRORS=$((ERRORS + 1))
fi

# [2/8] Check for large files (>10MB)
echo "[2/8] Checking for large files..." >&2
for file in $(git diff --cached --name-only 2>/dev/null); do
    if [ -f "$file" ]; then
        size=$(wc -c < "$file" 2>/dev/null || echo 0)
        if [ "$size" -gt 10485760 ]; then
            echo "BLOCK: $file is $(( size / 1048576 ))MB (max 10MB). Use DVC or git-lfs." >&2
            ERRORS=$((ERRORS + 1))
        fi
    fi
done

# [3/8] Check for data/model binary files
echo "[3/8] Checking for binary data/model files..." >&2
BINARY_FILES=$(git diff --cached --name-only 2>/dev/null | grep -E "\.(csv|parquet|pkl|h5|hdf5|arrow|feather|pt|pth|onnx|pb|safetensors|bin|joblib|pickle)$" | grep -v "test")
if [ -n "$BINARY_FILES" ]; then
    echo "BLOCK: Binary data/model files staged for commit:" >&2
    echo "$BINARY_FILES" >&2
    echo "Use DVC, git-lfs, or model registry instead." >&2
    ERRORS=$((ERRORS + 1))
fi

# [4/8] Check notebook outputs
echo "[4/8] Checking notebook outputs..." >&2
for nb in $(git diff --cached --name-only 2>/dev/null | grep "\.ipynb$"); do
    if [ -f "$nb" ]; then
        if command -v python3 &>/dev/null; then
            outputs=$(python3 -c "
import json
with open('$nb') as f:
    nb = json.load(f)
print(sum(1 for c in nb.get('cells', []) if c.get('outputs')))
" 2>/dev/null || echo "0")
            if [ "$outputs" -gt 0 ]; then
                echo "WARNING: $nb has $outputs cells with outputs. Clear with: jupyter nbconvert --clear-output '$nb'" >&2
                WARNINGS=$((WARNINGS + 1))
            fi
        fi
    fi
done

# [5/8] Validate YAML configs
echo "[5/8] Validating YAML/JSON configs..." >&2
if command -v python3 &>/dev/null; then
    for cfg in $(git diff --cached --name-only 2>/dev/null | grep -E "\.(yaml|yml)$"); do
        if [ -f "$cfg" ]; then
            python3 -c "import yaml; yaml.safe_load(open('$cfg'))" 2>/dev/null || {
                echo "BLOCK: Invalid YAML: $cfg" >&2
                ERRORS=$((ERRORS + 1))
            }
        fi
    done
    for cfg in $(git diff --cached --name-only 2>/dev/null | grep "\.json$" | grep -v "package-lock"); do
        if [ -f "$cfg" ]; then
            python3 -c "import json; json.load(open('$cfg'))" 2>/dev/null || {
                echo "BLOCK: Invalid JSON: $cfg" >&2
                ERRORS=$((ERRORS + 1))
            }
        fi
    done
fi

# [6/8] Check Python syntax
echo "[6/8] Checking Python syntax..." >&2
if command -v python3 &>/dev/null; then
    for pyfile in $(git diff --cached --name-only 2>/dev/null | grep "\.py$"); do
        if [ -f "$pyfile" ]; then
            python3 -c "import py_compile; py_compile.compile('$pyfile', doraise=True)" 2>/dev/null || {
                echo "BLOCK: Python syntax error: $pyfile" >&2
                ERRORS=$((ERRORS + 1))
            }
        fi
    done
fi

# [7/8] Check for .env or credential files
echo "[7/8] Checking for sensitive files..." >&2
SENSITIVE=$(git diff --cached --name-only 2>/dev/null | grep -iE "(\.env|credentials|secrets|\.pem|\.key|\.p12)$")
if [ -n "$SENSITIVE" ]; then
    echo "BLOCK: Sensitive files staged for commit:" >&2
    echo "$SENSITIVE" >&2
    ERRORS=$((ERRORS + 1))
fi

# [8/8] Check TODO format
echo "[8/8] Checking TODO format..." >&2
for pyfile in $(git diff --cached --name-only 2>/dev/null | grep "\.py$"); do
    if [ -f "$pyfile" ]; then
        BAD_TODOS=$(grep -n "TODO[^(]" "$pyfile" 2>/dev/null | head -3)
        if [ -n "$BAD_TODOS" ]; then
            echo "WARNING: Unattributed TODOs in $pyfile — use TODO(author): description" >&2
            WARNINGS=$((WARNINGS + 1))
        fi
    fi
done

# --- Summary ---
if [ "$ERRORS" -gt 0 ]; then
    echo "" >&2
    echo "BLOCKED: $ERRORS error(s), $WARNINGS warning(s). Fix before committing." >&2
    exit 2
fi

if [ "$WARNINGS" -gt 0 ]; then
    echo "" >&2
    echo "PASSED with $WARNINGS warning(s)." >&2
fi

exit 0
