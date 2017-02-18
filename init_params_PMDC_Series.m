% inititalizes the parameters for the simulation models to work with when
% executed individually
clear all;
close all;
clc;

%% Set Parameters for PMDC Motor
%Physical Input Parameters
Va_PMDC = 6; % in V
Tm_PMDC = 3.53e-3; % in Nm
%PMDC Parameters
Ra_PMDC = 7; % in ohms
La_PMDC = 0.012; % in H
J_PMDC = 1.06e-6; % in kg.m^2
Dm_PMDC = 6.01e-6; % in Nms
Kv_PMDC = 0.0141; % in NA/m 
% Calculated time constant
Ta_PMDC = La_PMDC/Ra_PMDC;

%% Set comparable parameters for the Series DC Motor
%Physical Input Parameters
Va_SS = 6; % in V
Tm_SS = 3.53e-3; % in Nm
%Series DC Parameters
Ra_SS = 7; % in ohms
Rf_SS = 0.12;
La_SS = 0.012; % in H
Lf_SS = 21.6/1000; % in H
Laf_SS = 21.6/1000; % in H
J_SS = 1.06e-6; % in kg.m^2
Dm_SS = 6.01e-6; % in Nms
% Calculated time constant
Tfa_SS = La_SS/Ra_SS;