# Hook: validate-data.sh

## Overview
Manual data validation for file naming, sizes, immutability, and documentation.

## Trigger
- **Event**: Manual (not auto-triggered)
- **Usage**: bash .claude/hooks/validate-data.sh

## Exit Codes
- 0 — Passed
- 1 — Errors found

## Checks

### [1/4] File Naming
Checks data/ for non-snake_case names (uppercase, spaces).

### [2/4] Large CSV Files
Finds CSVs >100MB. Recommends Parquet conversion.

### [3/4] Raw Data Immutability
Uses git diff to detect modifications in data/raw/. Raw data must never change.

### [4/4] Dataset Documentation
Checks data/processed/ and data/external/ subdirectories for README.md or schema.yaml.

## Dependencies
- Required: bash, find
- Optional: git
