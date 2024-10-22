function pe = initPeDev(type)
%INIT_PEDEV Initializes power electronic device (pe) object 
%   Only initializes PE device parameters, but does not initialize any 
%   object-related functions, like a class would
    pe.type = type; 
    
    switch type
        case "default"
            pe.rdson   = 20e-3; 
            pe.vf      = 4.2;
            pe.rdio    = 100e-3; 
            pe.fsw     = 10e3; 
            pe.vds     = 500;
    end

end

