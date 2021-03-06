
clear

[all_parameters_thomp_noveltybonus_MAP, part_num] = concatenate_all_params_mod12_prior2normal();

sgm0_mat_thomp_short = [all_parameters_thomp_noveltybonus_MAP(:,1)];
sgm0_mat_thomp_long = [all_parameters_thomp_noveltybonus_MAP(:,2)];
sgm0_mat_thomp = [sgm0_mat_thomp_short sgm0_mat_thomp_long];
Q0_mat_thomp = [all_parameters_thomp_noveltybonus_MAP(:,3)];
xi_mat_thomp_short = [all_parameters_thomp_noveltybonus_MAP(:,4)];
xi_mat_thomp_long = [all_parameters_thomp_noveltybonus_MAP(:,5)];
xi_mat_thomp = [xi_mat_thomp_short xi_mat_thomp_long];
eta_mat_thomp_short = [all_parameters_thomp_noveltybonus_MAP(:,6)];
eta_mat_thomp_long = [all_parameters_thomp_noveltybonus_MAP(:,7)];
eta_mat_thomp = [eta_mat_thomp_short eta_mat_thomp_long];

model_parameters = [part_num all_parameters_thomp_noveltybonus_MAP];
model_parameters_desc = [{'ID'} {'sgm0_short'} {'sgm0_long'} {'Q0'} {'xi_short'} {'xi_long'} {'eta_short'} {'eta_lon'}];

size(model_parameters,2)
size(model_parameters_desc,2)

% Remove 112
todel = find(model_parameters(:,1)==112);
model_parameters(todel,:)=[];
part_num(todel,:)=[];

% Save
folder_name='prior2normal\';
folder_path='D:\MaggiesFarm\modeling_05_07_developmental\participant_data\fit\concatenated\';
mkdir(strcat(folder_path,folder_name));

save(strcat(folder_path,folder_name,'model_parameters.mat'),'model_parameters');
save(strcat(folder_path,folder_name,'model_parameters_desc.mat'), 'model_parameters_desc');
save(strcat(folder_path,folder_name,'part_num.mat'), 'part_num');

