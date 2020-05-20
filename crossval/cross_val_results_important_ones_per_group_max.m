
model = 0;
mod = [];


%% Models DEV K6

%%%%%%%%%%%%%%
% Heuristics %
%%%%%%%%%%%%%%
% 13
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_heuristics\1params\results\aver_prob_';
mod.model_type{model} = 'heuristics';
mod.legend{model} = 'heuristics';
%%%%%
% 14
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_heuristics\2params_xi\results\aver_prob_';
mod.model_type{model} = 'heuristics';
mod.legend{model} = 'heuristics+xi'; 
%%%%%
% 15
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_heuristics\2params_eta\results\aver_prob_';
mod.model_type{model} = 'heuristics';
mod.legend{model} = 'heuristics+nov';
%%%%
% 16
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_heuristics\2params_eta_xi\results\aver_prob_';
mod.model_type{model} = 'heuristics';
mod.legend{model} = 'heuristics+nov+xi';


%%%%%%%%%%%%
% Thompson %
%%%%%%%%%%%%
% 9
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_thompson\2params_1Hor\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson2params1Hor';
mod.legend{model} = 'thompson';
%%%%%
% 10
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_thompson\3params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor';
mod.legend{model} = 'thompson+xi'; 
%%%%%
% 11
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_thompson_noveltybonus_2nov\2params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.legend{model} = 'thompson+nov';
%%%%%
% 12
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_thompson_noveltybonus_2nov\3params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor2novQ01';
mod.legend{model} = 'thompson+nov+xi';

%%%%%%%
% UCB %
%%%%%%%
% 5
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_UCB\2params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB';
%%%
% 6
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_UCB\2params_2Hor_2nov\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB+nov';
%%%%
% 7
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_UCB\3params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB3params2Hor';
mod.legend{model} = 'UCB+xi';
%%%%
% 8
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_UCB_noveltybonus_2nov\3params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCBnoveltybonus3params2Hor2nov';
mod.legend{model} = 'UCB+nov+xi'; 


%%%%%%%%%%
% HYBRID %
%%%%%%%%%%
% 1
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_hybrid\4params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid4params2Hor1w';
mod.legend{model} = strcat('--- DEV K=6 ---', 32,32,' hybrid'); 
%%%%%%
% 2
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_hybrid\5params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid5params2Hor1w';
mod.legend{model} = 'hybrid+xi';
%%%%%
% 3
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_hybrid_noveltybonus_both\4params_2Hor_1w_2eta\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4params2Hor1w';
mod.legend{model} = 'hybrid+nov'; 
%%%%%
% 4
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_hybrid_noveltybonus_both_2nov\5params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4paramsxi2Hor2nov';
mod.legend{model} = 'hybrid+nov+xi'; 



%%%%%%%
% Max %
%%%%%%%
% 13
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_max\1params\results\aver_prob_';
mod.model_type{model} = 'max';
mod.legend{model} = 'max';
% 13
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_max\1params_xi\results\aver_prob_';
mod.model_type{model} = 'max';
mod.legend{model} = 'max+xi';
% 13
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_max\1params_eta\results\aver_prob_';
mod.model_type{model} = 'max';
mod.legend{model} = 'max+nov';
% 13
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k6\crossval_max\1params_eta_xi\results\aver_prob_';
mod.model_type{model} = 'max';
mod.legend{model} = 'max+xi+nov';




%% Plotting  

for model = 1:size(mod.file_name,2)
    
    dirData = dir(strcat(mod.file_name{model},'*.mat'));
    mod.number_par{model} = size(dirData,1);
    disp(strcat('participants for model', 32, int2str(model), 32,mod.legend{model}, 32, '=', 32, int2str(mod.number_par{model})))
    
    participant_list = [];
    
    for i=1:size(dirData,1)
        if strcmp(mod.model_type{model},'thompson')
            participant_list(end+1) = str2num(dirData(i).name(20:22));
        elseif strcmp(mod.model_type{model},'UCB') || strcmp(mod.model_type{model},'max')
            participant_list(end+1) = str2num(dirData(i).name(15:17));
        elseif strcmp(mod.model_type{model},'hybrid')
            participant_list(end+1) = str2num(dirData(i).name(18:20));
        elseif strcmp(mod.model_type{model},'heuristics')
            participant_list(end+1) = str2num(dirData(i).name(22:24));
        end
    end
    
    mod.participant_list{model} = participant_list;
    
    average_prob_mat = [];
    ID_mat = [];
    
    for ID_ind = 1:size(participant_list,2)
        ID = participant_list(ID_ind);
        if ID<800
            load(strcat(mod.file_name{model}, mod.model_type{model},'_',int2str(ID),'.mat'));
            ID_mat(end+1,:) = ID;
            average_prob_mat(end+1,:) = average_prob;
        end
    end
    
        
    mean_av_prob = nanmean(average_prob_mat,2); 

    
    mean_av_prob_group1 = mean_av_prob(find(ID_mat<200));
    mean_av_prob_group2 = mean_av_prob([find(ID_mat==201):(find(ID_mat==301)-1)]);
    mean_av_prob_group3 = mean_av_prob([find(ID_mat==301):size(ID_mat,1)]);
    
    mod.mean_pp{model} = mean_av_prob;
    
    mod.mean_pp_g1{model} = mean_av_prob_group1;
    mod.mean_pp_g2{model} = mean_av_prob_group2;
    mod.mean_pp_g3{model} = mean_av_prob_group3;
    
    mod.ID{model} = ID_mat;
    
    mod.mean_all{model} = nanmean(mean_av_prob);
    
    mod.stderror_all{model} = nanstd(mean_av_prob) / sqrt(mod.number_par{model});
    
    mod.mean_all_g1{model} = nanmean(mean_av_prob_group1);
    mod.mean_all_g2{model} = nanmean(mean_av_prob_group2);
    mod.mean_all_g3{model} = nanmean(mean_av_prob_group3);
    
    mod.stderror_all{model} = nanstd(mean_av_prob) / sqrt(mod.number_par{model});
    
    mod.stderror_all_g1{model} = nanstd(mean_av_prob_group1) / sqrt(size(mean_av_prob_group1,1));
    mod.stderror_all_g2{model} = nanstd(mean_av_prob_group2) / sqrt(size(mean_av_prob_group2,1));
    mod.stderror_all_g3{model} = nanstd(mean_av_prob_group3) / sqrt(size(mean_av_prob_group3,1));
        
    clear mean_av_prob
end

size(mean_av_prob_group1,1)
size(mean_av_prob_group2,1)
size(mean_av_prob_group3,1)

figure()

%% Group 1

subplot(1,3,1)

mean_all = [];
stderror_all = [];
legend_all = [];
number_par_all = [];

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all_g1{model};
   stderror_all(model) = mod.stderror_all_g1{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = size(mean_av_prob_group1,1);
end

x = [1:4 6:9 11:14 16:19 21:24];

I = 1:1:size(mean_all,2); 

bar(x,mean_all(I))     ;           

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('Group 1 - 6-fold crossvalidation')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.33 0.5];
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

subplot(1,3,2)

mean_all = [];
stderror_all = [];
legend_all = [];
number_par_all = [];

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all_g2{model};
   stderror_all(model) = mod.stderror_all_g2{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = size(mean_av_prob_group2,1);
end

x = [1:4 6:9 11:14 16:19 21:24];

I = 1:1:size(mean_all,2); 

bar(x,mean_all(I)) ;               

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('Group 2 - 6-fold crossvalidation')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.33 0.5];
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

subplot(1,3,3)

mean_all = [];
stderror_all = [];
legend_all = [];
number_par_all = [];

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all_g3{model};
   stderror_all(model) = mod.stderror_all_g3{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = size(mean_av_prob_group3,1);
end

x = [1:4 6:9 11:14 16:19 21:24];

I = 1:1:size(mean_all,2); 

bar(x,mean_all(I));                

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('Group 3 - 6-fold crossvalidation')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.33 0.5];
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

save('D:\writing\MF_dev\data_for_figs\model_selection_greedy_pergroup.mat', 'mod')
