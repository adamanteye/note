import matplotlib.pyplot as plt
import numpy as np

K = 208.5
E_0 = -1.45
E_seq = np.linspace(-2, 1.5, 350)


def sigma_minus_145(E):
    return K * E**0.5 / (E - E_0) ** 2


bg = sigma_minus_145(E_seq)
plt.plot(E_seq, bg, label=(r"$\sigma_{n,X}(E_0=-1.45eV)$"), linestyle="-", color="b")
plt.annotate(
    "background",
    xy=(0.3, sigma_minus_145(0.3)),
    xytext=(5, 0.5),
    arrowprops=dict(facecolor="black", shrink=0.5),
)
plt.xlabel(r"E(eV)")
plt.ylabel(r"$\sigma(barn)$")
plt.legend()
plt.grid()
plt.show()
