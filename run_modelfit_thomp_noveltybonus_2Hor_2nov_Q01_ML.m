

[all_parameters_thomp_noveltybonus_ML] = concatenate_all_params_thomp_nov_2Hor_2nov_Q01_ML();

sgm0_mat_thomp = [all_parameters_thomp_noveltybonus_ML(:,1)];
Q0_mat_thomp = [all_parameters_thomp_noveltybonus_ML(:,2)];
xi_mat_thomp_short = [all_parameters_thomp_noveltybonus_ML(:,3)];
xi_mat_thomp_long = [all_parameters_thomp_noveltybonus_ML(:,4)];
xi_mat_thomp = [xi_mat_thomp_short xi_mat_thomp_long];
eta_mat_thomp_short = [all_parameters_thomp_noveltybonus_ML(:,5)];
eta_mat_thomp_long = [all_parameters_thomp_noveltybonus_ML(:,6)];
eta_mat_thomp = [eta_mat_thomp_short eta_mat_thomp_long];

