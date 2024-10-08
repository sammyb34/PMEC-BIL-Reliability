%% Class Definition: peConvClass
% peConvClass creates a 'conv' object that is used to set the
% electrical parameters of the power electronic converter (number of
% devices, device on-resistance(s), switching energy losses, etc. 
% Also holds functions for calculating averaged switching losses, etc. 
classdef peConvClass<handle
    properties 
        type    {mustBeText}        = "undefined";
        num_dev {mustBeNumeric}     = 999;
        rdson   {mustBeNumeric}     = 999;
        vf      {mustBeNumeric}     = 0; 
        rdio    {mustBeNumeric}     = 999;
    end 
    methods
        function obj = peConvClass(type, num_dev, rdson, vf, rdio)
            % Constructing an object from the peConvClass class, not really
            % sure how this works or whether it's worth it but I'm going
            % for it anyways. 
            % May be easier to just do this as a struct. 
            if(isstring(type))
                obj.type = type;
            else
                error("'Type' is not a string")
            end
            obj.num_dev = num_dev;
            obj.rdson = rdson; 
            obj.vf = vf; 
            obj.rdio = rdio; 
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
        
    end
end