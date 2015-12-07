from __future__ import division
import numpy as np
import matplotlib.pyplot as plt
import gc
from scipy.optimize import newton


def get_f(r):
    def f(x):
        return 2/x - (1 + np.exp(r*(1 - x)))
    return f


def get_f_prime(r):
    def f_prime(x):
        return (1 - r*x + ((r*x)**2)*np.exp(r*(1 - x)) - r*x*np.exp(r*(1 - x)))*np.exp(r*(2 - x - x*np.exp(r*(1 - x))))
    return f_prime


r_0 = np.arange(0, 4, 0.01)
r_1a = np.arange(0, 2, 0.01)
r_1b = np.arange(2, 4, 0.01)
plt.figure()
s_0 = 0*r_0
s_1a = r_1a/r_1a
s_1b = r_1b/r_1b
plt.plot(r_0, s_0, "--", color="k", lw=1, label="period 1 stable fixed point")
plt.plot(r_1a, s_1a, "-", color="k", lw=1, label="period 1 unstable fixed point")
plt.plot(r_1b, s_1b, "--", color="k", lw=1)
rs = np.arange(2, 3.5, 0.01)
low_rs = []
high_rs = []
stable_rs = []
unstable_rs = []
for r in rs:
    f = get_f(r)
    f_prime = get_f_prime(r)
    low_value = newton(f, 0.1, maxiter=10000, tol=1.48e-08)
    high_value = newton(f, 2, maxiter=10000, tol=1.48e-08)
    low_stability = abs(f_prime(low_value)) < 1
    high_stability = abs(f_prime(high_value)) < 1
    low_rs.append(low_value)
    high_rs.append(high_value)
    if low_stability and high_stability:
        stable_rs.append(r)
    else:
        unstable_rs.append(r)

low_stable_rs = low_rs[0:len(stable_rs)]
low_unstable_rs = low_rs[len(stable_rs):]
high_stable_rs = high_rs[0:len(stable_rs)]
high_unstable_rs = high_rs[len(stable_rs):]
plt.plot(stable_rs, low_stable_rs, "-", color="k", lw=3, label="period 2 stable fixed point")
plt.plot(unstable_rs, low_unstable_rs, "--", color="k", lw=3, label="period 2 unstable fixed point")
plt.plot(stable_rs, high_stable_rs, "-", color="k", lw=3)
plt.plot(unstable_rs, high_unstable_rs, "--", color="k", lw=3)

plt.ylim(-0.1, 3)
plt.xlim(0, 3)

plt.xlabel(r"$r$", size=20)
plt.ylabel(r"$x^*$", size=20, rotation=0)
plt.yticks(np.arange(0, 3, 1.0))
plt.legend(loc=0)
plt.title("Bifurcation Plot: Fixed Points of Period 1 and 2")

plt.savefig("problem_3_bifurcation_plot.png", type="png", dpi=300)

