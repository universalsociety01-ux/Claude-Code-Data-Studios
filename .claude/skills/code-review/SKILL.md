---
name: Code Review
description: Multi-perspective code review for data/ML code
---

# /code-review

## Purpose
Comprehensive review: standards, architecture, domain, security.

## Workflow
1. Standards review (PEP 8, types, docs)
2. Architecture review (patterns, modularity)
3. Domain review (based on file location rules)
4. Security review (secrets, PII, injections)
5. Test coverage check
6. Verdict: APPROVE / REQUEST CHANGES / DISCUSS

## Agents Involved
- Relevant lead + specialist, security-engineer, testing-specialist

## Inputs
- File path(s) to review

## Outputs
- Structured review with severity ratings
- Verdict with required actions
