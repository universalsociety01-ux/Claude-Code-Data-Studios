# PyTorch Breaking Changes

## High Risk (Will Crash)

| Change | Old API | New API | Since |
|--------|---------|---------|-------|
| Tensor indexing | `torch.Tensor` returned python scalar | Returns 0-dim tensor | 2.0 |
| `torch.nn.utils.clip_grad_norm` | No underscore | `clip_grad_norm_` (in-place) | 1.12 |

## Medium Risk (Silent Bugs)

| Change | Old Behavior | New Behavior | Since |
|--------|-------------|--------------|-------|
| Default dtype | Float32 | Float32 (unchanged, but `torch.compile` may change precision) | 2.0 |
| `torch.compile` graph breaks | N/A | Some Python constructs cause graph breaks reducing performance | 2.0 |
| Deterministic ops | Off by default | Still off, but `torch.use_deterministic_algorithms(True)` covers more ops | 2.1 |

## Low Risk (Deprecation Warnings)

| Deprecated | Replacement | Removal Target |
|-----------|-------------|----------------|
| `torch.cuda.amp.autocast` | `torch.amp.autocast('cuda')` | 2.4+ |
| `torch.cuda.amp.GradScaler` | `torch.amp.GradScaler('cuda')` | 2.4+ |
| Named tensors | Removed | 2.0 |
