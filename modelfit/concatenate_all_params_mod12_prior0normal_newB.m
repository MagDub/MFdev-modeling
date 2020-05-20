
function [all_parameters_thomp_noveltybonus, part_num] = concatenate_all_params_mod12_prior0normal_newB()

file_list = dir('D:\MaggiesFarm\modeling_05_07_developmental\participant_data\fit\mod12_prior0normal_newB\3params\results\res_thompson_*_results.mat');

part_num = [];

for part_n = 1:size(file_list,1)
    part_num(part_n) = str2num(file_list(part_n).name(14:16));
end

all_parameters_thomp_noveltybonus = [];

    for participant = 1:size(part_num,2)
        
        load(strcat('D:\MaggiesFarm\modeling_05_07_developmental\participant_data\fit\mod12_prior0normal_newB\3params\results\res_thompson_',num2str(part_num(participant)),'_results.mat'))

        all_parameters_thomp_noveltybonus(participant,:) = mEparams;
    end

    part_num=part_num';
    
end