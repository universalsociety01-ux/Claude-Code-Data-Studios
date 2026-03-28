#!/bin/bash
# =============================================================================
# Claude Code Data Studios — Status Line
# Shows: context% | model | project stage | current task breadcrumb
# =============================================================================

INPUT=""
if [ ! -t 0 ]; then
    INPUT=$(cat 2>/dev/null)
fi

# --- Extract model name and context percentage ---
if command -v jq &>/dev/null 2>&1 && [ -n "$INPUT" ]; then
    MODEL=$(echo "$INPUT" | jq -r '.model // "claude"' 2>/dev/null)
    CONTEXT_PCT=$(echo "$INPUT" | jq -r '.context_window_percent // ""' 2>/dev/null)
    CWD=$(echo "$INPUT" | jq -r '.cwd // ""' 2>/dev/null)
else
    MODEL=$(echo "$INPUT" | grep -o '"model"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"model"[[:space:]]*:[[:space:]]*"//' | sed 's/"//')
    CONTEXT_PCT=$(echo "$INPUT" | grep -o '"context_window_percent"[[:space:]]*:[[:space:]]*[0-9]*' | head -1 | sed 's/.*:[[:space:]]*//')
    CWD=$(echo "$INPUT" | grep -o '"cwd"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"cwd"[[:space:]]*:[[:space:]]*"//' | sed 's/"//')
fi

[ -z "$MODEL" ] && MODEL="claude"
[ -z "$CONTEXT_PCT" ] && CONTEXT_PCT="?"

# Normalize model name
case "$MODEL" in
    *opus*)   MODEL_SHORT="Opus" ;;
    *sonnet*) MODEL_SHORT="Sonnet" ;;
    *haiku*)  MODEL_SHORT="Haiku" ;;
    *)        MODEL_SHORT="$MODEL" ;;
esac

# --- Detect project stage (CRISP-DM lifecycle) ---
# Priority: 1) Explicit stage file  2) Auto-detect from project artifacts
STAGE=""

# Check explicit stage file
if [ -f "production/stage.txt" ]; then
    STAGE=$(head -1 production/stage.txt 2>/dev/null | tr -d '[:space:]')
fi

# Auto-detect if no explicit stage
if [ -z "$STAGE" ]; then
    HAS_RAW_DATA=false
    HAS_PROCESSED=false
    HAS_NOTEBOOKS=false
    HAS_MODELS=false
    HAS_SERVING=false
    HAS_MONITORING=false

    # Check for data
    [ -d "data/raw" ] && [ "$(ls -A data/raw 2>/dev/null)" ] && HAS_RAW_DATA=true
    [ -d "data/processed" ] && [ "$(ls -A data/processed 2>/dev/null)" ] && HAS_PROCESSED=true

    # Check for notebooks/analysis
    NOTEBOOK_COUNT=$(find notebooks -name "*.ipynb" 2>/dev/null | wc -l)
    [ "$NOTEBOOK_COUNT" -gt 0 ] && HAS_NOTEBOOKS=true

    # Check for trained models
    MODEL_COUNT=$(find models/trained models/staging models/production -type f 2>/dev/null | wc -l)
    [ "$MODEL_COUNT" -gt 0 ] && HAS_MODELS=true

    # Check for serving code
    [ -d "src/api" ] && [ "$(find src/api -name '*.py' 2>/dev/null | head -1)" ] && HAS_SERVING=true

    # Check for monitoring
    [ -d "src/monitoring" ] && [ "$(find src/monitoring -name '*.py' 2>/dev/null | head -1)" ] && HAS_MONITORING=true

    # Determine stage
    if $HAS_MONITORING || $HAS_SERVING; then
        STAGE="Deployment"
    elif $HAS_MODELS; then
        STAGE="Evaluation"
    elif $HAS_NOTEBOOKS && $HAS_PROCESSED; then
        STAGE="Modeling"
    elif $HAS_RAW_DATA || $HAS_PROCESSED; then
        STAGE="Data Prep"
    elif $HAS_NOTEBOOKS; then
        STAGE="EDA"
    else
        # Check source code count
        SRC_COUNT=$(find src -name "*.py" 2>/dev/null | wc -l)
        if [ "$SRC_COUNT" -gt 5 ]; then
            STAGE="Development"
        elif [ "$SRC_COUNT" -gt 0 ]; then
            STAGE="Setup"
        else
            STAGE="Init"
        fi
    fi
fi

# --- Stage emoji/icon ---
case "$STAGE" in
    Init)       STAGE_ICON="[>]" ;;
    Setup)      STAGE_ICON="[S]" ;;
    "Data Prep") STAGE_ICON="[D]" ;;
    EDA)        STAGE_ICON="[E]" ;;
    Modeling)   STAGE_ICON="[M]" ;;
    Evaluation) STAGE_ICON="[V]" ;;
    Deployment) STAGE_ICON="[P]" ;;
    Development) STAGE_ICON="[~]" ;;
    *)          STAGE_ICON="[-]" ;;
esac

# --- Active task breadcrumb ---
BREADCRUMB=""
if [ -f "production/session-state/active.md" ]; then
    # Parse active.md for hierarchy: ## Epic / ## Feature / ## Task
    EPIC=$(grep -m1 "^## Epic" production/session-state/active.md 2>/dev/null | sed 's/^## Epic[[:space:]]*[:|-]*//' | xargs)
    FEATURE=$(grep -m1 "^## Feature" production/session-state/active.md 2>/dev/null | sed 's/^## Feature[[:space:]]*[:|-]*//' | xargs)
    TASK=$(grep -m1 "^## Task" production/session-state/active.md 2>/dev/null | sed 's/^## Task[[:space:]]*[:|-]*//' | xargs)

    PARTS=""
    [ -n "$EPIC" ] && PARTS="$EPIC"
    [ -n "$FEATURE" ] && { [ -n "$PARTS" ] && PARTS="$PARTS > $FEATURE" || PARTS="$FEATURE"; }
    [ -n "$TASK" ] && { [ -n "$PARTS" ] && PARTS="$PARTS > $TASK" || PARTS="$TASK"; }

    # Truncate if too long
    if [ ${#PARTS} -gt 50 ]; then
        PARTS="${PARTS:0:47}..."
    fi
    [ -n "$PARTS" ] && BREADCRUMB=" | $PARTS"
fi

# --- Active experiment ---
EXP=""
if [ -d "experiments" ]; then
    LATEST_EXP=$(ls -t experiments/*.md 2>/dev/null | head -1)
    if [ -n "$LATEST_EXP" ]; then
        EXP_NAME=$(basename "$LATEST_EXP" .md)
        EXP=" | exp:$EXP_NAME"
    fi
fi

# --- Sprint info ---
SPRINT=""
if [ -f "production/sprints/current.md" ]; then
    SPRINT_NAME=$(head -1 production/sprints/current.md 2>/dev/null | sed 's/^#[[:space:]]*//')
    [ -n "$SPRINT_NAME" ] && SPRINT=" | $SPRINT_NAME"
fi

# --- Git branch ---
BRANCH=""
if command -v git &>/dev/null && git rev-parse --git-dir &>/dev/null 2>&1; then
    BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [ -n "$BRANCH" ] && BRANCH=" | $BRANCH"
fi

# --- Context usage color hint ---
CTX_WARN=""
if [ "$CONTEXT_PCT" != "?" ]; then
    if [ "$CONTEXT_PCT" -gt 80 ] 2>/dev/null; then
        CTX_WARN="!"
    fi
fi

# --- Assemble status line ---
echo "${CONTEXT_PCT}%${CTX_WARN} ${MODEL_SHORT} ${STAGE_ICON} ${STAGE}${BRANCH}${BREADCRUMB}${EXP}${SPRINT}"
