
tmp=load('D:\writing\MF_dev\data_for_figs\model_parameters.mat');
load('D:\writing\MF_dev\data_for_figs\part_num.mat')
ID_mat=tmp.model_parameters(:,1)';

for ID_n = 3:size(ID_mat,2)
    
    ID = ID_mat(ID_n);
    
    disp(ID)
    
    cv_mod1_hybrid_4param_2Hor_1w_1Q0(ID)
    cv_mod2_hybrid_4param_xi_2Hor_1w_Q01(ID)
    cv_mod3_hybrid_4param_nov_both_2Hor_1w_2eta_Q01(ID)

end

%%%%

% for ID_n = 1:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
%     
%     if ID>117
%         cv_mod4_hybrid_4param_xi_nov_both_2Hor_2nov_1w_Q01(ID)
%         cv_mod6_UCB_2param_2Hor_2nov_Q01(ID)
%         cv_mod7_UCB_3param_2Hor_Q01(ID)
%         cv_mod8_UCB_3param_noveltybonus_2Hor_2nov_Q01(ID)
%     end
%     
%     if ID>116
%         cv_mod5_UCB_2param_2Hor_Q01(ID)
%     end
%     
% end
% 
% for ID_n = 53:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
% 
%     cv_mod10_thompson_3param_2Hor_Q01(ID)
%     cv_mod11_thompson_2param_nov_2Hor_2nov_Q01(ID)
%     
% end
% 
% for ID_n = 54:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
% 
%     cv_mod9_thompson_2param_Q01(ID)
% end
% 
% for ID_n = 7:size(ID_mat,2)
%     
%     ID = ID_mat(ID_n);
% 
%     cv_mod12_thompson_3param_nov_2Hor_2nov_Q01(ID)  
%     
% end


