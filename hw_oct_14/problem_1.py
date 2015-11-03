from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt, exp
from scipy.integrate import odeint
import gc
import os
import json
import argparse


def cube_root_DE(x, t):
    return [x[0]**(1/3)]


def make_analytic_solution(t_given, x_given):
    C = x_given**(2/3) - (2/3)*t_given

    def analytic_solution(t):
        return ((2/3)*t + C)**(3/2)

    return analytic_solution


def get_values(t_start, t_end, x_start):
    t = np.linspace(t_start, t_end, 100001)
    approx_soln = odeint(cube_root_DE, [x_start], t)
    approx_vals = approx_soln[:,0]
    analytic = make_analytic_solution(t_start, x_start)
    actual_vals = analytic(t)
    return (t, approx_vals, actual_vals)


def plot_stuff(t_start, t_end, x_start):
    (t, approx_vals, actual_vals) = get_values(t_start, t_end, x_start)
    plt.plot(t, approx_vals)


def main():
    plt.figure()
    plot_stuff(10, 0, 1.0)
    plot_stuff(9, 0, 2.0)
    plot_stuff(8, 0, 3.0)
    plot_stuff(7, 0, 4.0)
    plot_stuff(6, 0, 5.0)
    plot_stuff(5, 0, 6.0)
    plot_stuff(4, 0, 7.0)
    plot_stuff(3, 0, 8.0)
    plot_stuff(2, 0, 9.0)
    plot_stuff(0, 10, 0.0)

    plt.legend(loc=0)
    plt.xlabel("t")
    plt.ylabel("x")
    plt.ylim(-1, 7)
    # plt.title(r"$C = %.1f$, $k^+ = %.3f$, $k^- = %.3f$" % (data["C"], data["k+"], data["k-"]))
    plt.show()
    # plt.savefig("figures/1_b_1.png", format="png", dpi=300)
    plt.close()

    # plt.figure()
    # for error in errors:
    #     plt.plot(t, error)
    # plt.xlabel("Time")
    # plt.ylabel("Error")
    # plt.title(r"Error $=$ $|$Actual Value $-$ Approximate Value$|$")
    # plt.savefig("figures/1_b_2.png", format="png", dpi=300)
    # plt.close()

    gc.collect()




if __name__ == "__main__":
    main()
