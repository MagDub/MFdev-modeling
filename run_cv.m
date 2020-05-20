
dir_data = 'D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\';
file_list = dir(strcat(dir_data,'part_*'));
ID_mat = [];
for part_n = 1:size(file_list,1)
    ID_mat(part_n) = str2num(file_list(part_n).name(6:8));
end

% ID_mat = [101];


for ID_n = 1:size(ID_mat,2)
    
    ID = ID_mat(ID_n);
    
%         if ID > 228 
    
            if ID~=107 && ID~=119 && ID~=212 && ID~=805

                cv_mod12_thompson_3param_nov_2Hor_2nov_Q01(ID)

            end
%         end
end

% for ID_n = 1:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
%     
%     if ID > 310
%     
%         if ID~=107 && ID~=119 && ID~=212 && ID~=805
%             
%             cv_mod19_max(ID)
% 
%         end
%     end
% end

% for ID_n = 1:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
%     
%     if ID>302
%     
%         if ID~=107 && ID~=119 && ID~=212 && ID~=805
% 
%         cv_mod15_heuristics(ID) % only eta
% 
%         end
%     end
% end
% 
% for ID_n = 1:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
%     
%     if ID>212
%     
%         if ID~=107 && ID~=119 && ID~=212 && ID~=805
% 
%         cv_mod14_heuristics(ID) % neither
% 
%         end
%     end
% end
% 
% for ID_n = 1:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
%     
%     if ID>207
%     
%         if ID~=107 && ID~=119 && ID~=212 && ID~=805
% 
%         cv_mod13_heuristics(ID) % only xi
% 
%         end
%     end
% 
% end



%     cv_mod1_hybrid_4param_2Hor_1w(ID);
%     cv_mod2_hybrid_4param_xi_2Hor_1w(ID);
%     cv_mod3_hybrid_4param_nov_both_2Hor_1w_2eta(ID);
%     cv_mod4_hybrid_4param_xi_nov_both_2Hor_2nov_1w(ID);
%     cv_mod5_UCB_2param_2Hor(ID);
%     cv_mod6_UCB_2param_2Hor_2nov(ID);
%     cv_mod7_UCB_3param_2Hor(ID);
%     cv_mod8_UCB_3param_noveltybonus_2Hor_2nov(ID);
%     cv_mod9_thompson_2param_1Hor(ID);
%     cv_mod10_thompson_3param_2Hor(ID);
%     cv_mod11_thompson_2param_nov_2Hor_2nov_Q01(ID);
%     cv_mod12_thompson_3param_nov_2Hor_2nov_Q01(ID);