% Class - peDevClass
% peDevClass creates a 'dev' object that is used to set the
% electrical parameters of the power electronic devices within the power 
% converter and associated device-related functions such as estimating
% losses, junction temperature, etc.
classdef peDevClass<handle
    properties 
        % Default initialization parameters for the pe device object. These
        % are the parameters used if the used does not specify a type
        type    {mustBeText}        = "none";           % Device name  
        rdson   {mustBeNumeric}     = 20e-3;            % Device rds,on [Ohm]
        beta (1,:) {mustBeNumeric}  = [999 999 999];    % Coefficients from curve-fitting results for approximating rdson temperature dependence
        vf      {mustBeNumeric}     = 4.2;              % Device diode forward voltage [V]
        rdio    {mustBeNumeric}     = 100e-3;           % Device diode on-resistance [Ohm]
        zeta (1,:) {mustBeNumeric}  = [999 999 999];    % Coefficients from curve-fitting resulst for approximating rdio temperature dependence
        fsw     {mustBeNumeric}     = 10e3;             % Switching frequency [1/s]
        v_ds    {mustBeNumeric}     = 500;              % Drain-source voltage [V]
        theta(1,:) {mustBeNumeric}  = [999 999 999];    % Device thermal resistance chain [C/W or K/W] 
        c(:,1)  {mustBeNumeric}     = [999 999 999];    % Device thermal capacitance chain [J/C or J/K]
    end 

    methods
        function obj = peDevClass(type)
            obj.type = type; 
            switch type 
                case "default_mosfet"
                    obj.rdson = 20e-3; 
                    % Curve-fitting to find beta values
                    temp_tests = [-40; 25; 40; 100];
                    normalized_rdson = [1.1; 1; 1.1; 1.2];
                    fit_results = fit(temp_tests, normalized_rdson, 'poly2');
                    obj.beta = [fit_results.p1 fit_results.p2 fit_results.p3]; 
                    obj.vf = 4.5; 
                    obj.rdio = 150e-3; 
                    obj.zeta = [15 15 15];
                    obj.fsw = 15e3; 
                    obj.v_ds = 750;
                    obj.theta = [0.007 0.020 0.100 0.100 1 0.015];
                    obj.c   = [0.002 0.0074 0.0251 0.163 1e-3 1e3];
                    % obj.c = [1e-15 1e-15 1e-15 1e-15 1e-15 1e3];
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