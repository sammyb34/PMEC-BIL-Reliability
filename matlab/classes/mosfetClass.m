% Class - mosfetClass
% Creates a 'dev' object that is used to set the
% electrical parameters of the power electronic devices within the power 
% converter.
%
% Parameters: 
% - type:   Device name
% - class:  Device class (IGBT, MOSFET, or diode)
% - rgon:   External gate turn-on resistance [Ohm]
% - rgoff:  External gate turn-off resistance [Ohm]
% - rdson:  Device rds,on [Ohm]
% - beta:   Coefficients from curve-fitting results for approximating rdson temperature dependence
% - vf:     Device diode forward voltage [V]
% - rdio:   Device diode on-resistance [Ohm]
% - zeta:   Coefficients from curve-fitting resulst for approximating rdio temperature dependence
% - fsw:    Switching frequency [1/s]
% - v_ds:   Test drain-source voltage [V]
% - theta:  Device thermal resistance chain [C/W or K/W] (NOT inlcuding thermal interface and heat sink)
% - c:      Device thermal capacitance chain [J/C or J/K] (NOT inlcuding thermal interface and heat sink)

classdef mosfetClass<handle
    properties 
        % Default initialization parameters for the pe device object. These
        % are the parameters used if the used does not specify a type
        type    {mustBeText}        = "none";           
        class   {mustBeText}        = "none";    
        rgon    {mustBeNumeric}     = 0; 
        rgoff   {mustBeNumeric}     = 0; 
        rdson   {mustBeNumeric}     = 20e-3;            
        beta (1,:) {mustBeNumeric}  = [999 999 999];    
        vf      {mustBeNumeric}     = 4.2;              
        rdio    {mustBeNumeric}     = 100e-3;           
        zeta (1,:) {mustBeNumeric}  = [999 999 999];    
        fsw     {mustBeNumeric}     = 10e3;             
        v_ds    {mustBeNumeric}     = 500;              
        theta(1,:) {mustBeNumeric}  = [999 999 999];    
        c(:,1)  {mustBeNumeric}     = [999 999 999];    
    end 

    methods
        function obj = mosfetClass(type)
            obj.type = type; 
            switch type 
                case "default_mosfet"
                    obj.class = "mosfet";
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
                    obj.c   = [0.002 0.007 0.02 0.15 1e-3 1e3];
            end
        end

        function obj = updaterdson(obj, junction_temp)
            % Considering the variance in rdson with device junction
            % temperature. This is just a place holder, NEED TO WORK ON
            % THIS
            scale = (junction_temp - 50) / 100; 
            obj.rdson = obj.rdson * scale;
        end

        
    end
end