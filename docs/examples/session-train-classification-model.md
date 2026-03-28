# Example: Training a Classification Model

**Duration:** ~35 minutes | **Turns:** 10 | **Phase:** Modeling
**Agents involved:** `ml-engineering-lead`, `model-developer`, `tabular-specialist`, `experiment-analyst`

---

## Context

A team needs to build a churn prediction model using customer behavioral data. The dataset has 2M rows with 45 features, including both numerical and categorical columns.

---

## Transcript

### Turn 1 — User initiates

```
User: I need a churn prediction model. We have 2M rows of customer data
      with 45 features. Binary classification — churned or not.
```

### Turn 2 — Agent asks clarifying questions

```
[ml-engineering-lead]

A few questions before we design the approach:

1. What's the class balance? (% churned vs retained)
2. Is explainability important? (e.g., for customer retention team)
3. What's the serving requirement — batch scoring or real-time API?
4. Any baseline model to beat? What metric matters most?
```

### Turn 3 — User provides context

```
User: About 8% churn rate, so imbalanced. Explainability is important —
      the retention team needs to know WHY customers are likely to churn.
      Batch scoring weekly. We want to maximize precision-recall AUC
      (PR-AUC) since the class is imbalanced.
```

### Turn 4 — Agent presents modeling options

```
[ml-engineering-lead → consults tabular-specialist]

Given imbalanced binary classification with explainability needs:

Option 1: XGBoost with SMOTE
  ✓ Strong on tabular data, handles imbalance with SMOTE or class weights
  ✓ SHAP values provide feature-level explanations
  ✓ Fast iteration — train in minutes
  Baseline PR-AUC: typically 0.35-0.50 for churn tasks
  Effort: 3-4 days

Option 2: LightGBM with Focal Loss
  ✓ Faster training than XGBoost
  ✓ Focal loss handles imbalance without oversampling
  ✓ SHAP compatible
  ✗ Slightly less interpretable focal loss behavior
  Effort: 3-4 days

Option 3: Logistic Regression + Feature Engineering
  ✓ Most interpretable — direct coefficient interpretation
  ✓ Simplest to deploy and monitor
  ✗ Lower accuracy ceiling
  ✗ Requires more manual feature engineering
  Effort: 2-3 days (+ feature engineering time)

Recommendation: Start with XGBoost (Option 1) as the primary model.
Use Logistic Regression (Option 3) as a baseline for comparison.
```

### Turn 5 — User decides

```
User: Let's do XGBoost as primary and logistic regression as baseline.
      Use class weights instead of SMOTE — I've had bad experiences
      with synthetic oversampling.
```

> **Agent respects the decision** — no pushback on SMOTE vs class weights. User's domain experience is valued.

### Turn 6 — Agent designs the experiment

```
[model-developer]

Experiment plan:

Experiment ID: exp-churn-001
Objective: Churn prediction with explainability
Primary metric: PR-AUC
Secondary metrics: F1, Precision@10%, Recall@10%, ROC-AUC

Models:
  1. Baseline: LogisticRegression(class_weight='balanced')
  2. Primary: XGBClassifier(scale_pos_weight=11.5)  # ratio of neg/pos

Data split:
  Train: 70% (1.4M rows) — stratified
  Validation: 15% (300K rows) — stratified
  Test: 15% (300K rows) — stratified, held out until final evaluation

Cross-validation: 5-fold stratified on train set for hyperparameter tuning
Hyperparameter search: Optuna, 50 trials

Config: configs/models/churn_xgboost.yaml
Tracking: MLflow experiment "churn-prediction"

Random seed: 42 (all sources: random, numpy, xgboost)

Shall I proceed?
```

### Turn 7 — User approves

```
User: Looks good. Go ahead.
```

### Turn 8 — Agent implements and trains

```
[model-developer]

Creating files:
  src/models/churn_model.py — Model classes with config-driven hyperparameters
  configs/models/churn_xgboost.yaml — Hyperparameter configuration
  notebooks/experiments/exp-churn-001.ipynb — Experiment notebook

Training baseline (LogisticRegression)...
  PR-AUC: 0.312 | F1: 0.298 | ROC-AUC: 0.781

Running Optuna search for XGBoost (50 trials)...
  Best trial: max_depth=6, learning_rate=0.05, n_estimators=450,
              subsample=0.8, colsample_bytree=0.7, min_child_weight=5

Training final XGBoost with best params...
  PR-AUC: 0.467 | F1: 0.421 | ROC-AUC: 0.892

Improvement over baseline: +49.7% PR-AUC
```

### Turn 9 — Experiment analyst evaluates

```
[experiment-analyst]

Evaluation on held-out test set:

| Model | PR-AUC | F1 | Precision@10% | Recall@10% | ROC-AUC |
|-------|--------|-----|---------------|------------|---------|
| LogisticRegression | 0.308 | 0.291 | 0.42 | 0.52 | 0.776 |
| XGBoost | 0.461 | 0.415 | 0.61 | 0.47 | 0.888 |

SHAP Analysis (top 5 features):
  1. days_since_last_purchase (0.089) — longer gap → higher churn
  2. support_ticket_count_30d (0.072) — more tickets → higher churn
  3. subscription_tenure_months (0.065) — shorter tenure → higher churn
  4. avg_session_duration_7d (0.058) — shorter sessions → higher churn
  5. payment_failure_count (0.051) — payment issues → higher churn

Fairness check:
  ✓ PR-AUC consistent across age groups (±0.03)
  ✓ No significant bias detected across gender groups
  ⚠ Slight performance drop for users with <30 days tenure (PR-AUC: 0.38)
     — expected due to limited behavioral data

Recommendation: Model meets quality bar. The explainability via SHAP
is strong and actionable for the retention team.
```

### Turn 10 — Summary

```
[ml-engineering-lead]

Experiment complete:

Results:
  ✓ XGBoost PR-AUC: 0.461 (baseline: 0.308, +49.7% improvement)
  ✓ Top churn drivers identified via SHAP
  ✓ Fairness audit passed
  ✓ All random sources seeded (reproducible)
  ✓ Experiment logged to MLflow (exp-churn-001)

Artifacts:
  models/staging/churn_xgboost_v1.pkl — Trained model
  experiments/exp-churn-001.md — Experiment log
  notebooks/experiments/exp-churn-001.ipynb — Full analysis

Next steps:
  1. Generate model card (/model-card)
  2. Set up batch scoring pipeline
  3. Deploy weekly scoring job
  4. Build SHAP dashboard for retention team
```

---

## Key Patterns Demonstrated

1. **Class imbalance handled explicitly** — discussed upfront, user chose class weights over SMOTE
2. **Baseline comparison** — logistic regression baseline established before complex model
3. **Experiment tracking** — all params, metrics, artifacts logged to MLflow
4. **Reproducibility** — random seed set across all sources
5. **Fairness audit** — checked across demographic groups
6. **Explainability** — SHAP analysis for business stakeholders
7. **User expertise respected** — agent didn't argue about SMOTE decision
