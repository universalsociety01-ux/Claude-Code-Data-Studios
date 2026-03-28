# Hook: validate-data.sh

## Trigger
Manual — run explicitly for data file validation

## Exit Codes
- `0` — Pass (allow operation)
- `2` — Block (prevent operation, show error)

## What It Checks
- File naming conventions (snake_case)\n- Large CSV files (should be Parquet)\n- Raw data immutability\n- Dataset documentation presence

## Configuration
Located in `.claude/hooks/validate-data.sh`
Configured in `.claude/settings.json` under `hooks` section.

## Dependencies
- bash
- git (for git-related hooks)
- python3 (optional, for validation)
- jq (optional, for JSON parsing — falls back to grep)
