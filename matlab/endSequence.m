%% beginSequence.m
% Runs workspace-clearing commands, and adjusts file path to include all
% necessary functions and models

home_path = pwd; 
wecsim_path = "C:\Users\bartonsa\WEC-Sim\";
cd(wecsim_path)
removeWecSimSource
cd(home_path)

classes_path = fullfile(pwd,'classes');
rmpath(classes_path);

models_path = fullfile(pwd,'models');
rmpath(models_path);

utils_path = fullfile(pwd,'utils'); 
rmpath(utils_path);

results_path = fullfile(pwd,'results'); 
rmpath(results_path);

clear 