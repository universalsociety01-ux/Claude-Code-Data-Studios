# Hooks Reference

9 automation hooks enforce quality and manage sessions.

| Hook | Trigger | Blocking? |
|------|---------|-----------|
| validate-commit.sh | PreToolUse (git commit) | Yes (exit 2) |
| validate-push.sh | PreToolUse (git push) | Yes (exit 2) |
| validate-assets.sh | PostToolUse (Write/Edit) | Yes (exit 2) |
| validate-data.sh | Manual | Yes (exit 1) |
| session-start.sh | SessionStart | No |
| detect-gaps.sh | SessionStart | No |
| pre-compact.sh | PreCompact | No |
| session-stop.sh | Stop | No |
| log-agent.sh | SubagentStart | No |

Exit codes: 0 = pass, 2 = block.

All hooks degrade gracefully when jq, python3, or pytest are unavailable.

See .claude/docs/hooks-reference/ for per-hook docs.
