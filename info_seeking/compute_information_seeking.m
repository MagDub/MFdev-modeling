
function [N_app_of_selected_tree_SH, N_app_of_selected_tree_LH] = compute_information_seeking()

% from RUN_make_frequencies in 2019_04_17_MF_dev_explore\scripts_data_analysis
load('D:\writing\MF_dev\data_for_figs_2\frequencies.mat'); 
load('D:\writing\MF_dev\data_for_figs_2\frequencies_desc.mat');

n_trials_SH = 96/2;
n_trials_LH = 96/2;

pickedA_SH_perc = frequencies(:,1)/n_trials_SH;
pickedB_SH_perc = frequencies(:,2)/n_trials_SH;
pickedC_SH_perc = frequencies(:,3)/n_trials_SH;
pickedD_SH_perc = frequencies(:,4)/n_trials_SH;
pickedA_LH_perc = frequencies(:,5)/n_trials_LH;
pickedB_LH_perc = frequencies(:,6)/n_trials_LH;
pickedC_LH_perc = frequencies(:,7)/n_trials_LH;
pickedD_LH_perc = frequencies(:,8)/n_trials_LH;


N_app_of_selected_tree_SH=(pickedA_SH_perc*3+pickedB_SH_perc*1+pickedC_SH_perc*0+pickedD_SH_perc*1);
N_app_of_selected_tree_LH=(pickedA_LH_perc*3+pickedB_LH_perc*1+pickedC_LH_perc*0+pickedD_LH_perc*1);


end
