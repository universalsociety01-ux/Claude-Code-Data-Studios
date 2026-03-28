# Example: Deploying a Model to Production

**Duration:** ~30 minutes | **Turns:** 10 | **Phase:** Deployment
**Agents involved:** `mlops-lead`, `ml-deploy-engineer`, `monitoring-engineer`, `infrastructure-engineer`, `ml-engineering-lead`

---

## Context

The churn prediction model (XGBoost, exp-churn-001) has passed evaluation and needs to be deployed as a batch scoring job with an optional real-time API for the retention dashboard.

---

## Transcript

### Turn 1 — User initiates

```
User: The churn model is ready. Let's deploy it — weekly batch scoring
      plus a real-time API for the retention dashboard.
```

### Turn 2 — Agent verifies readiness

```
[mlops-lead]

Running deployment readiness check (ML → MLOps handoff gate):

✓ Model card: complete (models/staging/churn_xgboost_v1_card.md)
✓ Metrics: PR-AUC 0.461 > threshold 0.30
✓ Fairness audit: passed
✓ Export format: pickle + ONNX
✓ Inference benchmark: 2.3ms per prediction (single), 450ms per 10K batch
✓ Test coverage: 92%
✓ Experiment logged: MLflow exp-churn-001

All gates pass. Proceeding with deployment planning.

Two serving modes needed:
1. Batch scoring — weekly job, score all 2M users
2. Real-time API — single predictions for retention dashboard

Architecture question: Should the real-time API load the model in-process
(FastAPI + pickle) or use a model server (BentoML)?
```

### Turn 3 — User provides constraints

```
User: FastAPI is fine for now — we expect <100 QPS on the real-time endpoint.
      Keep it simple.
```

### Turn 4 — Agent presents deployment plan

```
[mlops-lead → delegates to ml-deploy-engineer]

Deployment plan:

1. Batch scoring pipeline (Prefect):
   - Schedule: Every Monday at 03:00 UTC
   - Input: feature store (s3://feature-store/user_engagement/latest/)
   - Output: s3://predictions/churn/{date}/scores.parquet
   - Also writes to: PostgreSQL churn_scores table
   - SLA: Complete within 2 hours

2. Real-time API (FastAPI):
   - Endpoint: POST /predict/churn
   - Input: user_id (fetches features from feature store)
   - Output: { score, risk_level, top_factors }
   - Latency target: <50ms p99
   - Health checks: /health, /ready

3. Model versioning:
   - Model artifact: models/production/churn_xgboost_v1/
   - X-Model-Version header: churn-xgboost-v1
   - Rollback: previous version kept in models/production/churn_xgboost_v0/

4. Monitoring:
   - Prediction distribution drift (daily)
   - Feature drift (daily, already configured)
   - Latency and error rate (real-time)
   - Alert: if drift KS > 0.15 or error rate > 1%

Shall I implement this plan?
```

### Turn 5 — User approves

```
User: Yes, go ahead. Also add a /explain endpoint that returns
      SHAP values for a single user.
```

### Turn 6 — Agent implements

```
[ml-deploy-engineer]

Creating deployment artifacts:

  src/api/churn_api.py — FastAPI app with /predict/churn, /explain/churn,
                          /health, /ready endpoints
  src/api/churn_models.py — Pydantic request/response models
  src/pipelines/churn_scoring.py — Batch scoring Prefect flow
  configs/infrastructure/churn_api.yaml — API configuration
  configs/pipelines/churn_scoring.yaml — Batch job configuration
  tests/integration/test_churn_api.py — API integration tests
  Dockerfile — Container for the API service

API endpoints:
  POST /predict/churn  — { user_id } → { score, risk_level, top_factors }
  POST /explain/churn  — { user_id } → { shap_values, feature_names, base_value }
  GET  /health         — { status: "healthy" }
  GET  /ready          — { status: "ready", model_version: "churn-xgboost-v1" }
```

> **Hook fires:** `validate-assets.sh` checks each file — Pydantic models validated, health check endpoints present, no PII in logging.

### Turn 7 — Monitoring setup

```
[monitoring-engineer]

Configuring monitoring:

  src/monitoring/churn_monitor.py — Drift detection and alerting
  configs/infrastructure/churn_monitoring.yaml — Thresholds and alert rules

Monitors:
  ✓ prediction_distribution — KS test daily, threshold 0.15
  ✓ feature_drift — already configured from feature pipeline
  ✓ api_latency_p99 — threshold 50ms, alert if exceeded for 5 min
  ✓ api_error_rate — threshold 1%, alert if exceeded for 2 min
  ✓ batch_job_duration — alert if exceeds 2 hours
  ✓ batch_row_count — alert if < 90% of expected users scored

Alert routing:
  - Drift alerts → #ml-alerts Slack channel
  - API alerts → PagerDuty (on-call)
  - Batch alerts → #data-alerts Slack channel

Runbook created: docs/runbooks/churn-model-ops.md
```

### Turn 8 — Integration tests

```
[ml-deploy-engineer]

Running integration tests:

tests/integration/test_churn_api.py
  ✓ test_predict_returns_valid_score
  ✓ test_predict_returns_risk_level
  ✓ test_predict_returns_top_factors
  ✓ test_explain_returns_shap_values
  ✓ test_health_endpoint
  ✓ test_ready_endpoint_includes_version
  ✓ test_invalid_user_returns_404
  ✓ test_model_version_header_present
  ✓ test_rate_limiting_enforced
  ✓ test_no_pii_in_logs

10 passed, 0 failed

Load test (Locust, 100 concurrent users, 60 seconds):
  p50 latency: 8ms
  p99 latency: 34ms ✓ (under 50ms target)
  Error rate: 0% ✓
  Throughput: 850 req/s ✓ (well above 100 QPS requirement)
```

### Turn 9 — Deployment approval

```
[mlops-lead]

Deployment readiness (MLOps → Production handoff gate):

✓ Integration tests pass (10/10)
✓ Load test within SLA (p99: 34ms < 50ms)
✓ Monitoring configured (6 monitors, alerts routed)
✓ Rollback tested (v0 artifact available, switch is config change)
✓ Runbook created
✓ Model version in headers
✓ Health checks present

Ready to deploy. This requires your approval as it affects production.

Deploy to staging first for canary validation?
```

### Turn 10 — User approves production

```
User: Yes, deploy to staging first. If canary looks good after 2 hours,
      promote to production.
```

```
[ml-deploy-engineer]

✓ Deployed to staging environment
✓ Canary validation scheduled (2 hours)
✓ Will notify when ready for production promotion

Deployment summary:
  Model: churn-xgboost-v1
  Batch: Prefect flow, weekly Monday 03:00 UTC
  API: FastAPI, staging at staging.api.example.com/predict/churn
  Monitoring: 6 monitors active, alerts configured
  Runbook: docs/runbooks/churn-model-ops.md
```

---

## Key Patterns Demonstrated

1. **Handoff gate verified** — all ML → MLOps requirements checked before proceeding
2. **Simple over complex** — FastAPI chosen over model server for low QPS
3. **User added requirement** — /explain endpoint added during deployment
4. **Comprehensive monitoring** — drift, latency, errors, and batch health
5. **Canary deployment** — staging first, then production after validation
6. **Rollback plan** — previous version kept, switch is a config change
7. **Production approval required** — agent explicitly asked for user sign-off
