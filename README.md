#PMDC and BLDC motor simulation 

This repository is dedicated for the MATLAB based simulations for the PMDC (along with series DC) and BLDC motors.

In order to access the simulink models please use the .slx model files respectively.

However, in order to run the model some initial model parameters need to be initialized, hence the associated .m scripts (init_params_PMDC_Series.m & init_params_BLDC.m) must be ran before run either one of the models.

NOTE: Based on your Simulink version the model might or might not give a prompt to adapt the model to your version, do so freely since the implemetation is version indepedent.

If a single script is to be used to create the results just use the run_sim.m from the folder and it should run the appropriate models along with loading the parameters and the data collections and ploting the useful data on figures for you.

Please suggest any improvements if you would like or point out any errors that you find out!
