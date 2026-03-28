# PyTorch Deprecated APIs

## Mapping: Old → New

| Deprecated | Replacement | Notes |
|-----------|-------------|-------|
| `torch.cuda.amp.autocast` | `torch.amp.autocast('cuda')` | Device-agnostic AMP |
| `torch.cuda.amp.GradScaler` | `torch.amp.GradScaler('cuda')` | Device-agnostic scaler |
| `.cuda()` | `.to(device)` | Device-agnostic placement |
| `torch.nn.DataParallel` | `torch.nn.parallel.DistributedDataParallel` | Better performance |
| `torch.optim.lr_scheduler.StepLR` (alone) | Combine with `torch.compile` for best performance | Not removed, but consider alternatives |
| `torch.utils.data.DataLoader(num_workers=0)` | Set `num_workers>0` with `persistent_workers=True` | Performance improvement |
| `@torch.jit.script` | `torch.compile` | torch.compile is more flexible |
| `torch.onnx.export` (old) | `torch.onnx.dynamo_export` | Better graph capture |

## Still Valid (Despite Age)

These APIs are old but NOT deprecated:
- `torch.nn.Module` — still the standard base class
- `torch.optim.Adam` / `AdamW` — still standard optimizers
- `torch.utils.data.Dataset` / `DataLoader` — still standard data loading
- `torch.save` / `torch.load` — still standard serialization
