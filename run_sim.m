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
            'SaveFormat', 'StructureWithTime');

outputs = simOut.get('yout');

time = outputs.time;
PMDC_Ia = outputs.signals(1).values;
SS_Ia = outputs.signals(2).values;
PMDC_Wr = outputs.signals(3).values;
SS_Wr = outputs.signals(4).values;
PMDC_Te = outputs.signals(5).values;
SS_Te = outputs.signals(6).values;

figure('Name', 'Comparison of the motor parameters for PMDC and Series DC motor');
subplot(3,1,1);
h1 = plot(time,PMDC_Ia); hold on;
h2 = plot(time,SS_Ia);
set(h1,'color',[0 1 0]); 
set(h2,'color',[0 0 1]);
title('Motor Current vs Time');
xlabel('Time (s)');
ylabel('Current (A)');
legend('PMDC_I_a', 'SS_I_a');
subplot(3,1,2);
h1 = plot(time,PMDC_Wr); hold on;
h2 = plot(time,SS_Wr);
set(h1,'color',[0 1 0]); 
set(h2,'color',[0 0 1]);
title('Motor Speed vs Time');
xlabel('Time (s)');
ylabel('Speed (rad/s)');
legend('PMDC_W_r', 'SS_W_r');
subplot(3,1,3);
h1 = plot(time,PMDC_Te); hold on;
h2 = plot(time,SS_Te);
set(h1,'color',[0 1 0]); 
set(h2,'color',[0 0 1]);
title('Motor Torque vs Time');
xlabel('Time (s)');
ylabel('Torque (N.m)');
legend('PMDC_T_e', 'SS_T_e');
hold off;

%% Run the BLDC Sim and collect the data
init_params_BLDC();

simOut = sim('bldc_model','SimulationMode','normal','AbsTol','1e-5',...
            'SaveState','on','StateSaveName','xout',...
            'SaveOutput','on','OutputSaveName','yout',...
            'SaveFormat', 'StructureWithTime');

outputs = simOut.get('yout');

time = outputs.time;
Vqds= outputs.signals(1).values;
Iqds = outputs.signals(2).values;
Iabs = outputs.signals(3).values;
Te = outputs.signals(4).values;
Wr = outputs.signals(5).values;
Vabs = outputs.signals(6).values;

figure('Name', 'BLDC Current and Voltages');
subplot(4,1,1);
h1 = plot(time,Vabs(:,1)); hold on;
h2 = plot(time,Vabs(:,2));
set(h1,'color',[0 1 0]);
set(h2,'color',[0 0 1]);
legend('Phase1', 'Phase2');
title('Absolute Phase Voltages vs Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
subplot(4,1,2);
h1 = plot(time,Vqds(:,1)); hold on;
h2 = plot(time,Vqds(:,2));
set(h1,'color',[0 1 0]); 
set(h2,'color',[0 0 1]);
legend('Phase1', 'Phase2');
title('Phase Voltages (qds) vs Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
subplot(4,1,3);
h1 = plot(time,Iabs(:,1)); hold on;
h2 = plot(time,Iabs(:,2));
set(h1,'color',[0 1 0]);
set(h2,'color',[0 0 1]);
legend('Phase1', 'Phase2');
title('Absolute Phase Current vs Time');
xlabel('Time (s)');
ylabel('Current (A)');
subplot(4,1,4);
h1 = plot(time,Iqds(:,1)); hold on;
h2 = plot(time,Iqds(:,2));
set(h1,'color',[0 1 0]);
set(h2,'color',[0 0 1]);
legend('Phase1', 'Phase2');
title('Phase Current (qds) vs Time');
xlabel('Time (s)');
ylabel('Current (A)');

figure('Name', 'BLDC Speed and Torque');
subplot(2,1,1);
plot(time,Wr);
title('Speed vs Time');
xlabel('Time (s)');
ylabel('Speed (rad/s)');
subplot(2,1,2);
h1 = plot(time,Te);
title('Torque vs Time');
xlabel('Time (s)');
ylabel('Torque (N.m)');