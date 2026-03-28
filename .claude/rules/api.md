---
path: src/api/**
description: Standards for model serving API code
---

# Rules for APIs

## Standards
- Input validation with Pydantic models
- Structured error responses with error codes
- Health check endpoint (`/health`)
- Request/response logging (no PII)
- Rate limiting on inference endpoints
- Model version in response headers
- Async where beneficial for I/O

## Required Patterns
- Pydantic request/response models
- `X-Model-Version` response header
- `/health` and `/ready` endpoints
- Structured JSON error responses

## Forbidden Patterns
- Unvalidated input passed to model
- PII in logs
- Synchronous blocking calls for I/O
- Missing error handling on model inference

## Review Checklist
- [ ] Input validation with Pydantic
- [ ] Health check endpoint
- [ ] Model version in headers
- [ ] Error responses structured
- [ ] Rate limiting configured
