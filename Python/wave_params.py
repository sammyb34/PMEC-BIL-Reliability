import numpy as np
class wave:
     def __init__(self, H, L, T):
          # General Physical Params
          self.rho = 1020   # Density of sea water [kg/m3]
          self.g = 9.81     # Gravitational Constant [m/s]

          # Given Params
          self.H = H        # Wave height [m]
          self.L = L        # Wave length [m]
          self.T = T        # Wave period [1/s]

          # Calculated Params
          self.a = 1/2 * H              # Wave amplitude [m], assuming linear waves
          self.k = 2 * np.pi / L        # Wave number [1/m]
          self.omega = 2 * np.pi / T    # Wave frequency [rad/s]
          self.c = L / T                # Wave speed/clerity [m/s]
          self.cg = self.c / 2          # Group speed [m/s]
          self.eps = self.k * self.a    # Wave steepness [-]

if __name__ == "main" :
     wv = wave(2, 15, 12) 
