```python
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
%matplotlib notebook
x, y, z = np.random.randn(3, 100)
fig = plt.figure()
ax = fig.gca(projection='3d')
sc = ax.scatter(x, y, z, c=np.random.rand(100))
plt.colorbar(sc)
```
