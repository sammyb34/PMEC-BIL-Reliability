%% main.m
% Main script for multiphysics modeling of WEC system. 

clear; clc; close all; 

beginSequence % REQUIRED 

%% Initialization
% Initializes:
%   1) Simulation parameters
%   2) Wave conditions
%   3) WEC parameters
%   4) PTO parameters
%   5) PE conveter parameters
%   6) Transmission line parameters
%   7) Grid parameters
% Will be done by separate functions. 
sim_time = 100; 
sample_period = 1; 
max_stepSize = 0.1;
simu = init_sim(sim_time, sample_period, max_stepSize); 



endSequence % REQUIRED