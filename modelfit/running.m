
file_list = dir('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\');

part_num = [];

for part_n = 1:size(file_list,1)
    if strcmp(file_list(part_n).name(1),'p')
        if str2num(file_list(part_n).name(6:8)) < 900
            part_num(end+1) = str2num(file_list(part_n).name(6:8));
        end
    end
end


for ID=108:size(part_num,2) 
    
    if part_num(ID)~=106 && part_num(ID)~=107 && part_num(ID)~=119 && part_num(ID)~=212 && part_num(ID)~=805

        part_num(ID)

        fit_mod12_prior2normal_newB(part_num(ID))
    
    end

end