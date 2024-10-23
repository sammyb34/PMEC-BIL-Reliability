% Class Definition: peDevClass
% peDevClass creates a 'dev' object that is used to set the
% electrical parameters of the power electronic devices within the power 
% converter and associated device-related functions such as estimating
% losses, junction temperature, etc. 

classdef peDevClass<handle
    properties 
        % Default initialization parameters for the pe device object. These
        % are the parameters used if the used does not specify a type
        type    {mustBeText}        = "Default";    % Device name  
        rdson   {mustBeNumeric}     = 20e-3;        % Device rds,on [Ohm]
        vf      {mustBeNumeric}     = 4.2;          % Device diode forward voltage [V]
        rdio    {mustBeNumeric}     = 100e-3;       % Device diode on-resistance [Ohm]
        fsw     {mustBeNumeric}     = 10e3;         % Switching frequency [1/s]
        v_ds    {mustBeNumeric}     = 500;          % Drain-source voltage [V]
    end 

    methods
        function obj = peDevClass(type)
            obj.type = type; 
            switch type 
                case "Other"
                    obj.rdson = 50e-3; 
                    obj.vf = 4.5; 
                    obj.rdio = 150e-3; 
                    obj.fsw = 15e3; 
                    obj.v_ds = 750;
            end
        end



        function obj = update_rdson(obj, junction_temp)
            % Considering the variance in rdson with device junction
            % temperature. This is just a place holder, and should work on
            % this on Monday. 
            scale = (junction_temp - 50) / 100; 
            obj.rdson = obj.rdson * scale;
        end

        function p_cond = getConductionLoss(obj, i_rms)
            % Calculates conduction losses for a single device.
            idev_rms = i_rms / sqrt(2); 
            p_cond = idev_rms^2 * obj.rdson;
        end

        function p_sw = getSwitchingLoss(obj, i_rms)
            p_sw = 0;
        end

        
    end
end