classdef xLineClass<handle
    properties
        length {mustBeNumeric} = 999; 
        L   {mustBeNumeric} = 0; 
        C   {mustBeNumeric} = 0; 
        R   {mustBeNumeric} = 1;
    end

    methods
        function obj = xLineClass(length, L, C, R)
            % Initial attempt at a constructor
            obj.length = length; 
            obj.L = L; 
            obj.C = C; 
            obj.R = R;
        end
    end

end