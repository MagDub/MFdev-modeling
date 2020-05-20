
% participants
% file_list = dir('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\');
% part_num = [];
% for part_n = 1:size(file_list,1)
%     if strcmp(file_list(part_n).name(1),'p')
%         if str2num(file_list(part_n).name(6:8)) < 800
%             part_num(end+1) = str2num(file_list(part_n).name(6:8));
%         end
%     end
% end

% OR

load('C:\Users\mdubois\Google Drive\UCL\writing\MF_dev\data_for_figs_2\part_num.mat')
part_num = part_num';
numel = size(part_num,2);

%% participants

% tmp=load('D:\writing\MF_dev\data_for_figs\model_parameters.mat');
% load('D:\writing\MF_dev\data_for_figs\part_num.mat')
% part_num=tmp.model_parameters(:,1)';

idx_group1 = find(part_num(1,:)<200);
idx_group2 = [find(part_num(1,:)==201) : (find(part_num(1,:)==301)-1)];
idx_group3 = [find(part_num(1,:)==301) : size(part_num,2)];
tmp=[];
numel = size(part_num,2);

%% scripts
[EV_SH_mat, EV_LH_mat] = compute_EV_all(part_num); % expected values
[IS_SH_mat, IS_LH_mat] = compute_information_seeking(); % information seeking

%% plots
plot_behaviour_EVexploitation(numel, EV_SH_mat, EV_LH_mat)
plot_behaviour_numberofapplesofchosentree(numel, IS_SH_mat, IS_LH_mat)

%% plots
plot_behaviour_EVexploitation_g1(numel, EV_SH_mat(idx_group1), EV_LH_mat(idx_group1))
plot_behaviour_EVexploitation_g2(numel, EV_SH_mat(idx_group2), EV_LH_mat(idx_group2))
plot_behaviour_EVexploitation_g3(numel, EV_SH_mat(idx_group3), EV_LH_mat(idx_group3))

plot_behaviour_numberofapplesofchosentree_g1(numel, IS_SH_mat(idx_group1), IS_LH_mat(idx_group1))
plot_behaviour_numberofapplesofchosentree_g2(numel, IS_SH_mat(idx_group2), IS_LH_mat(idx_group2))
plot_behaviour_numberofapplesofchosentree_g3(numel, IS_SH_mat(idx_group3), IS_LH_mat(idx_group3))

save('D:\writing\MF_dev\data_for_figs_2\EV_SH_mat.mat', 'EV_SH_mat')
save('D:\writing\MF_dev\data_for_figs_2\EV_LH_mat.mat', 'EV_LH_mat')
save('D:\writing\MF_dev\data_for_figs_2\IS_SH_mat.mat', 'IS_SH_mat')
save('D:\writing\MF_dev\data_for_figs_2\IS_LH_mat.mat', 'IS_LH_mat')

save('C:\Users\mdubois\Google Drive\UCL\writing\MF_dev\data_for_figs_2\EV_SH_mat.mat', 'EV_SH_mat')
save('C:\Users\mdubois\Google Drive\UCL\writing\MF_dev\data_for_figs_2\EV_LH_mat.mat', 'EV_LH_mat')
save('C:\Users\mdubois\Google Drive\UCL\writing\MF_dev\data_for_figs_2\IS_SH_mat.mat', 'IS_SH_mat')
save('C:\Users\mdubois\Google Drive\UCL\writing\MF_dev\data_for_figs_2\IS_LH_mat.mat', 'IS_LH_mat')

% to do: reward computation + plot
