from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt, exp
from scipy.integrate import odeint
import gc
import os
import json
import argparse


def make_deriv_chem_rxn(data):
    C = data["C"]
    kp = data["k+"]
    km = data["k-"]

    def deriv_chem_rxn(y, t):
        f = [-(kp + km)*y[0] + km*C]
        return f

    return deriv_chem_rxn


def make_chem_rxn(data, ic):
    A_0 = ic
    C = data["C"]
    kp = data["k+"]
    km = data["k-"]

    arb_const = A_0 - (km*C)/(kp + km)
    exp_const = -(kp + km)
    vert_const = (km*C)/(kp + km)

    def chem_rxn(t):
        return arb_const*np.exp(exp_const*t) + vert_const

    return chem_rxn


def main():
    # Load the data
    data = json.loads(open("problem_1.json").read())

    # Make the time array
    t = np.linspace(0, data["t_f"], 10000)

    # Formulate the function given the parameters
    deriv_function = make_deriv_chem_rxn(data)

    approx_solns = []
    solns = []
    errors = []
    for init_cond in data["A_0"]:
        # Numerically solve the system
        approx_soln = odeint(deriv_function, init_cond, t)
        approx_solns.append(approx_soln)

        # Analytically solve the system
        function = make_chem_rxn(data, init_cond)
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
    plt.ylabel("Chemical A")
    plt.title(r"$C = %.1f$, $k^+ = %.3f$, $k^- = %.3f$" % (data["C"], data["k+"], data["k-"]))
    plt.savefig("figures/1_b_1.png", format="png", dpi=300)
    plt.close()

    plt.figure()
    for error in errors:
        plt.plot(t, error)
    plt.xlabel("Time")
    plt.ylabel("Error")
    plt.title(r"Error $=$ $|$Actual Value $-$ Approximate Value$|$")
    plt.savefig("figures/1_b_2.png", format="png", dpi=300)
    plt.close()

    gc.collect()




if __name__ == "__main__":
    main()
