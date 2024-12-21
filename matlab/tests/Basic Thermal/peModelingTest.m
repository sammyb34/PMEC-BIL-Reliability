%PEMODELINGTEST Tests the device loss models
% Tests the half-sine wave pulsed-power model of device losses for a
% changing electrical frequency. 
%
% Plots both the rotational speed and the corresponding half-sine pulses. 
clear; clc; close all; 

%% Initialize Device Parameters
dev = peDevClass("default_mosfet"); % Default device

%% Simulation Initialization
simu = init_sim(100, 50/100, 1e-3);

%% Test Parameters
i_rms = 25; 
% time_vec = [0 10 20 30 40 50];
% omega_e  = [0 10 10 20 20 10];
time_vec = [0 50];
omega_e = 2*pi*[10 50];
ma = 0.98;

tic
sim("models\testPEConvSubmodule");
toc

%% Plotting
figure 
plot(logsout{1}.Values)
grid on

figure
plot(logsout{3}.Values)
hold on 
plot(logsout{4}.Values)
hold off
grid on 
legend('T_c', 'T_j')

figure
plot(logsout{4}.Values)
grid on 