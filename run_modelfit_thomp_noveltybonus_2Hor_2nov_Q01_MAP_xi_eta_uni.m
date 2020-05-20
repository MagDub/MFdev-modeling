

[all_parameters_thomp_noveltybonus_MAP, part_num] = concatenate_all_params_thomp_nov_2Hor_2nov_Q01_MAP_xi_eta_uni();

sgm0_mat_thomp = [all_parameters_thomp_noveltybonus_MAP(:,1)];
Q0_mat_thomp = [all_parameters_thomp_noveltybonus_MAP(:,2)];
xi_mat_thomp_short = [all_parameters_thomp_noveltybonus_MAP(:,3)];
xi_mat_thomp_long = [all_parameters_thomp_noveltybonus_MAP(:,4)];
xi_mat_thomp = [xi_mat_thomp_short xi_mat_thomp_long];
eta_mat_thomp_short = [all_parameters_thomp_noveltybonus_MAP(:,5)];
eta_mat_thomp_long = [all_parameters_thomp_noveltybonus_MAP(:,6)];
eta_mat_thomp = [eta_mat_thomp_short eta_mat_thomp_long];

model_parameters = [part_num' all_parameters_thomp_noveltybonus_MAP];
model_parameters_desc = [{'ID'} {'sgm0'} {'Q0'} {'xi_short'} {'xi_long'} {'eta_short'} {'eta_lon'}];

save('D:\writing\MF_dev\data_for_figs\model_parameters.mat', 'model_parameters');
save('D:\writing\MF_dev\data_for_figs\model_parameters_desc.mat', 'model_parameters_desc');

