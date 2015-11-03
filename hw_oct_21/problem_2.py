from __future__ import division

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt
from scipy.optimize import newton
import gc
import os


def make_f(alpha, beta):
    def f(x):
        return (x/(sqrt(x**2 + alpha**2))) - x - beta

    return f


def main():
    alpha_min = -1.5
    alpha_max = 1.5
    beta_min = -1.5
    beta_max = 1.5

    resolution = 150*2+1

    plt.figure()
    beta = np.linspace(beta_min, beta_max, resolution)
    for b in beta:
        print b
        alpha = np.linspace(alpha_min, alpha_max, resolution)
        for a in alpha:
            function = make_f(a, b)
            roots = []
            for guess in np.linspace(-2, 2, 11):
                try:
                    Root = newton(function, guess)
                    if len(roots) == 0:
                        roots.append(Root)
                    else:
                        dists = []
                        for r in roots:
                            dists.append(abs(r - Root))
                        if min(dists) > 0.075:
                            roots.append(Root)
                except:
                    pass
            if len(roots) == 1:
                plt.plot(a, b, marker='o', fillstyle='full', markerfacecolor='green', markeredgewidth=0.0, markersize=3)
            elif len(roots) == 2:
                plt.plot(a, b, marker='o', fillstyle='full', markerfacecolor='blue', markeredgewidth=0.0, markersize=3)
            elif len(roots) == 3:
                plt.plot(a, b, marker='o', fillstyle='full', markerfacecolor='red', markeredgewidth=0.0, markersize=3)
            # else:
            #     raise TypeError
    plt.xlim(alpha_min, alpha_max)
    plt.ylim(beta_min, beta_max)
    # plt.title(r"$\beta = %0.2f$" % b)
    plt.xlabel(r"$\alpha$")
    plt.ylabel(r"$\beta$", rotation=0)
    plt.savefig("figures/stability_diagram_woah.png", format="png", dpi=300)
    plt.close()
    gc.collect()

if __name__ == "__main__":
    main()