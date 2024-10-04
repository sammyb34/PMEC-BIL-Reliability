import numpy as np

class wec:
    def __init__(self, m, model):
        self.m = m          # WEC mass [kg]
        self.type = model  


if __name__=="main":
    conv = wec(100, "RM3")
    print(conv.model)
