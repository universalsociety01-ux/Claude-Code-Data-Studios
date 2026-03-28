# PyTorch Version Reference

| Field | Value |
|-------|-------|
| Pinned Version | 2.2.x |
| Last Verified | 2026-03-28 |
| Python Compatibility | 3.9 - 3.12 |
| CUDA Compatibility | 11.8, 12.1 |
| Install | `pip install torch torchvision torchaudio` |

## Version History (Recent)

| Version | Release | Key Changes |
|---------|---------|-------------|
| 2.2 | Jan 2024 | FlexAttention, torch.compile improvements |
| 2.1 | Jul 2023 | torch.compile stable, automatic dynamic shapes |
| 2.0 | Mar 2023 | torch.compile introduced, major performance improvements |

## Verification

```python
import torch
print(torch.__version__)  # Should match pinned version
print(torch.cuda.is_available())  # GPU support check
```
