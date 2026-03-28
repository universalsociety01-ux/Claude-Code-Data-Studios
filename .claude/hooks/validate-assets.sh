#!/bin/bash
# PostToolUse hook — validates files after Write/Edit operations
# Receives JSON on stdin with tool_name and file_path

INPUT=""
if [ -t 0 ]; then
    INPUT="{}"
else
    INPUT=$(cat)
fi

# Extract file path from input
if command -v jq &>/dev/null 2>&1; then
    FILE_PATH=$(echo "$INPUT" | jq -r '.file_path // .tool_input.file_path // ""' 2>/dev/null)
else
    FILE_PATH=$(echo "$INPUT" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//' | sed 's/"//')
fi

[ -z "$FILE_PATH" ] && exit 0
[ ! -f "$FILE_PATH" ] && exit 0

# Validate based on file type

# YAML validation
if echo "$FILE_PATH" | grep -qE '\.(yaml|yml)$'; then
    if command -v python3 &>/dev/null; then
        python3 -c "import yaml; yaml.safe_load(open('$FILE_PATH'))" 2>/dev/null || {
            echo "BLOCK: Invalid YAML syntax in $FILE_PATH" >&2
            exit 2
        }
    elif command -v python &>/dev/null; then
        python -c "import yaml; yaml.safe_load(open('$FILE_PATH'))" 2>/dev/null || {
            echo "BLOCK: Invalid YAML syntax in $FILE_PATH" >&2
            exit 2
        }
    fi
fi

# JSON validation
if echo "$FILE_PATH" | grep -qE '\.json$'; then
    if command -v python3 &>/dev/null; then
        python3 -m json.tool "$FILE_PATH" > /dev/null 2>&1 || {
            echo "BLOCK: Invalid JSON syntax in $FILE_PATH" >&2
            exit 2
        }
    elif command -v python &>/dev/null; then
        python -m json.tool "$FILE_PATH" > /dev/null 2>&1 || {
            echo "BLOCK: Invalid JSON syntax in $FILE_PATH" >&2
            exit 2
        }
    fi
fi

# Python syntax check
if echo "$FILE_PATH" | grep -qE '\.py$'; then
    if command -v python3 &>/dev/null; then
        python3 -c "import py_compile; py_compile.compile('$FILE_PATH', doraise=True)" 2>/dev/null || {
            echo "WARNING: Python syntax error in $FILE_PATH" >&2
        }
    fi

    # Check for hardcoded credentials
    if grep -nE "(password|secret|api_key|access_key|token)\s*=\s*['\"][^'\"]+['\"]" "$FILE_PATH" 2>/dev/null | grep -v "test_" | grep -v "#.*noqa" | head -3; then
        echo "WARNING: Possible hardcoded credentials in $FILE_PATH" >&2
    fi

    # Check for PII patterns in data processing code
    if echo "$FILE_PATH" | grep -q "src/data\|src/pipelines"; then
        if grep -nE "(ssn|social_security|credit_card|phone_number|email_address)" "$FILE_PATH" 2>/dev/null | grep -v "#.*PII\|#.*anonymize\|#.*mask" | head -3; then
            echo "WARNING: Possible PII field handling without anonymization in $FILE_PATH" >&2
        fi
    fi
fi

# SQL validation — check for dangerous patterns
if echo "$FILE_PATH" | grep -qE '\.sql$'; then
    if grep -niE "^[[:space:]]*(DROP|TRUNCATE|DELETE FROM)" "$FILE_PATH" 2>/dev/null | head -3; then
        echo "WARNING: Destructive SQL statement found in $FILE_PATH" >&2
    fi
    if grep -niE "SELECT \*" "$FILE_PATH" 2>/dev/null | head -3; then
        echo "WARNING: SELECT * found in $FILE_PATH — use explicit column lists" >&2
    fi
fi

# Notebook validation
if echo "$FILE_PATH" | grep -qE '\.ipynb$'; then
    if command -v python3 &>/dev/null; then
        python3 -c "
import json
with open('$FILE_PATH') as f:
    nb = json.load(f)
cells = nb.get('cells', [])
outputs = sum(1 for c in cells if c.get('outputs'))
if outputs > 0:
    print(f'WARNING: Notebook has {outputs} cells with outputs. Clear before committing.')
" 2>/dev/null
    fi
fi

# Config files — check for secrets
if echo "$FILE_PATH" | grep -q "configs/"; then
    if grep -nE "(password|secret|api_key|access_key|token|credential)" "$FILE_PATH" 2>/dev/null | grep -v '\$\{' | grep -v 'env\.' | grep -v '#' | head -3; then
        echo "WARNING: Possible secrets in config file $FILE_PATH — use environment variables" >&2
    fi
fi

# Pipeline code — check for data-driven values
if echo "$FILE_PATH" | grep -q "src/pipelines/"; then
    # Check for hardcoded paths
    if grep -nE "['\"](/[a-z]|[A-Z]:\\|s3://|gs://)" "$FILE_PATH" 2>/dev/null | grep -v "config\|Config\|#" | head -3; then
        echo "WARNING: Possible hardcoded path in pipeline $FILE_PATH" >&2
    fi
fi

# Model code — check for reproducibility
if echo "$FILE_PATH" | grep -q "src/models/"; then
    if grep -nE "\.cuda\(\)" "$FILE_PATH" 2>/dev/null | head -3; then
        echo "WARNING: Use .to(device) instead of .cuda() in $FILE_PATH" >&2
    fi
fi

exit 0
