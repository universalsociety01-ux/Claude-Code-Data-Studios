# Example: Designing a Feature Pipeline

**Duration:** ~40 minutes | **Turns:** 12 | **Phase:** Data Preparation
**Agents involved:** `data-engineering-lead`, `pipeline-engineer`, `feature-engineer`, `data-quality-engineer`

---

## Context

A team needs to build a feature pipeline that computes user engagement features from raw event data for a recommendation model.

---

## Transcript

### Turn 1 — User initiates

```
User: I need a feature pipeline that computes user engagement features
      from our clickstream data for the recommendation model.
```

### Turn 2 — Agent asks clarifying questions

```
[data-engineering-lead]

Before I design this pipeline, I need to understand a few things:

1. What's your data volume? How many events per day?
2. Where does the raw clickstream data live? (Kafka, S3, database?)
3. What's the freshness requirement — real-time features or daily batch?
4. What downstream consumers will use these features? (training only, or serving too?)
```

> **Why this matters:** The agent doesn't assume. Data volume determines technology choice, freshness determines architecture pattern, and consumers determine the serving strategy.

### Turn 3 — User provides context

```
User: About 50M events/day in S3 as Parquet. Daily batch is fine for now,
      but we might need real-time later. Both training and serving will
      use the features.
```

### Turn 4 — Agent presents options

```
[data-engineering-lead]

Given 50M events/day in S3, daily batch, with future real-time needs:

Option 1: Prefect + DuckDB
  ✓ Simple, fast for your current volume
  ✓ DuckDB handles 50M rows easily on a single machine
  ✗ Harder to scale to real-time later
  Effort: 1 week

Option 2: Prefect + Spark
  ✓ Scales to 10x volume without redesign
  ✓ Good Parquet/S3 integration
  ✗ More infrastructure overhead
  Effort: 1.5 weeks

Option 3: Dagster + DuckDB (software-defined assets)
  ✓ Each feature is a versioned asset with lineage
  ✓ Built-in freshness policies for future real-time
  ✓ Strong typing catches errors early
  ✗ Learning curve if team is new to Dagster
  Effort: 2 weeks

I'd recommend Option 1 for speed, or Option 3 if you want to invest in
a foundation that handles the real-time transition later.
```

> **Collaboration pattern:** 3 options with clear trade-offs. Agent gives a recommendation but doesn't decide.

### Turn 5 — User decides

```
User: Let's go with Option 1 (Prefect + DuckDB). We can migrate later
      if we need real-time.
```

### Turn 6 — Agent drafts the design

```
[data-engineering-lead → delegates to pipeline-engineer]

Here's the pipeline design:

Pipeline: user_engagement_features
Schedule: Daily at 02:00 UTC (after raw data lands)
Source: s3://data-lake/clickstream/{date}/
Output: s3://feature-store/user_engagement/{date}/

Stages:
1. Extract — Read Parquet from S3 with schema validation
2. Clean — Handle nulls, deduplicate, filter bots
3. Compute — Calculate engagement features:
   - session_count_7d: sessions in last 7 days
   - avg_session_duration_7d: average session length
   - click_depth_7d: average pages per session
   - content_diversity_7d: unique content categories viewed
   - recency_hours: hours since last activity
4. Validate — Run quality checks (nulls, ranges, distributions)
5. Write — Output as Parquet with feature metadata

Config: configs/pipelines/user_engagement.yaml
Tests: tests/unit/test_user_engagement.py

Shall I proceed with implementation?
```

### Turn 7 — User approves with a modification

```
User: Looks good, but add a "return_rate" feature — percentage of
      sessions where the user comes back within 24 hours.
```

### Turn 8 — Agent implements

```
[pipeline-engineer]

Added return_rate_7d feature. Here's what I'll create:

Files:
  src/pipelines/user_engagement.py — Pipeline implementation
  src/features/engagement.py — Feature computation logic
  configs/pipelines/user_engagement.yaml — Configuration
  tests/unit/test_user_engagement.py — Tests

Writing src/pipelines/user_engagement.py...
```

> **Hook fires:** `validate-assets.sh` runs after each file write, checking Python imports, config syntax, and coding standards.

### Turn 9 — Feature engineer reviews

```
[feature-engineer]

Reviewing the feature code for leakage and serving compatibility:

✓ All features use 7-day lookback window — no future data leakage
✓ Null handling documented: impute with 0 for count features, NaN for ratios
✓ return_rate_7d correctly uses 24-hour threshold
✓ All features work in both batch and online serving
⚠ Suggestion: add feature metadata (name, type, description, version)
  for the feature store catalog.

Adding feature metadata...
```

### Turn 10 — Data quality engineer validates

```
[data-quality-engineer]

Running validation checks:

✓ Schema validation on input (clickstream Parquet schema)
✓ Schema validation on output (feature schema with types)
✓ Null check: no unexpected nulls in output
✓ Range check: session_count_7d >= 0, avg_session_duration_7d >= 0
✓ Distribution check: features follow expected patterns
✓ Row count check: output rows = distinct users in input

All quality gates pass.
```

### Turn 11 — Agent runs tests

```
[pipeline-engineer]

Running test suite:

tests/unit/test_user_engagement.py
  ✓ test_extract_validates_schema
  ✓ test_clean_removes_duplicates
  ✓ test_clean_filters_bots
  ✓ test_compute_session_count_correct
  ✓ test_compute_return_rate_correct
  ✓ test_compute_handles_nulls
  ✓ test_compute_no_future_leakage
  ✓ test_pipeline_idempotent

8 passed, 0 failed
```

### Turn 12 — Summary and next steps

```
[data-engineering-lead]

Pipeline complete:

Created:
  ✓ src/pipelines/user_engagement.py (Prefect flow, DuckDB processing)
  ✓ src/features/engagement.py (6 features with metadata)
  ✓ configs/pipelines/user_engagement.yaml (schedule, paths, thresholds)
  ✓ tests/unit/test_user_engagement.py (8 tests, all passing)

Features:
  session_count_7d, avg_session_duration_7d, click_depth_7d,
  content_diversity_7d, recency_hours, return_rate_7d

Next steps:
  1. Run on historical data to backfill features
  2. Connect to the recommendation model's training pipeline
  3. Set up monitoring for feature freshness and drift
```

---

## Key Patterns Demonstrated

1. **Question first** — Agent asked 4 clarifying questions before proposing anything
2. **Options with trade-offs** — 3 options with effort estimates, pros/cons
3. **User decides** — User chose the approach and added a requirement
4. **Multi-agent coordination** — Lead delegated to specialists, each contributed expertise
5. **Quality gates** — Hooks validated files, quality engineer ran checks, tests passed
6. **Incremental approval** — Design approved before implementation started
