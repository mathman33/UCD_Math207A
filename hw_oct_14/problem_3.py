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


def analytic_solution_1(t):
    c_0 = 1 - 3.04/3
    return ((2/3)*t + c_0)**(3/2)


def analytic_solution_2(t):
    return ((2/3)*t)**(3/2)


def main():
    # Make the time array
    t_1 = np.linspace(1.52, 0, 100001)
    init_cond_1 = [1]

    t_2 = np.linspace(0, 1.52, 100001)
    init_cond_2 = [0]

    # Numerically solve the system
    approx_soln_1 = odeint(cube_root_DE, init_cond_1, t_1)
    approx_soln_2 = odeint(cube_root_DE, init_cond_2, t_2)

    a_s_1 = approx_soln_1[:,0]
    a_s_2 = approx_soln_2[:,0]

    diff = [a_s_1[i] - a_s_2[i] for i in xrange(0, len(a_s_1))]

    # Analytically solve the system
    # actual_soln_1 = analytic_solution_1(t_1)
    # actual_soln_2 = analytic_solution_2(t_2)

    # error_1 = [abs(actual_soln_1[i] - approx_soln_1[i][0]) for i in xrange(0, len(approx_soln_1))]
    # error_2 = [abs(actual_soln_2[i] - approx_soln_2[i][0]) for i in xrange(0, len(approx_soln_2))]

    # # Graph the result
    plt.figure()
    plt.plot(t_1, a_s_1, "k", lw=1, label="Approximate Solution")
    # plt.plot(t_1, actual_soln_1, "y-", lw=1, label="Exact Solution")
    plt.plot(t_2, a_s_2, "k", lw=1, label="Approximate Solution")
    # plt.plot(t_2, actual_soln_2, "y-", lw=1, label="Exact Solution")

    plt.legend(loc=0)
    plt.xlabel("t")
    plt.ylabel("x")
    plt.xlim(-0.1, 1.6)
    plt.ylim(-1, 2)
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
