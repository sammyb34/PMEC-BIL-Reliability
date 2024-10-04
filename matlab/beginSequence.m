%% beginSequence.m
% Runs workspace-clearing commands, and adjusts file path to include all
% necessary functions and models
clear; clc; close all; 

classes_path = fullfile(pwd,'classes');
addpath(classes_path);

models_path = fullfile(pwd,'models');
addpath(models_path);

utils_path = fullfile(pwd,'utils'); 
addpath(utils_path);

results_path = fullfile(pwd,'results'); 
addpath(results_path);


clear models_path utils_path results_path