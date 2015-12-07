from __future__ import division
import numpy as np
import matplotlib.pyplot as plt
import gc
from scipy.optimize import newton


def get_f(r):
    def f(x):
        return x*np.exp(r*(1 - x))
    return f


def get_unique_vals(List, tol):
    new_list = []
    for i in List:
        checklist = []
        for j in new_list:
            if abs(i - j) < tol:
                checklist.append(False)
                break
            else:
                checklist.append(True)
        if all(checklist):
            new_list.append(i)
    return new_list


plt.figure()

tol = 4.8e-08
starting_point = 0.5
iterations = 10000
number_of_points = 400


for r in np.arange(0.01, 4, 0.01):
    print r
    f = get_f(r)
    values = [0]*iterations
    values[0] = starting_point
    for i in xrange(0, len(values)-1):
        values[i+1] = f(values[i])

    last_vals = values[len(values)-number_of_points:]

    unique_last_vals = get_unique_vals(last_vals, tol)

    for i in unique_last_vals:
        plt.plot(r, i, ".", color="k")

plt.title("Orbit Diagram")
plt.xlabel(r"$r$", size=20)
plt.ylabel(r"$x^*$", size=20, rotation=0)

plt.savefig("orbit_diagram.png", type="png", dpi=300)

plt.close()
