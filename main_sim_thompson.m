
%% NEED TO BE COPIED IN sim_refit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_per_dim = 5;
param_bounds_sgm0 = [0.01,1.5];
param_bounds_Q0 = [1,8]; 
param_bounds_xi = [0,0.8];  
param_bounds_eta = [0,4];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% faire Q0 de 1

%%
algo = 'thompson';
n_param = 4;

param_bounds.xi = param_bounds_xi;
param_bounds.sgm0 = param_bounds_sgm0; 
param_bounds.Q0 = param_bounds_Q0; 
param_bounds.eta = param_bounds_eta; 

prep_inp_params_perhor(n_per_dim,algo, n_param, param_bounds);
  
for ID=1:n_per_dim^(n_param*2-1)

    disp(strcat((int2str(ID)),32, 'of', 32, int2str(n_per_dim^(n_param*2-1))))

    sim_refit_thompson_3param_noveltybonus_parhor(ID) 

end

aggregate_simResults(algo, n_param, n_per_dim)
plot_correlation(algo, n_param, n_per_dim)
