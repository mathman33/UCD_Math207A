from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt, exp
from scipy.integrate import odeint
import gc
import os
import json
import argparse


def SYSTEM(y, t):
    f = [0]*2
    f[0] = y[0]*y[1] - 1
    f[1] = y[0] - y[1]**3
    return f


def f_1(x):
    return 1/x


def f_2(x):
    return x**(1.0/3.0)


def main():
    # Load the data
    data = json.loads(open("problem_3.json").read())

    # Make the time array
    t = np.linspace(0, data["t_f"], 10000)

    grid_number = data["grid_number"]

    initial_conditions = []
    for i in np.linspace(data["x_ic"][0], data["x_ic"][1], grid_number):
        for j in np.linspace(data["y_ic"][0], data["y_ic"][1], grid_number):
            initial_conditions.append([i, j])

    solns = []
    for i in xrange(0, grid_number**2):
        solns.append(odeint(SYSTEM, initial_conditions[i], t))
    for ic in data["other_ic"]:
        solns.append(odeint(SYSTEM, ic, t))

    # x_1 = np.linspace(data["x_ic"][0], -0.01, 10000)
    # x_2 = np.linspace(0.01, data["x_ic"][1], 10000)

    plt.figure()
    # plt.plot(x_1, f_1(x_1), "k")
    # plt.plot(x_1, f_2(x_1), "k")
    # plt.plot(x_2, f_1(x_2), "k")
    # plt.plot(x_2, f_2(x_2), "k")
    for soln in solns:
        plt.plot(soln[:,0], soln[:,1])
    plt.xlabel(r"$x$")
    plt.ylabel(r"$y$")
    plt.xlim(data["x_ic"][0], data["x_ic"][1])
    plt.ylim(data["y_ic"][0], data["y_ic"][1])
    plt.title(r"$\dot{x} = xy - 1$; $\dot{y} = x - y^3$")
    # plt.show()
    plt.savefig("figures/3_simulation.png", format="png", dpi=300)
    plt.close()
    gc.collect()




if __name__ == "__main__":
    main()
