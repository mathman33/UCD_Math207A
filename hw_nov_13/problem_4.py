from matplotlib.pyplot import cm
import matplotlib.pyplot as plt
import numpy as np

x_min = -3.5
x_max = 3.5
y_min = -2
y_max = 2

Y_GRID, X_GRID = np.mgrid[y_min:y_max:20j, x_min:x_max:20j]
U = Y_GRID
V = -((X_GRID**2)*Y_GRID) - Y_GRID**3 + Y_GRID - X_GRID
magnitude = np.sqrt(U**2 + V**2)
UN = U/magnitude
VN = V/magnitude

delta = 0.01
x_range = np.arange(x_min, x_max, delta)
y_range = np.arange(y_min, y_max, delta)
X_S, Y_S = np.meshgrid(x_range,y_range)

LHS = -Y_S*X_S**2 - Y_S**3 - X_S + Y_S
RHS = 0

LHS_circle = X_S**2 + Y_S**2
RHS_circle = 0.01

plot2 = plt.figure()
plt.contour(X_S, Y_S, (LHS - RHS), [0], colors='k')
plt.axhline(y=0, color='k')

### Un-comment the following 7 lines to get the region...
# plt.contour(X_S, Y_S, (LHS_circle - RHS_circle), [0], colors='b')
# plt.axhline(y=1.5, xmin=0.1, xmax=0.7)
# plt.axhline(y=-1.5, xmin=0.3, xmax=0.9)
# plt.axvline(x=-2.8, ymin=0.5, ymax=0.875)
# plt.axvline(x=2.8, ymin=0.125, ymax=0.5)
# plt.plot([1.4, 2.8], [1.5, 0])
# plt.plot([-1.4, -2.8], [-1.5, 0], color='b')
plt.quiver(X_GRID, Y_GRID, UN, VN, 
           color='Teal',
           headlength=7)
plt.xlabel(r'$x$', size=18)
plt.ylabel(r'$\dot{x}$', rotation=0, size=18)
plt.title(r'$\ddot{x} = -(x^2 + (\dot{x})^2 - 1)\dot{x} - 1$', size=18)

### Comment plt.show() and un-comment the savefig line
### to save the figure.. be sure to change the name of the file...
plt.show()
# plt.savefig("graph.png", format="png", dpi=500)

