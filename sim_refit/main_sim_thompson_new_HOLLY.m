
thompson_file = 'D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\thompson\';

addpath('D:\MaggiesFarm\modeling_05_07_developmental\')

%% NEED TO BE COPIED IN sim_refit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_per_dim = 4;
param_bounds_sgm0 = [0.5,2.5];
param_bounds_Q0 = [1,6]; 
param_bounds_xi = [0,0.5];  
param_bounds_eta = [0,5];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
algo = 'thompson';
n_param = 7;

param_bounds.xi = param_bounds_xi;
param_bounds.sgm0 = param_bounds_sgm0; 
param_bounds.Q0 = param_bounds_Q0; 
param_bounds.eta = param_bounds_eta; 

saving_dir = strcat(thompson_file,'\', int2str(n_per_dim), 'perdim\');

prep_inp_params_perhor_MAP(n_per_dim,algo, param_bounds, saving_dir);

save(strcat(saving_dir,'\param_bounds.mat'), 'param_bounds')
  
disp(strcat('total num sum: ',32, int2str(n_per_dim^(n_param))))


 

