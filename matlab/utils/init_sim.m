function simu = init_sim(sim_time, sample_period, max_stepSize)
%INIT_SIM Initializes simulation parameters
%   Parameters: 
%       - sim_time: Total simulation time (s)
%       - sample_period:    Sampling period (s)
%       - max_stepSize:     Maximum allowable step size (s)

simu.sim_time = sim_time; 
simu.sample_period = sample_period; 
simu.max_stepSize = max_stepSize; 

end