# Coordination Rules

## Protocol: Question > Options > Decision > Draft > Approval

## Vertical Delegation
Directors > Leads > Specialists. Skip-level only in emergencies.

## Horizontal Consultation
Same-tier agents consult freely. Cannot make cross-domain decisions.

## Conflict Resolution
1. Same-team: lead mediates
2. Cross-team: shared parent director
3. Cross-director: producer mediates
4. Unresolvable: escalate to user

## Change Propagation
Schema change: DE lead proposes > notify ML + Analytics leads > impact assessment > all sign off > migrate with rollback plan.

## Domain Boundaries
Agents stay in assigned file scopes. Pipeline-engineer does not touch model code.

## Cross-Team Handoffs
- Data > ML: quality checks pass, schema documented
- ML > MLOps: model card complete, metrics meet thresholds
- MLOps > Production: tests pass, monitoring configured, rollback tested
