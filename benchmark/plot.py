#!/usr/bin/env python3

# Usage: ./plot.py <data_0> <data_1> ... <data_n> <output_pdf>

import matplotlib.pyplot as plt
import numpy as np
import sys

for name in sys.argv[1:-1]:
    data = np.loadtxt(name)
    k    = data[:,0].astype(np.int64)
    time = data[:,1]
    plt.plot(k, time, 'o-', label=name)

plt.xlabel("# of substitutions allowed")
plt.ylabel("Time (seconds)")
plt.legend(loc='best')

plt.savefig(sys.argv[-1], bbox_inches='tight')
