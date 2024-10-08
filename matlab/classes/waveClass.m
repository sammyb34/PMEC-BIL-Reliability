%% Class Definition: waveClass
% Creates a 'wave' object that holds wave parameters 
classdef waveClass<handle
    properties 
        type {mustBeText}   = "";   % Wave "type" (regular, irregular, etc.)
        height {mustBeNonnegative} = 999;   % Wave height [m] - May need to make this a vector to make irregular waves (or waves with a more complex profile)
        period {mustBeNonnegative} = 999;   % Wave period [1/s] - May need to make this a vector to make more complex wave profiles
    end

end