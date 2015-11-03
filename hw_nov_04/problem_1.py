from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt, exp, sin
from scipy.integrate import odeint
import gc
import os
import json
import argparse


def make_mass_on_wire(data):
    a = data["alpha"]
    b = data["beta"]

    def mass_on_wire(y, t):
        f = [0]*2
        f[0] = y[1]
        f[1] = ((y[0])/(sqrt((y[0])**2 + a**2))) - y[0] - b*y[1]
        return f

    return mass_on_wire


def make_pendulum_torsional_spring(data):
    a = data["alpha"]
    b = data["beta"]

    def pendulum_torsional_spring(y, t):
        f = [0]*2
        f[0] = y[1]
        f[1] = -b*y[1] - a*y[0] + sin(y[0])
        return f

    return pendulum_torsional_spring


def make_duffings_oscillator(data):
    a = data["alpha"]
    b = data["beta"]

    def duffings_oscillator(y, t):
        f = [0]*2
        f[0] = y[1]
        f[1] = -y[1] + b*y[0] - a*(y[0]**3)
        return f

    return duffings_oscillator


def make_linear_oscillator(data):
    K = data["effective_spring_constant"]
    B = data["effective_damping"]

    def linear_oscillator(y, t):
        f = [0]*2
        f[0] = y[1]
        f[1] = -K*y[0] - B*y[1]
        return f

    return linear_oscillator


def main():
    # Load the data
    data = json.loads(open("problem_1.json").read())

    mass_on_wire_data = {
        "alpha": data["alpha"]["mass_on_wire"],
        "beta": data["beta"]["mass_on_wire"],
        "effective_spring_constant": (data["alpha"]["mass_on_wire"] - 1)/data["alpha"]["mass_on_wire"],
        "effective_damping": data["beta"]["mass_on_wire"]
    }
    pendulum_torsional_spring_data = {
        "alpha": data["alpha"]["pendulum_torsional_spring"],
        "beta": data["beta"]["pendulum_torsional_spring"],
        "effective_spring_constant": data["alpha"]["pendulum_torsional_spring"] - 1,
        "effective_damping": data["beta"]["pendulum_torsional_spring"]
    }
    duffings_oscillator_data = {
        "alpha": data["alpha"]["duffings_oscillator"],
        "beta": data["beta"]["duffings_oscillator"],
        "effective_spring_constant": 2*data["beta"]["duffings_oscillator"],
        "effective_damping": 1
    }

    # Make the functions    
    mass_on_wire = make_mass_on_wire(mass_on_wire_data)
    mass_on_wire_linear = make_linear_oscillator(mass_on_wire_data)
    pendulum_torsional_spring = make_pendulum_torsional_spring(pendulum_torsional_spring_data)
    pendulum_torsional_spring_linear = make_linear_oscillator(pendulum_torsional_spring_data)
    duffings_oscillator = make_duffings_oscillator(duffings_oscillator_data)
    duffings_oscillator_linear = make_linear_oscillator(duffings_oscillator_data)

    initial_conditions = {
        "mass_on_wire": {
            "linear": [],
            "nonlinear": [],
        },
        "pendulum_torsional_spring": {
            "linear": [],
            "nonlinear": [],
        },
        "duffings_oscillator": {
            "linear": [],
            "nonlinear": [],
        }
    }

    grid_number = 10

    for name in initial_conditions:
        for TYPE in ["linear", "nonlinear"]:
            for i in np.linspace(data["initial_conditions"][name][TYPE]["position"][0], data["initial_conditions"][name][TYPE]["position"][1], grid_number):
                for j in np.linspace(data["initial_conditions"][name][TYPE]["velocity"][0], data["initial_conditions"][name][TYPE]["velocity"][1], grid_number):
                    initial_conditions[name][TYPE].append([i,j])

    # Make the time array
    t = np.linspace(0, data["final_time"], 10000)

    solns = []
    linear_solns = []
    errors = []

    for i in xrange(0, grid_number**2):
        # Numerically solve the nonlinear systems
        soln = [odeint(mass_on_wire, initial_conditions["mass_on_wire"]["nonlinear"][i], t), odeint(pendulum_torsional_spring, initial_conditions["pendulum_torsional_spring"]["nonlinear"][i], t), odeint(duffings_oscillator, initial_conditions["duffings_oscillator"]["nonlinear"][i], t)]

        # Numerically solve the linear systems
        lin_soln = [odeint(mass_on_wire_linear, initial_conditions["mass_on_wire"]["linear"][i], t), odeint(pendulum_torsional_spring_linear, initial_conditions["pendulum_torsional_spring"]["linear"][i], t), odeint(duffings_oscillator_linear, initial_conditions["duffings_oscillator"]["linear"][i], t)]

        # Get the errors
        pass
        # # Get the error of the approximation
        # error = [0]*len(approx_soln)
        # for i in xrange(0, len(approx_soln)):
        #     error[i] = abs(function_vals[i] - approx_soln[i])
        # errors.append(error)
        
        solns.append(soln)
        linear_solns.append(lin_soln)

    graph_list = [
        [0, "Mass on Wire", r"$\alpha = %.3f$, $\beta = %.3f$" % (mass_on_wire_data["alpha"], mass_on_wire_data["beta"])],
        [1, "Pendulum Torsional Spring", r"$\alpha = %.3f$, $\beta = %.3f$" % (pendulum_torsional_spring_data["alpha"], pendulum_torsional_spring_data["beta"])],
        [2, "Duffing's Oscillator", r"$\alpha = %.3f$, $\beta = %.3f$" % (duffings_oscillator_data["alpha"], duffings_oscillator_data["beta"])]
    ]

    for i in graph_list:
        plt.figure()
        plt.title(i[1] + "; Nonlinear; " + i[2])
        plt.xlabel("Position")
        plt.ylabel("Velocity")
        for soln in solns:
            plt.plot(soln[i[0]][:,0], soln[i[0]][:,1])
        plt.savefig("figures/1_d_%s_nonlinear.png" % i[1].replace(" ", "_"), format="png", dpi=300)
        plt.close()
        gc.collect()

        plt.figure()
        plt.title(i[1] + "; Linear; " + i[2])
        plt.xlabel("Position")
        plt.ylabel("Velocity")
        for index, lin_soln in enumerate(linear_solns):
            plt.plot(lin_soln[i[0]][:,0], lin_soln[i[0]][:,1])
        plt.savefig("figures/1_d_%s_linear.png" % i[1].replace(" ", "_"), format="png", dpi=300)
        plt.close()
        gc.collect()

    # # Graph the result
    # plt.figure()
    # plt.plot(t, approx_solns[0], "k", lw=3, label="Approximate Solutions")
    # plt.plot(t, solns[0], "y-", lw=1, label="Exact Solutions")
    # for approx_soln in approx_solns:
    #     plt.plot(t, approx_soln, "k", lw=3)
    # for soln in solns:
    #     plt.plot(t, soln, "y-", lw=1)
    # plt.legend(loc=0)
    # plt.xlabel("Time")
    # plt.ylabel("Chemical A")
    # plt.title(r"$C = %.1f$, $k^+ = %.3f$, $k^- = %.3f$" % (data["C"], data["k+"], data["k-"]))
    # plt.savefig("figures/1_b_1.png", format="png", dpi=300)
    # plt.close()

    # plt.figure()
    # for error in errors:
    #     plt.plot(t, error)
    # plt.xlabel("Time")
    # plt.ylabel("Error")
    # plt.title(r"Error $=$ $|$Actual Value $-$ Approximate Value$|$")
    # plt.savefig("figures/1_b_2.png", format="png", dpi=300)
    # plt.close()

    # gc.collect()




if __name__ == "__main__":
    main()
