# Data Governance Policy: {{SCOPE}}

## Classification
| Level | Description | Examples | Controls |
|-------|-------------|----------|----------|
| Public | No restrictions | Aggregated metrics | None |
| Internal | Company-internal | User counts | Auth required |
| Confidential | Business-sensitive | Revenue data | Encryption + ACL |
| Restricted | Regulated/PII | SSN, health data | Encryption + audit + masking |

## Data Lifecycle
1. **Ingestion**: Classify at source, tag with metadata
2. **Storage**: Encryption at rest, access controls per classification
3. **Processing**: PII detection automated, anonymization enforced
4. **Retention**: Per-table retention policy, automated purge
5. **Disposal**: Secure deletion, audit trail

## Access Control
- **Principle**: Least privilege
- **Review cadence**: Quarterly
- **Emergency access**: Documented break-glass procedure

## PII Handling
- Automated detection in pipelines (Presidio/custom)
- Anonymization/pseudonymization before analytics
- Data subject request process documented
- Consent tracking per use case

## Compliance
- [ ] GDPR requirements mapped
- [ ] CCPA requirements mapped
- [ ] Data processing agreements with vendors
- [ ] Annual compliance audit scheduled
