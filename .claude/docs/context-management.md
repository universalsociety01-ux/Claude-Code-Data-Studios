# Context Management

How to work effectively with Claude Code's context window in data/ML projects.

## What Gets Auto-Loaded

Every Claude Code session automatically loads:

| Source | Content | Size Impact |
|--------|---------|-------------|
| `CLAUDE.md` | Master configuration, agent roster, standards | ~450 lines |
| `.claude/rules/*.md` | Path-scoped rules matching current files | ~30-50 lines each |
| `.claude/skills/` | Skill names and descriptions (listed in prompt) | Minimal |
| Active agent | Full agent definition when subagent invoked | ~60-120 lines |
| `settings.json` | Hooks, permissions (parsed, not displayed) | Minimal |

## How Context Window Works

- Claude Code has a large but finite context window
- As conversation grows, older messages are compressed (compacted)
- Pre-compact hook saves critical state before compression
- Session-start hook reloads context after compaction
- Status line shows context usage percentage

## Pre-Compact Hook Behavior

When context approaches limits, `pre-compact.sh` saves to `.claude/session-state/`:

| File | Content |
|------|---------|
| `git-status-{ts}.txt` | Working tree changes |
| `git-diff-{ts}.txt` | Diff statistics |
| `git-log-{ts}.txt` | Last 10 commits |
| `git-branch-{ts}.txt` | Current branch |
| `experiments-{ts}.txt` | Recent experiment files |
| `latest-experiment-{ts}.md` | Copy of latest experiment |
| `sprint-{ts}.md` | Copy of current sprint plan |
| `active-task-{ts}.md` | Copy of active work item |
| `todos-{ts}.txt` | All TODO items |

Automatically prunes to last 5 sessions per prefix.

## Post-Compact Recovery

After compaction, `session-start.sh` reloads:
- Git branch and recent commits
- Project stage (from `production/stage.txt` or auto-detected)
- Current sprint info
- Latest experiment
- Active task
- Saved session state from pre-compact

**Tip:** Run `/start` after compaction for full context reload.

## Strategies for Large Codebases

### 1. Focus on Relevant Modules
Don't read the entire codebase. Focus on files relevant to the current task.

### 2. Use Agents for Exploration
The `Explore` subagent runs in a separate context, protecting your main window:
```
Use Agent with subagent_type=Explore for broad codebase searches
```

### 3. Reference Docs Over Inline Code
Point to file paths instead of reading entire files into context:
- "See `src/pipelines/user_events.py:45`" is better than pasting 200 lines

### 4. Use Tasks for Tracking
`TaskCreate` and `TaskUpdate` persist progress without consuming context:
- Break complex work into tasks
- Mark completed tasks to track progress
- Tasks survive compaction

### 5. Keep Agent Prompts Specific
Focused, specific agent prompts produce smaller, more useful results:
- Bad: "Look at all the code and tell me about it"
- Good: "Find where user_id is validated in src/pipelines/"

### 6. Leverage Session State
Write important decisions to files that persist:
- `production/session-state/active.md` — current work item
- `experiments/*.md` — experiment logs
- `docs/adr/*.md` — architecture decisions

## How to Recover from Lost Context

If context is compressed and you lose track:

1. **Run `/start`** — reloads project state
2. **Check session state:** `ls .claude/session-state/` for saved state
3. **Check git:** `git log --oneline -10` and `git diff --stat`
4. **Check experiments:** `ls -t experiments/*.md | head -5`
5. **Check tasks:** Use `TaskList` to see pending work
6. **Check agent logs:** `tail -20 .claude/agent-logs/agent-log.jsonl`

## Tips

- Start each session with `/start` for full context
- Use `/map-systems` to understand dependencies before diving in
- Keep `production/session-state/active.md` updated with current task
- Write findings to files (experiments, ADRs) so they survive compaction
- Use the statusline to monitor context usage (watch for `!` warning)
