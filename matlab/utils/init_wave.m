function wave = init_wave(height, period, wave_length, water_depth, type)
%INIT_WAVE Initializes wave resource parameters
%   Parameters: 
%       - a: Wave amplitude [m]
%       - T: Wave period [s]
%       - L: Wavelength [m]
%       - h: Water depth [m]
%       - type: "type" of wave (i.e., regular, irregular, etc.) (string)
%       - H: Wave height [m]
%       - k: Wave number [1/m]
%       - w: Wave rotational frequency [rad/s]
%       - f: Wave frequency [1/s]
%       - c: Wave celerity (speed) [m/s]
    wave.a = height; 
    wave.T = period; 
    wave.L = wave_length; 
    wave.h = water_depth; 
    wave.type = type;

    if(strcmp(wave.type,"regular"))
        wave.H = 2*wave.a; 
    end
    wave.k = 2*pi/wave.L; 
    wave.w = 2*pi/wave.T; 
    wave.f = 1/wave.T; 
    wave.c = wave.L/wave.T; 
    wave.e = wave.k * wave.a; 

end
