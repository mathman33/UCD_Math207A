from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt, exp
from scipy.integrate import odeint
import gc
import os
import json
import argparse


def make_deriv_damped_spring(data):
    m = data["m"]
    b = data["b"]
    k = data["k"]

    def deriv_damped_spring(y, t):
        f = [0]*2
        f[0] = y[1]
        f[1] = (-k/m)*y[0] + (-b/m)*y[1]
        return f

    return deriv_damped_spring


def make_damped_spring(data, x_0, v_0):
    m = data["m"]
    b = data["b"]
    k = data["k"]

    dis = b**2 - 4*m*k
    if dis > 0:
        l_1 = (-b + sqrt(dis))/(2*m)
        l_2 = (-b - sqrt(dis))/(2*m)
        def damped_spring(t):
            return ((x_0*l_2 - v_0)/(l_2 - l_1))*np.exp(l_1*t) + ((x_0*l_1 - v_0)/(l_1 - l_2))*np.exp(l_2*t)
    elif dis == 0:
        l = -b/(2*m)
        def damped_spring(t):
            return x_0*np.exp(l*t) + (v_0 - x_0*l)*t*np.exp(l*t)
    elif dis < 0:
        alpha = -b/(2*m)
        beta = sqrt(-dis)/(2*m)
        def damped_spring(t):
            return ((v_0 - x_0*alpha)/(beta))*np.exp(alpha*t)*np.sin(beta*t) + x_0*np.exp(alpha*t)*np.cos(beta*t)

    return damped_spring


def main():
    # Load the data
    data = json.loads(open("problem_2.json").read())

    # Make the time array
    t = np.linspace(0, data["t_f"], 10000)

    # Formulate the function given the parameters
    deriv_function = make_deriv_damped_spring(data)

    approx_solns = []
    solns = []
    errors = []
    for i in xrange(0, len(data["x_0"])):
        # Numerically solve the system
        approx_soln = odeint(deriv_function, [data["x_0"][i], data["v_0"][i]], t)
        approx_solns.append(approx_soln)

        # Analytically solve the system
        function = make_damped_spring(data, data["x_0"][i], data["v_0"][i])
        function_vals = function(t)
        solns.append(function_vals)

        # Get the error of the approximation
        error = [0]*len(approx_soln)
        for i in xrange(0, len(approx_soln)):
            error[i] = abs(function_vals[i] - approx_soln[i][0])
        errors.append(error)


    # Graph the result
    plt.figure()
    plt.plot(t, approx_solns[0][:,0], "k", lw=3, label="Approximate Solutions")
    plt.plot(t, solns[0], "y-", lw=1, label="Exact Solutions")
    for approx_soln in approx_solns:
        plt.plot(t, approx_soln[:,0], "k", lw=3)
    for soln in solns:
        plt.plot(t, soln, "y-", lw=1)
    plt.legend(loc=0)
    plt.xlabel("Time")
    plt.ylabel("Position")
    plt.title(r"$m = %.1f$, $b = %.3f$, $k = %.3f$" % (data["m"], data["b"], data["k"]))
    plt.savefig("figures/2_b_1.png", format="png", dpi=300)
    plt.close()

    plt.figure()
    for error in errors:
        plt.plot(t, error)
    plt.xlabel("Time")
    plt.ylabel("Error")
    plt.title(r"Error $=$ $|$Actual Value $-$ Approximate Value$|$")
    plt.savefig("figures/2_b_2.png", format="png", dpi=300)
    plt.close()

    gc.collect()




if __name__ == "__main__":
    main()
