# Purpose
Used for multi-physics modeling of the WEC system.

## Folder Structure
### /models
Holds all simulink models, including the full system model.

### /results
Holds all .mat and .fig files that have been generated. This folder is going to be rather large.

### /utils
Holds all 'helper' functions, including any scripts to run models in /models, parameter initialization scripts, data visualization scripts, etc.

### main.m
Has 5 purposes: 1) Itialization of system parameters, 2) Initialization of simulation parameters (simulation time, step size, etc.), 3) Running the simulation, 4) Plotting relevant data, and 5) Saving data to the /results folder.  

All of these tasks are done through calling functions from the /utils folder.

## Note(s):
1) If you don't want to add these subfolders to your matlab path, can run the functions in the subfolders using the '.' command. For example, if you have a function in /utils called 'test.m', you could call the test function as utils/test(). - This is an answer from chatgpt, but I haven't actually tried this yet. 
2) If working on school desktop, must run open_WECSIM.m before running any simulations. After done working, must run close_WECSIM.m. If working on personal device, map WEC-Sim folder to your MATLAB path, should be pretty straightforward. See the User Manual Page "Getting Started" for more info. Link: https://wec-sim.github.io/WEC-Sim/main/user/getting_started.html
