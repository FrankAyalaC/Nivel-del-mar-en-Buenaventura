import numpy as np
import matplotlib.pyplot as plt

# generate some random data
time = np.arange(1000)
data = np.random.uniform(size=1000)

# generate histogram of data
hist, bin_edges = np.histogram(data)

# 2 subplots sharing x-axis (-> data values)
plt.figure(1)
ax1 = plt.subplot(211)
ax1.set_xlabel("binned data")
ax1.set_ylabel("freqency of binned data")
ax1.plot(0.5*(bin_edges[:-1]+bin_edges[1:]), hist)
ax1.set_ylim(0, max(hist))

ax2 = plt.subplot(212, sharex=ax1)
ax2.set_xlabel("data")
ax2.set_ylabel("time")
ax2.plot(data, time)

# 2 subplots sharing y-axis (-> data values)
plt.figure(2)
ax3 = plt.subplot(121)
ax2.set_xlabel("time")
ax3.set_ylabel("data")
ax3.plot(time, data)
ax4 = plt.subplot(122, sharey=ax3)
ax4.set_ylabel("binned data")
ax4.set_xlabel("freqency of binned data")
ax4.plot(hist, 0.5*(bin_edges[:-1]+bin_edges[1:]))
ax4.set_xlim(0, max(hist))

plt.show()
