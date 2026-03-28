# Deployment Runbook: {{MODEL_NAME}} v{{VERSION}}

## Pre-Deployment Checklist
- [ ] Model card completed and reviewed
- [ ] Evaluation metrics meet thresholds
- [ ] Fairness audit passed
- [ ] Integration tests passing
- [ ] Monitoring configured
- [ ] Rollback tested
- [ ] Stakeholders notified

## Deployment Steps
1. **Build container**
   ```bash
   {{build commands}}
   ```

2. **Deploy to staging**
   ```bash
   {{deploy commands}}
   ```

3. **Staging validation**
   - [ ] Health check passes
   - [ ] Sample predictions correct
   - [ ] Latency within SLA
   - [ ] No errors in logs

4. **Canary deployment** ({{N}}% traffic)
   ```bash
   {{canary commands}}
   ```

5. **Monitor canary** ({{duration}})
   - [ ] Error rate < {{threshold}}
   - [ ] Latency < {{threshold}}
   - [ ] Predictions distribution normal

6. **Full rollout**
   ```bash
   {{rollout commands}}
   ```

## Rollback Procedure
```bash
{{rollback commands}}
```
- Trigger: {{conditions for rollback}}
- Time to rollback: < {{N}} minutes

## Post-Deployment
- [ ] Monitoring dashboard reviewed
- [ ] Alert thresholds confirmed
- [ ] Documentation updated
- [ ] Stakeholders notified of completion

## Contacts
| Role | Name | Contact |
|------|------|---------|
| On-call | | |
| ML Lead | | |
| Infra | | |
