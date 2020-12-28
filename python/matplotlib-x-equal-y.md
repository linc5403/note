# python matplotlib 如何使x,y轴的单位长度相等呢？
```
In [1]: import matplotlib.pyplot as plt

In [2]: b = plt.plot([x*x for x in range(10)])

In [3]: ax = plt.gca()

In [4]: ax.set_aspect(1)

In [5]: b.show()
---------------------------------------------------------------------------
AttributeError                            Traceback (most recent call last)
<ipython-input-5-26de774dd282> in <module>
----> 1 b.show()

AttributeError: 'list' object has no attribute 'show'

In [6]: plt.show()

In [7]: b
Out[7]: [<matplotlib.lines.Line2D at 0x7f80598b1820>]

In [8]: plt.show()

In [9]: plt.plot([x*x for x in range(10)])
Out[9]: [<matplotlib.lines.Line2D at 0x7f8058dab9d0>]

In [10]: plt.figure(figsize=(100, 100))
Out[10]: <Figure size 10000x10000 with 0 Axes>

In [11]: plt.show()

In [12]: plt.plot([x*x for x in range(10)])
Out[12]: [<matplotlib.lines.Line2D at 0x7f8059adda30>]

In [13]: plt.show()
</matplotlib.lines.Line2D>]</Figure></matplotlib.lines.Line2D>]</matplotlib.lines.Line2D>]</module></ipython-input-5-26de774dd282>
```
