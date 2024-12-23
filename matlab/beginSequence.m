%% beginSequence.m
% Runs workspace-clearing commands, and adjusts file path to include all
% necessary functions and models
clear; clc; close all; 

s       = pathsep;
% wecsim_path = "C:\Users\bartonsa\WEC-Sim\"; % Must change this for each location
wecsim_path = "C:\Users\smbar\WEC-Sim\source";
pathStr = [s, path, s];
onPath  = contains(pathStr, [s, wecsim_path, s], 'IgnoreCase', ispc);
if onPath == 0
    home_path = pwd; 
    cd(wecsim_path)
    addWecSimSource
    cd(home_path)
end

classes_path = fullfile(pwd,'classes');
addpath(genpath(classes_path));

models_path = fullfile(pwd,'models');
addpath(genpath(models_path));

utils_path = fullfile(pwd,'utils'); 
addpath(genpath(utils_path));

results_path = fullfile(pwd,'results'); 
addpath(genpath(results_path));

lib_path = fullfile(pwd,'lib'); 
addpath(genpath(lib_path));

tests_path = fullfile(pwd,'tests');
addpath(genpath(tests_path));

clear 