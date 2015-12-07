from __future__ import division
import numpy as np
import matplotlib.pyplot as plt
import gc


t = np.arange(0, 4, 0.01)
for r in xrange(1, 5):
    plt.figure()
    s_1 = 2/t
    line_1, = plt.plot(t, s_1, "--", lw=2, label=r"$f(x) = \frac{2}{x}$")
    s_2 = 1 + np.exp(r*(1 - t))
    line_2, = plt.plot(t, s_2, lw=2, label=r"$f(x) = e^{\left(%.1d(1 - x)\right)}$" % r)
    plt.axvline(x=1)
    plt.axvline(x=0)
    plt.axhline(y=0)
    plt.axhline(y=2)
    plt.legend(loc=0)

    plt.ylim(-1,15)
    plt.xlim(-0.1, 4)
    plt.xlabel(r"$x$")
    plt.ylabel(r"$f(x)$", rotation=0)
    plt.title(r"$r = %.1d$" % r)
    plt.savefig("thing_r=%.1d.png" % r, type="png", dpi=300)
    # plt.show()
    plt.close()
    gc.collect()