# Hook: validate-assets.sh

## Overview
Post-write validation that checks files after Write/Edit operations for syntax, security, and ML anti-patterns.

## Trigger
- **Event**: PostToolUse
- **Matcher**: Write or Edit operations
- **Timeout**: 10 seconds

## Exit Codes
- 0 — File is valid
- 2 — Invalid syntax (YAML/JSON)

## Checks by File Type

### YAML (.yaml, .yml) — BLOCKING
Validates syntax using PyYAML.

### JSON (.json) — BLOCKING
Validates syntax using json.tool.

### Python (.py) — MIXED
- BLOCKING: Syntax errors (py_compile)
- WARNING: Hardcoded credentials
- WARNING: PII fields in data/pipeline code without anonymization
- WARNING: .cuda() in model code (use .to(device))

### SQL (.sql) — WARNING
- Destructive statements (DROP, TRUNCATE, DELETE FROM)
- SELECT * usage

### Notebooks (.ipynb) — WARNING
Cell outputs present.

### Configs (configs/) — WARNING
Secrets without env var references.

### Pipelines (src/pipelines/) — WARNING
Hardcoded absolute paths or cloud URIs.

## Dependencies
- Required: bash
- Optional: python3, jq
