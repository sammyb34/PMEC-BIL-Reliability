%PEMODELINGTEST Tests the device loss models
% Tests the half-sine wave pulsed-power model of device losses for a
% changing electrical frequency. 
%
% Plots both the rotational speed and the corresponding half-sine pulses. 
clear; clc; close all; 

%% Initialize Device Parameters
dev = peDevClass("default_mosfet"); % Default device

%% Load & Parse PTO-Sim Data
load("RM3_DD_PTO_matlabWorkspace.mat")
data = output.ptoSim;
current = timeseries([data.Ia data.Ib data.Ic], data.time);
voltage = timeseries([data.Va data.Vb data.Vc], data.time);
frequency = timeseries(data.vel, data.time) / ptoSim.directLinearGenerator.tau_p;


%% Simulation Initialization
simu = init_sim(100, 50/100, 1e-3);

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