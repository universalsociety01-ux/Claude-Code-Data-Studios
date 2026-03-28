# PyTorch Current Best Practices

## 1. Use torch.compile for Production

```python
model = MyModel()
model = torch.compile(model)  # 2x+ speedup on most models
```

- Works best with static shapes
- Use `mode="reduce-overhead"` for small models
- Use `mode="max-autotune"` for maximum performance (slower compile)

## 2. Device-Agnostic Code

```python
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model = model.to(device)
data = data.to(device)
```

Never use `.cuda()` directly.

## 3. Mixed Precision Training

```python
with torch.amp.autocast('cuda'):
    output = model(input)
    loss = criterion(output, target)

scaler = torch.amp.GradScaler('cuda')
scaler.scale(loss).backward()
scaler.step(optimizer)
scaler.update()
```

## 4. Reproducibility

```python
import torch
import numpy as np
import random

def seed_everything(seed=42):
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False
```

## 5. Gradient Checkpointing for Large Models

```python
from torch.utils.checkpoint import checkpoint

class LargeModel(nn.Module):
    def forward(self, x):
        x = checkpoint(self.block1, x, use_reentrant=False)
        x = checkpoint(self.block2, x, use_reentrant=False)
        return x
```

Use `use_reentrant=False` (new default, more reliable).

## 6. PyTorch Lightning for Structure

```python
import lightning as L

class MyModel(L.LightningModule):
    def training_step(self, batch, batch_idx):
        ...
    def configure_optimizers(self):
        ...
```

Handles distributed training, logging, checkpointing automatically.

## 7. Data Loading

```python
DataLoader(
    dataset,
    batch_size=32,
    num_workers=4,
    persistent_workers=True,  # Reuse workers across epochs
    pin_memory=True,          # Faster GPU transfer
    prefetch_factor=2,
)
```
