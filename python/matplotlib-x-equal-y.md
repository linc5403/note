# python matplotlib 如何使x,y轴的单位长度相等呢？


import pylab as plt

b=plt.plot([1,2,3,4])
ax = plt.gca()
ax.set_aspect(1)


import matplotlib.pyplot as plt
X = [1,2,3]
Y = [1,2,3]
plt.figure(figsize=(6,6))
plt.plot(X,Y)
plt.xticks(X)
plt.yticks(Y)
plt.show()


