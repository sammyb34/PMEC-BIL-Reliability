function [Psw, Pcnd, Ptot] = PE_Losses(iph, ma, pf, pe)
%PE_LOSSES Calculates average losses of semiconductor switches
%   Can calculate for either IGBT or MOSFET
%
%   Input Parameters: 
%       iph | RMS phase current [A]
%       ma  | Instantaneous modulation index [-]
%       pf  | Motor operating power factor [-]
%       pe  | Struct holding pe device information
%
%   Ouptut Parameters: 
%       Psw | Switching losses [W]
%       Pcnd| Conduction losses [W]
%       Ptot| Total Losses [W]
switch pe.devType
    case 'MOSFET'
        % NOTE: Loss calculation can be found from https://application-notes.digchip.com/070/70-41484.pdf
        Ipk = iph * sqrt(2); 
        Pcdmos = pe.Rdson * Ipk^2 * (1/8 + ma * pf / (3 * pi));
        Pcddio = pe.Vf * Ipk * (1/(2*pi) - ma*pf/8) + pe.Rd * Ipk^2 * (1/8 - ma*pf/(3*pi));
        Pcnd = Pcdmos + Pcddio;
        Psw = 1; % Assumed fixed right now because I don't want to deal with it
    case 'IGBT'
        % NEED TO FILL THIS OUT
        Pcnd = 2; 
        Psw = 1; 
end
    
    Ptot = Psw + Pcnd;
end

