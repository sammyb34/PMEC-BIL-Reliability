""" 
A Basic WEC Modeling script based off of WEC-Sim documentation

WEC-Sim Website: https://wec-sim.github.io/WEC-Sim/main/theory/theory.html
"""
import numpy as np
import matplotlib.pyplot as plt

import wave_params

# -----
# Initializes all pertinent wave parameters
# -----
def init_wave(H, L, T):
    wv = wave_params.wave(H, L, T)
    x = np.arange(0, 3*L, L/100)
    posPlot = wv.H * np.sin(wv.k*x)
    
    plt.figure()
    plt.plot(x, posPlot)
    plt.axvline(L, color='black', linestyle='dashed')
    plt.axvline(2*L, color='black', linestyle='dashed')
    plt.axhline(0, color='black', linestyle='dashed')
    plt.show()

    return wave_params.wave(H, L, T)

wave = init_wave(1.5, 15, 12)




    