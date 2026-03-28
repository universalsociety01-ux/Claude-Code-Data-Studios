# Hooks Reference

Complete reference for all 9 automation hooks in Claude Code Data Studios.

## Overview

Hooks are shell scripts triggered automatically by Claude Code at specific lifecycle events. They enforce quality gates, manage session state, and provide observability.

## Hook Lifecycle

```
Session Start ──→ [session-start.sh] + [detect-gaps.sh]
      │
      ▼
  Working... ──→ [validate-commit.sh] on git commit
      │       ──→ [validate-push.sh] on git push
      │       ──→ [validate-assets.sh] on file write/edit
      │       ──→ [log-agent.sh] on subagent invocation
      │
      ▼
Context Full ──→ [pre-compact.sh] saves state
      │
      ▼
Session End ───→ [session-stop.sh] cleanup
```

## Hook Summary

| Hook | Trigger | Blocking | Purpose |
|------|---------|----------|---------|
| `session-start.sh` | SessionStart | No | Load project context, detect stage, show status |
| `detect-gaps.sh` | SessionStart | No | Scan for missing docs, tests, configs |
| `validate-commit.sh` | PreToolUse (Bash: `git commit`) | Yes (exit 2) | Check for debug code, secrets, large files |
| `validate-push.sh` | PreToolUse (Bash: `git push`) | Yes (exit 2) | Run tests, lint, verify branch policy |
| `validate-assets.sh` | PostToolUse (Write/Edit) | Yes (exit 2) | Validate written files (YAML syntax, JSON schema, Python imports) |
| `validate-data.sh` | Manual invocation | Yes (exit 1) | Run data quality checks on datasets |
| `pre-compact.sh` | PreCompact | No | Save session state before context compression |
| `session-stop.sh` | Stop | No | Archive session logs, cleanup temp files |
| `log-agent.sh` | SubagentStart | No | Log agent invocations for observability |

## Exit Codes

| Code | Meaning | Effect |
|------|---------|--------|
| `0` | Pass | Tool execution proceeds normally |
| `2` | Block | Tool execution is prevented (blocking hooks only) |
| Other | Error | Hook failure logged, tool execution proceeds |

## Trigger Types

### SessionStart
Fires once when a new Claude Code session begins. Non-blocking — output is informational.

**Hooks:** `session-start.sh`, `detect-gaps.sh`

### PreToolUse
Fires before a tool executes. Receives JSON on stdin with tool name and input. Can block execution with exit code 2.

**Stdin format:**
```json
{
  "tool_name": "Bash",
  "tool_input": { "command": "git commit -m 'message'" }
}
```

**Hooks:** `validate-commit.sh` (matches `git commit`), `validate-push.sh` (matches `git push`)

### PostToolUse
Fires after a tool completes. Receives JSON on stdin with tool name, input, and output. Can block with exit 2 (causes the result to be rejected).

**Hooks:** `validate-assets.sh` (matches Write, Edit tools)

### PreCompact
Fires before context window compression. Non-blocking — used to save state.

**Hooks:** `pre-compact.sh`

### Stop
Fires when the session ends. Non-blocking — used for cleanup and archival.

**Hooks:** `session-stop.sh`

### SubagentStart
Fires when a subagent is invoked. Non-blocking — used for logging.

**Hooks:** `log-agent.sh`

## Graceful Degradation

All hooks check for optional dependencies before using them:

| Dependency | Fallback |
|-----------|----------|
| `jq` | grep-based JSON parsing (slower but functional) |
| `python3` | YAML/JSON validation skipped, notebook checks skipped |
| `pytest` | Test suite skipped during push validation |
| `git` | Git-related context not shown |

No hook will fail due to a missing optional tool. They print `INFO:` and skip the check.

## Configuration in settings.json

Hooks are registered in `.claude/settings.json` under the `hooks` key:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "",
        "hooks": [
          { "type": "command", "command": "bash .claude/hooks/session-start.sh" }
        ]
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          { "type": "command", "command": "bash .claude/hooks/validate-commit.sh" }
        ]
      }
    ]
  }
}
```

### Matcher Patterns

- `""` (empty) — matches all tools
- `"Bash"` — matches Bash tool invocations
- `"Write"` / `"Edit"` — matches file write/edit tools

## Customization

### Disabling a Hook
Remove its entry from `settings.json` or comment out the command.

### Adding a Custom Hook
1. Create script in `.claude/hooks/your-hook.sh`
2. Make executable: `chmod +x .claude/hooks/your-hook.sh`
3. Add entry to `settings.json` with appropriate trigger and matcher
4. Test: `echo '{"tool_name":"Bash","tool_input":{"command":"test"}}' | bash .claude/hooks/your-hook.sh`

### Adjusting Timeouts
Add `"timeout"` (milliseconds) to the hook entry in settings.json.

## Per-Hook Documentation

Detailed documentation for each hook is in `.claude/docs/hooks-reference/`:

| File | Hook |
|------|------|
| `session-start.md` | Session initialization and context loading |
| `detect-gaps.md` | Gap detection and coverage analysis |
| `validate-commit.md` | Commit validation rules |
| `validate-push.md` | Push validation and test execution |
| `validate-assets.md` | File validation after write/edit |
| `validate-data.md` | Data quality validation |
| `pre-compact.md` | Pre-compaction state saving |
| `session-stop.md` | Session cleanup and archival |
| `log-agent.md` | Agent invocation logging |

## Troubleshooting

### Hook not firing
- Verify the trigger type and matcher in `settings.json`
- Check that the script is executable (`chmod +x`)
- Test manually: `bash .claude/hooks/hook-name.sh`

### Hook blocking unexpectedly
- Check exit code: blocking hooks use exit 2
- Run the hook manually with sample stdin to see output
- Check for false positives in pattern matching

### Hook output not visible
- SessionStart hook output appears at session start
- PreToolUse/PostToolUse output appears inline
- Check `.claude/agent-logs/` for logged output
