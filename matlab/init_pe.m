function pe = init_pe(dev)
%INIT_PE Initializes power electronic device 
%   Device Parameters
%       Ron | On-Resistance of device [Ohms]
%       Vf  | Diode forward voltage [V]
%       Rd  | Diode on-resistance [Ohms]
switch dev
    case 'testMOSFET'
        pe.Ron  = 20e-3; 
        pe.Vf   = 4.2;
        pe.Rd   = 100e-3; 
    case 'testIGBT'
        pe.Ron  = 150e-3; 
        pe.Vf   = 4.2;
        pe.Rd   = 150e-3;
end

