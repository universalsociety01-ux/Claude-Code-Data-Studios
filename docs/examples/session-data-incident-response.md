# Example: Handling a Data Incident

**Duration:** ~25 minutes | **Turns:** 8 | **Phase:** Monitoring
**Agents involved:** `monitoring-engineer`, `data-engineering-lead`, `pipeline-engineer`, `data-quality-engineer`

---

## Context

A drift detection alert fires: the `user_engagement_features` pipeline output shows significant distribution shift in 3 features compared to the previous 7-day window.

---

## Transcript

### Turn 1 — User reports alert

```
User: We got a drift alert on user engagement features. Three features
      shifted significantly overnight. What's going on?
```

### Turn 2 — Agent investigates

```
[monitoring-engineer]

Investigating the drift alert...

Alert details:
  Pipeline: user_engagement_features
  Date: 2026-03-28
  Features flagged:
    - session_count_7d: KS statistic 0.23 (threshold: 0.10) ⚠️
    - avg_session_duration_7d: KS statistic 0.31 (threshold: 0.10) ⚠️
    - click_depth_7d: KS statistic 0.18 (threshold: 0.10) ⚠️
  Other features: within normal range

Let me check the upstream data to identify the root cause.

Checking raw clickstream data for yesterday:
  - Row count: 12M events (normal: ~50M) ⚠️ 76% drop
  - Missing sources: mobile_app events absent entirely
  - Web events: 12M (normal: ~18M, slight dip but reasonable)
  - Mobile events: 0 (normal: ~32M) ❌

Root cause identified: Mobile app events stopped arriving.
Likely cause: upstream data pipeline or mobile tracking failure.
```

### Turn 3 — User asks for impact assessment

```
User: What's the downstream impact? Is the recommendation model affected?
```

### Turn 4 — Agent assesses impact

```
[monitoring-engineer → consults data-engineering-lead]

Impact assessment:

1. Feature pipeline:
   - Features computed on partial data (web only, no mobile)
   - 65% of users have mobile activity — their features are WRONG
   - Features look like "low engagement" when actually data is missing

2. Recommendation model:
   - Batch scoring ran at 04:00 using the corrupted features
   - ~1.3M users received recommendations based on incomplete data
   - Model likely under-recommending for mobile-heavy users

3. Business impact:
   - Affected users: ~1.3M (65% of active users)
   - Severity: MEDIUM — recommendations degraded but not dangerous
   - Duration: since 02:00 UTC today (~7 hours)

Options for remediation:

Option 1: Rollback and re-run
  - Rollback features to yesterday's version
  - Re-run recommendation scoring with correct features
  - Impact: 2-3 hours to complete, users see yesterday's recommendations

Option 2: Quarantine and wait
  - Mark today's features as "partial" in metadata
  - Wait for mobile data to arrive, then re-process
  - Impact: depends on upstream fix timeline

Option 3: Impute from history
  - Use 6-day mobile features + today's web features
  - Approximate but better than missing data
  - Impact: 1 hour, accuracy ~90% of normal

Which approach do you prefer?
```

### Turn 5 — User decides

```
User: Go with Option 1 — rollback and re-run. Also, let's add a check
      so this doesn't happen silently again.
```

### Turn 6 — Agent executes rollback

```
[pipeline-engineer]

Executing rollback:

1. ✓ Rolled back features to 2026-03-27 version
2. ✓ Re-running recommendation scoring with correct features
   (ETA: ~45 minutes for 2M users)
3. ✓ Marked 2026-03-28 features as "quarantined" in metadata

Scoring in progress... will notify when complete.
```

### Turn 7 — Agent adds preventive check

```
[data-quality-engineer]

Adding upstream completeness check to prevent recurrence:

New validation in user_engagement pipeline (stage 1 — Extract):

  Check: source_completeness
  Rule: Each expected source (web, mobile_app, mobile_web) must have
        > 50% of its 7-day average row count
  Action: If check fails → pipeline halts, alert fires, features NOT updated
  Fallback: Previous day's features remain active

Added to:
  src/pipelines/user_engagement.py — completeness check in extract stage
  configs/pipelines/user_engagement.yaml — thresholds per source
  tests/unit/test_user_engagement.py — test for completeness check

This ensures that partial upstream data never silently corrupts features.
```

### Turn 8 — Incident closed

```
[monitoring-engineer]

Incident resolved:

Timeline:
  02:00 — Mobile events stopped arriving (upstream issue)
  02:15 — Feature pipeline ran on partial data
  04:00 — Recommendation scoring used corrupted features
  09:00 — Drift alert fired (3 features flagged)
  09:05 — Investigation identified missing mobile events
  09:15 — Decision: rollback and re-run
  09:20 — Rollback executed, scoring re-running
  10:05 — Scoring complete, correct recommendations live
  10:15 — Preventive completeness check added

Root cause: Upstream mobile event pipeline failure (being investigated
by the mobile team — separate incident).

Prevention: Source completeness check now halts the feature pipeline
if any data source drops below 50% of its expected volume.

Incident report filed: docs/runbooks/incident-2026-03-28-mobile-data.md
```

---

## Key Patterns Demonstrated

1. **Systematic investigation** — agent checked data volumes before speculating
2. **Impact assessment** — quantified affected users, severity, and duration
3. **Options for remediation** — 3 approaches with trade-offs, not just one fix
4. **User decides** — user chose rollback over waiting or imputing
5. **Preventive action** — completeness check added to prevent recurrence
6. **Incident documentation** — timeline and root cause recorded for future reference
