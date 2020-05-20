
% IDs
tmp=load('D:\writing\MF_dev\data_for_figs\model_parameters.mat');
load('D:\writing\MF_dev\data_for_figs\part_num.mat')
part_num=tmp.model_parameters(:,1)';

RT_AB = nan(size(part_num,2),2);
RT_ABD = nan(size(part_num,2),2);
RT_AD = nan(size(part_num,2),2);
RT_BD = nan(size(part_num,2),2);

RT_all_SH = nan(12,4);
RT_all_LH = nan(12,4);

RT_all_m =  nan(size(part_num,2),2);

for i=1:size(part_num,2)
    
    ID = part_num(i);

    tmp_AB=load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',num2str(ID),'\mat_AB.mat'));
    tmp_ABD=load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',num2str(ID),'\mat_ABD.mat'));
    tmp_AD=load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',num2str(ID),'\mat_AD.mat'));
    tmp_BD=load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',num2str(ID),'\mat_BD.mat'));
    
   [ind_SH]=find(tmp_AB.mat_AB(:,3)==6);
   [ind_LH]=find(tmp_AB.mat_AB(:,3)==11);
   RT_AB(i,:) = [mean(tmp_AB.mat_AB(ind_SH,end),1) mean(tmp_AB.mat_AB(ind_LH,end),1)];
   RT_all_SH(:,1) = [tmp_AB.mat_AB(ind_SH,end)];
   RT_all_LH(:,1) = [tmp_AB.mat_AB(ind_LH,end)];
   
   [ind_SH]=find(tmp_ABD.mat_ABD(:,3)==6);
   [ind_LH]=find(tmp_ABD.mat_ABD(:,3)==11); 
   RT_ABD(i,:) = [mean(tmp_ABD.mat_ABD(ind_SH,end),1) mean(tmp_ABD.mat_ABD(ind_LH,end),1)];
   RT_all_SH(:,2) = [tmp_ABD.mat_ABD(ind_SH,end)];
   RT_all_LH(:,2) = [tmp_ABD.mat_ABD(ind_LH,end)];

      
   [ind_SH]=find(tmp_AD.mat_AD(:,3)==6);
   [ind_LH]=find(tmp_AD.mat_AD(:,3)==11);
   RT_AD(i,:) = [mean(tmp_AD.mat_AD(ind_SH,end),1) mean(tmp_AD.mat_AD(ind_LH,end),1)];  
   RT_all_SH(:,3) = [tmp_AD.mat_AD(ind_SH,end)];
   RT_all_LH(:,3) = [tmp_AD.mat_AD(ind_LH,end)];

   
   [ind_SH]=find(tmp_BD.mat_BD(:,3)==6);
   [ind_LH]=find(tmp_BD.mat_BD(:,3)==11);
   RT_BD(i,:) = [mean(tmp_BD.mat_BD(ind_SH,end),1) mean(tmp_BD.mat_BD(ind_LH,end),1)];
   RT_all_SH(:,4) = [tmp_BD.mat_BD(ind_SH,end)];
   RT_all_LH(:,4) = [tmp_BD.mat_BD(ind_LH,end)];

   RT_all_m(i,:) = [mean(RT_all_SH(:)) mean(RT_all_LH(:))];
   
end

RT = [RT_AB RT_ABD RT_AD RT_BD RT_all_m];
RT_desc = {'AB_SH' 'AB_LH' 'ABD_SH' 'ABD_LH' 'AD_SH' 'AD_LH' 'BD_SH' 'BD_LH' 'All_SH' 'All_LH'};


