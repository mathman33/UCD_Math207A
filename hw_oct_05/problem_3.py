from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt, exp
from scipy.integrate import odeint
import gc
import os
import json
import argparse


def make_deriv_honey_bead(c, m, g):
    def deriv_honey_bead(y, t):
        f = [(-c/m)*y[0]*abs(y[0]) + g]
        return f

    return deriv_honey_bead


def make_honey_bead(c, m, g):
    num_const = sqrt(m*g)
    exp_const = (2*sqrt(c*g))/(sqrt(m))
    den_const = sqrt(c)

    def honey_bead(t):
        return (num_const*(np.exp(exp_const*t) - 1))/(den_const*(np.exp(exp_const*t) + 1))

    return honey_bead


def main():
    # Load the data
    data = json.loads(open("problem_3.json").read())

    # Make the time array
    t = np.linspace(0, data["t_f"], 10000)

    approx_solns = []
    solns = []
    errors = []
    for mass in data["m"]:
        # Numerically solve the system
        deriv_function = make_deriv_honey_bead(data["c"], mass, data["g"])
        approx_soln = odeint(deriv_function, 0, t)
        approx_solns.append(approx_soln)

        # Analytically solve the system
        function = make_honey_bead(data["c"], mass, data["g"])
        function_vals = function(t)
        solns.append(function_vals)

        # Get the error of the approximation
        error = [0]*len(approx_soln)
        for i in xrange(0, len(approx_soln)):
            error[i] = abs(function_vals[i] - approx_soln[i])
        errors.append(error)


    # Graph the result
    plt.figure()
    plt.plot(t, approx_solns[0], "k", lw=3, label="Approximate Solutions")
    plt.plot(t, solns[0], "y-", lw=1, label="Exact Solutions")
    for approx_soln in approx_solns:
        plt.plot(t, approx_soln, "k", lw=3)
    for soln in solns:
        plt.plot(t, soln, "y-", lw=1)
    plt.legend(loc=0)
    plt.xlabel("Time")
    plt.ylabel("Velocity")
    plt.title(r"$c = %.1f$, $m_{min} = %.3f$, $m_{max} = %.3f$, $g = %.3f$" % (data["c"], min(data["m"]), max(data["m"]), data["g"]))
    plt.savefig("figures/3_d_1.png", format="png", dpi=300)
    plt.close()

    plt.figure()
    for error in errors:
        plt.plot(t, error)
    plt.xlabel("Time")
    plt.ylabel("Error")
    plt.title(r"Error $=$ $|$Actual Value $-$ Approximate Value$|$")
    plt.savefig("figures/3_d_2.png", format="png", dpi=300)
    plt.close()

    gc.collect()




if __name__ == "__main__":
    main()
