# Context Management

## Auto-Loaded
- CLAUDE.md — master configuration
- Path-scoped rules matching current files
- Active agent definition for subagents
- Skills listed in system prompt

## Context Compression
Pre-compact hook saves state to .claude/session-state/:
- Git status, diff, log, branch
- Latest experiment
- Active sprint and task
- TODO items
Pruned to last 5 sessions.

## Recovery After Compaction
Session-start hook reloads:
- Saved session state
- Project stage
- Active work items

## Tips for Large Codebases
1. Focus on relevant modules
2. Use Explore agent for broad searches
3. Reference docs over inline code
4. Specific agent prompts = smaller context
5. Use TaskCreate for tracking progress
