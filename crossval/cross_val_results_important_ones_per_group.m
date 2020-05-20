
model = 0;
mod = [];

tmp=load('D:\writing\MF_dev\data_for_figs\model_parameters.mat');
load('D:\writing\MF_dev\data_for_figs\part_num.mat')
participant_list=tmp.model_parameters(:,1)';

%% Models DEV K6

%%%%%%%%%%%%
% Thompson %
%%%%%%%%%%%%
% 9
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_9\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson2params1Hor';
mod.legend{model} = 'thompson';
%%%%%
% 10
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_10\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor';
mod.legend{model} = 'thompson+xi'; 
%%%%%
% 11
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_11\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.legend{model} = 'thompson+nov';
%%%%%
% 12
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_12\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor2novQ01';
mod.legend{model} = 'thompson+nov+xi';


%%%%%%%
% UCB %
%%%%%%%
% 5
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_5\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB';
%%%
% 6
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_6\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB+nov';
%%%%
% 7
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_7\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB3params2Hor';
mod.legend{model} = 'UCB+xi';
%%%%
% 8
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_8\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCBnoveltybonus3params2Hor2nov';
mod.legend{model} = 'UCB+nov+xi'; 

%%%%%%%%%%
% HYBRID %
%%%%%%%%%%
% 1
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_1\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid4params2Hor1w';
mod.legend{model} = 'hybrid'; 
%%%%%%
% 2
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_2\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid5params2Hor1w';
mod.legend{model} = 'hybrid+xi';
%%%%%
% 3
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_3\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4params2Hor1w';
mod.legend{model} = 'hybrid+nov'; 
%%%%%
% 4
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\cv_k6\mod_4\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4paramsxi2Hor2nov';
mod.legend{model} = 'hybrid+nov+xi'; 







%% Plotting  

for model = 1:size(mod.file_name,2)
    
    dirData = dir(strcat(mod.file_name{model},'*.mat'));
    
    tmp_part = [];
    
    for i = 1:size(dirData,1)
        tmp_part(end+1) = str2num(dirData(i).name(end-6:end-4));
    end
        
    mod.participant_list{model} = tmp_part;
    mod.number_par{model} = size(tmp_part,2);
    
    average_prob_mat = [];
    
    for ID_ind = 1:size(tmp_part,2)
        ID = tmp_part(ID_ind);
        load(strcat(mod.file_name{model}, mod.model_type{model},'_',int2str(ID),'.mat'));
        average_prob_mat(end+1,:) = average_prob;
    end
    
        
    mean_av_prob = nanmean(average_prob_mat,2); 
    
    
    mean_av_prob_group1 = mean_av_prob(find(tmp_part<200));
    mean_av_prob_group2 = mean_av_prob(find(tmp_part>=200 & tmp_part<300));
    mean_av_prob_group3 = mean_av_prob(find(tmp_part>=300));
    
    mod.mean_pp{model} = mean_av_prob;
    
    mod.mean_pp_g1{model} = mean_av_prob_group1;
    mod.mean_pp_g2{model} = mean_av_prob_group2;
    mod.mean_pp_g3{model} = mean_av_prob_group3;
        
    mod.ID{model} = tmp_part;
    
    mod.mean_all{model} = nanmean(mean_av_prob);
    
    mod.stderror_all{model} = nanstd(mean_av_prob) / sqrt(mod.number_par{model});
    
    mod.mean_all_g1{model} = nanmean(mean_av_prob_group1);
    mod.mean_all_g2{model} = nanmean(mean_av_prob_group2);
    mod.mean_all_g3{model} = nanmean(mean_av_prob_group3);
    
    mod.num_part_g1{model} = size(mean_av_prob_group1,1);
    mod.num_part_g2{model} = size(mean_av_prob_group2,1);
    mod.num_part_g3{model} = size(mean_av_prob_group3,1);
    
    mod.stderror_all{model} = nanstd(mean_av_prob) / sqrt(mod.number_par{model});
    
    mod.stderror_all_g1{model} = nanstd(mean_av_prob_group1) / sqrt(mod.num_part_g1{model});
    mod.stderror_all_g2{model} = nanstd(mean_av_prob_group2) / sqrt(mod.num_part_g2{model});
    mod.stderror_all_g3{model} = nanstd(mean_av_prob_group3) / sqrt(mod.num_part_g3{model});
        
    clear mean_av_prob
end

size(mean_av_prob_group1,1);
size(mean_av_prob_group2,1);
size(mean_av_prob_group3,1);

figure()

%% Group 1

subplot(2,2,1)

mean_all = [];
stderror_all = [];
legend_all = [];
number_par_all = [];

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all_g1{model};
   stderror_all(model) = mod.stderror_all_g1{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = mod.num_part_g1{model};
end

x = [1:4 6:9 11:14];

I = 1:1:size(mean_all,2); 

bar(x,mean_all(I))     ;           

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('Group 1 - 6-fold crossvalidation')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.36 0.5];
ylim(yrange);
xticks(x)
xticklabels(legend_all(I));
xtickangle(45)

for i1=1:numel(mean_all)
    text(x(i1),yrange(1)+0.01,num2str(number_par_all(I(i1))),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom')
   text(x(i1),yrange(1)+0.025,'n = ',...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom')
end

hold off

%% Group 2

subplot(2,2,2)

mean_all = [];
stderror_all = [];
legend_all = [];
number_par_all = [];

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all_g2{model};
   stderror_all(model) = mod.stderror_all_g2{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = mod.num_part_g2{model};
end

x = [1:4 6:9 11:14];

I = 1:1:size(mean_all,2); 

bar(x,mean_all(I)) ;               

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('Group 2 - 6-fold crossvalidation')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.36 0.5];
ylim(yrange);
xticks(x)
xticklabels(legend_all(I));
xtickangle(45)

for i1=1:numel(mean_all)
    text(x(i1),yrange(1)+0.01,num2str(number_par_all(I(i1))),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom')
   text(x(i1),yrange(1)+0.025,'n = ',...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom')
end

hold off

%% Group 3

subplot(2,2,3)

mean_all = [];
stderror_all = [];
legend_all = [];
number_par_all = [];

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all_g3{model};
   stderror_all(model) = mod.stderror_all_g3{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = mod.num_part_g3{model};
end

x = [1:4 6:9 11:14];

I = 1:1:size(mean_all,2); 

bar(x,mean_all(I));                

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('Group 3 - 6-fold crossvalidation')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.36 0.5];
ylim(yrange)
xticks(x)
xticklabels(legend_all(I)); 
xtickangle(45)

for i1=1:numel(mean_all)
    text(x(i1),yrange(1)+0.01,num2str(number_par_all(I(i1))),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom')
   text(x(i1),yrange(1)+0.025,'n = ',...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom')
end

hold off

% save('D:\writing\MF_dev\data_for_figs\model_selection_greedy_pergroup.mat', 'mod')
