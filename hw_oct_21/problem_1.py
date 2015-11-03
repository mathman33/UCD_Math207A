from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt
from scipy.optimize import newton
import gc
import os


def make_deriv(alpha):
    def f(x):
        return ((alpha**2)/((x**2 + alpha**2)**(3.0/2))) - 1

    return f


def make_f(alpha, beta):
    def f(x):
        return (x/(sqrt(x**2 + alpha**2))) - x - beta

    return f


def main():
    beta = np.linspace(0, 0.5, 50)
    for b in beta:
        plt.figure()
        alpha = np.linspace(-2, 2, 201)
        for a in alpha:
            function = make_f(a, b)
            deriv = make_deriv(a)
            for guess in np.linspace(-5, 5, 21):
                try:
                    Root = newton(function, guess)
                except:
                    pass
                if deriv(Root) > 0:
                    plt.plot(a, Root, "ro")
                elif deriv(Root) < 0:
                    plt.plot(a, Root, "go")
                else:
                    plt.plot(a, Root, "bo")
            print a
            del function, deriv
        plt.ylim(-2, 2)
        plt.title(r"$\beta = %0.2f$" % b)
        plt.xlabel(r"$\alpha$")
        plt.ylabel(r"$x^*$", rotation=90)
        plt.savefig("figures/problem_1_beta_%.03f.png" % b, format="png", dpi=300)
        plt.close()
        gc.collect()

if __name__ == "__main__":
    main()