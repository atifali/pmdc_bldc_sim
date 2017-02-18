% Script to automatically run the two models and output the results by
% using plots
clear all;
close all;
clc;

%% Run the PMDC and Series Sim first and collect the data
init_params_PMDC_Series();

simOut = sim('pmdc_and_series_motor_tr','SimulationMode','normal','AbsTol','1e-5',...
            'SaveState','on','StateSaveName','xout',...
            'SaveOutput','on','OutputSaveName','yout',...
 'SaveFormat', 'Dataset');

outputs = simOut.get('yout');