# Hook: validate-commit.sh

## Overview
Pre-commit validation hook that prevents common data/ML project mistakes from being committed.

## Trigger
- **Event**: PreToolUse
- **Matcher**: Bash commands containing git commit
- **Timeout**: 15 seconds

## Exit Codes
- 0 — All checks passed (commit allowed)
- 2 — Blocking issue found (commit prevented)

## Checks Performed

### [1/8] Hardcoded Secrets (BLOCKING)
Scans Python files for patterns like password = "...", api_key = "...", token = "...".
Excludes test files and noqa comments. Requires 8+ character values.

### [2/8] Large Files (BLOCKING)
Prevents files >10MB from being committed. Data files should use DVC or git-lfs.

### [3/8] Binary Data/Model Files (BLOCKING)
Blocks: .csv, .parquet, .pkl, .h5, .hdf5, .arrow, .feather, .pt, .pth, .onnx, .pb, .safetensors, .bin, .joblib, .pickle. Excludes test fixtures.

### [4/8] Notebook Outputs (WARNING)
Checks .ipynb files for cells with outputs. Notebooks should be committed cleared.

### [5/8] YAML/JSON Syntax (BLOCKING)
Validates syntax of .yaml, .yml, .json config files using Python.

### [6/8] Python Syntax (BLOCKING)
Compiles Python files via py_compile to catch syntax errors.

### [7/8] Sensitive Files (BLOCKING)
Blocks: .env, credentials.*, secrets.*, .pem, .key, .p12 files.

### [8/8] TODO Format (WARNING)
Requires TODO(author): description format. Unattributed TODOs trigger warning.

## Dependencies
- Required: bash, git
- Optional: python3 (YAML/JSON/Python validation, notebook checks)
- Optional: jq (JSON stdin parsing, falls back to grep)

## Input
Receives JSON on stdin with tool_name and tool_input.command from Claude Code.

## Customization
- Change blocking to warning: change ERRORS to WARNINGS increment
- Adjust max file size: modify 10485760 (bytes) in section 2
- Add secret patterns: extend regex in section 1
