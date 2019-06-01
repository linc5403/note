# 求导
```python
from findiff import FinDiff
import numpy as np
x, y, z = [np.linspace(0, 10, 100)]*3
dx, dy, dz = x[1] - x[0], y[1] - y[0], z[1] - z[0]
X, Y, Z = np.meshgrid(x, y, z, indexing='ij')
d_dx = FinDiff(0, dx)
f = np.sin(X) * np.cos(Y) * np.sin(Z)
f
f
type(f)
f[0, 0, 0]
f[0, 0, 1]
f[1, 1, 1]
histroy
%history
dx
dy
dz
d_dx = FinDiff(0, dx)
d_dx
df_dx = d_dx(f)
df_dx
df_dx[1, 1, 1]
%history
```

## 1. rgb to gray
0.2989 * rgb[0] + 0.5870 * rgb[1] + 0.1140 * rgb[2]

