
dir_data = 'D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\';

file_list = dir(strcat(dir_data,'part_*'));

ID_mat = [];
for part_n = 1:size(file_list,1)
    ID_mat(part_n) = str2num(file_list(part_n).name(6:8));
end


for ID_n = 1:size(ID_mat,2)
    
    ID = ID_mat(ID_n);
    
    if ID~=107 && ID~=112 && ID~=119 && ID~=212 && ID~=805
    
        fit_mod12_thompson_3param_noveltybonus_2sgm0_2Hor_2nov_Q01_MAP(ID)
        
    end

    %fit_mod12_thompson_3param_noveltybonus_2Hor_2nov_Q01(ID); 

end

