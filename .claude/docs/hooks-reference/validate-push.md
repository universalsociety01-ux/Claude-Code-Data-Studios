# Hook: validate-push.sh

## Overview
Pre-push validation that protects branches, runs tests, and checks for debug code.

## Trigger
- **Event**: PreToolUse
- **Matcher**: Bash commands containing git push
- **Timeout**: 10 seconds

## Exit Codes
- 0 — Push allowed
- 2 — Push blocked

## Checks Performed

### Force Push Detection (BLOCKING)
Blocks --force and -f flags. Force push destroys remote history.

### Protected Branch Warning (WARNING)
Warns when pushing to: main, master, production. Recommends feature branch + PR.

### Test Suite (BLOCKING if tests fail)
Runs pytest if available. Falls back to python3 -m pytest. Skips if not installed.

### Debug Breakpoints (WARNING)
Scans src/ for: breakpoint(), import pdb, pdb.set_trace(), import ipdb.

### Uncommitted Changes (WARNING)
Warns about changes that wont be included in the push.

## Dependencies
- Required: bash, git
- Optional: pytest
