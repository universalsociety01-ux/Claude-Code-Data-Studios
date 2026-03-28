# API Documentation: {{SERVICE_NAME}}

## Base URL
```
{{BASE_URL}}
```

## Authentication
{{Method: API key / Bearer token / OAuth}}

## Endpoints

### POST /predict
**Description**: {{What this endpoint does}}

**Request**:
```json
{
  "features": {},
  "options": {}
}
```

**Response**:
```json
{
  "prediction": {},
  "confidence": 0.95,
  "model_version": "v1.2.3"
}
```

**Headers**:
- `X-Model-Version`: Current model version
- `X-Request-ID`: Unique request identifier

### GET /health
**Response**: `{"status": "healthy", "model_loaded": true}`

### GET /ready
**Response**: `{"ready": true, "model_version": "v1.2.3"}`

## Error Codes
| Code | Meaning | Resolution |
|------|---------|------------|
| 400 | Invalid input | Check request schema |
| 422 | Validation failed | Check feature values |
| 429 | Rate limited | Reduce request rate |
| 500 | Internal error | Check logs, retry |
| 503 | Model not ready | Wait for readiness |

## Rate Limits
- {{N}} requests/second per client
- Burst: {{N}} requests

## Examples
```bash
curl -X POST {{BASE_URL}}/predict \
  -H "Content-Type: application/json" \
  -d '{"features": {"age": 25, "income": 50000}}'
```
