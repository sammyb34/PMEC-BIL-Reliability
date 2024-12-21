% Class - peConvClass
% peDevClass creates a 'conv' object that is used to set the parameters of
% the power electronic converter (number of devices, layout, etc.) and
% converter-level functions (estimating losses, junction temperature, etc.)
classdef peConvClass
    properties
        % Default initialization parameters for the pe converter
        % object.
        type    {mustBeText}        = "none";   % Converter type
        num_device {mustBeNumeric}  = 0;        % Number of devices in converter
        pwm {mustBeText}            = "none";   % PWM method
        fsw {mustBeNumeric}         = 0;        % Switching frequency (Hz)
    end
    
    methods
        function obj = peConvClass(type)
            %PECONVCLASS Construct an instance of converter class
            %   type    - Defines the type of converter class (i.e.,
            %   2LVSC_SPWM)
            %   obj     - The instantiated converter class object
            obj.type = type; 
            switch type
                case "2LVSC_SPWM"
                    obj.num_device = 6; 
                    obj.pwm = "SPWM";
                    obj.fsw = 10e3; 
                case "DIODE_RECTIFIER"
                    obj.num_device = 6; 
                    obj.pwm = "none";
                    obj.fsw = 0; 
            end

        end
        
        function pass = check_def(obj, dev)
            %CHECK_DEF Verifies that the converter and device types match
            %   dev - Device object (must be previously defined)
            %   pass - "true" if pass, "false" otherwise
            switch obj.type
                case "2LVSC_SPWM"
                    if dev.class == "diode"
                        pass = false; 
                    else 
                        pass = true; 
                    end
                case "DIODE_RECTIFIER"
                    if dev.class ~= "diode"
                        pass = false; 
                    else
                        pass = true; 
                    end
            end
        end

        function loss = get_losses(obj, dev, i_ph)

        end
            
    end
end

