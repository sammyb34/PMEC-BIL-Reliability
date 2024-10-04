classdef peConvClass
    properties 
        type {mustBeText} = "undefined";
        nDev {mustBeNumeric} = 999;
    end
    methods
        function obj = peConvClass(type, nDev)
            % Constructing an object from the peConvClass class, not really
            % sure how this works or whether it's worth it but I'm going
            % for it anyways. 
            % May be easier to just do this as a struct. 
            if(isstring(type))
                obj.type = type;
            else
                error('type is not a string')
            end

            obj.nDev = nDev;
        end


    end
end