%% beginSequence.m
% Runs workspace-clearing commands, and adjusts file path to include all
% necessary functions and models
clear; clc; close all; 

home_path = pwd; 
wecsim_path = "C:\Users\bartonsa\WEC-Sim\"; % Must change this for each location
cd(wecsim_path)
addWecSimSource
cd(home_path)

classes_path = fullfile(pwd,'classes');
addpath(classes_path);

models_path = fullfile(pwd,'models');
addpath(models_path);

utils_path = fullfile(pwd,'utils'); 
addpath(utils_path);

results_path = fullfile(pwd,'results'); 
addpath(results_path);

lib_path = fullfile(pwd,'lib'); 
addpath(lib_path);

tests_path = fullfile(pwd,'tests');
addpath(tests_path)

clear 