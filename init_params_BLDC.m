% inititalizes the parameters for the simulation models to work with when
% executed individually

%% Set Prameters for BLDC motor
Vdc = 6; % in V
Tm = 3.53e-3; % in N m
J = 2.12e-6; % in kg m^2
Dm = 6.04e-6; % in N.m.s
Lss = 10.1e-3; % in H
rs = 5.2; % in Ohms
Lam = 1.65e-2; % in V*s/rad
Ts = Lss/rs;
P = 4; % no of poles