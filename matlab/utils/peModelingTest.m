%PEMODELINGTEST Tests the device loss models
% Tests the half-sine wave pulsed-power model of device losses for a
% changing electrical frequency. 
%
% Plots both the rotational speed and the corresponding half-sine pulses. 
clear; clc; close all; 

%% Initialize Device Parameters
dev = peDevClass("Default"); % Default device

%% Simulation Initialization
simu = init_sim(50, 50/100, 1e-3);

%% Test Parameters
i_rms = 25; 
time_vec = [0 10 20 30 40 50];
omega_e  = [0 10 10 20 20 10];
ma = 0.98;

sim("models\testPEConvSubmodule");

%% Plotting
figure 
tiledlayout(2,1)
nexttile
plot(logsout{1}.Values)
grid on 
nexttile
plot(logsout{2}.Values)
grid on 