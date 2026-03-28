# Hook: pre-compact.sh

## Overview
Saves session state before context compression. Enables recovery after compaction.

## Trigger
- **Event**: PreCompact
- **Timeout**: 10 seconds

## What It Saves
All saved to .claude/session-state/ with timestamp:

- git-status-{ts}.txt — working tree changes
- git-diff-{ts}.txt — diff statistics
- git-log-{ts}.txt — last 10 commits
- git-branch-{ts}.txt — current branch
- experiments-{ts}.txt — recent experiment files
- latest-experiment-{ts}.md — copy of most recent experiment
- sprint-{ts}.md — copy of current sprint
- active-task-{ts}.md — copy of active task
- todos-{ts}.txt — all TODO items

## Cleanup
Prunes old state files, keeping last 5 per prefix.

## Dependencies
- Required: bash
- Optional: git
