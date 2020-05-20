
model = 0;
mod = [];

%% Models DEV 4

%%%%%%%%%%
% HYBRID %
%%%%%%%%%%
% 1
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_hybrid\4params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid4params2Hor1w';
mod.legend{model} = strcat('--- DEV K=4 ---', 32,32,' hybrid'); 
%%%%%%
% 2
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_hybrid\5params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid5params2Hor1w';
mod.legend{model} = 'hybrid+xi';
%%%%%
% 3
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_hybrid_noveltybonus_both\4params_2Hor_1w_2eta\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4params2Hor1w';
mod.legend{model} = 'hybrid+nov'; 
%%%%%
% 4
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_hybrid_noveltybonus_both_2nov\5params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4paramsxi2Hor2nov';
mod.legend{model} = 'hybrid+nov+xi'; 

%%%%%%%
% UCB %
%%%%%%%
% 5
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_UCB\2params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB';
%%%
% 6
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_UCB\2params_2Hor_2nov\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB+nov';
%%%%
% 7
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_UCB\3params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB3params2Hor';
mod.legend{model} = 'UCB+xi';
%%%%
% 8
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_UCB_noveltybonus_2nov\3params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCBnoveltybonus3params2Hor2nov';
mod.legend{model} = 'UCB+nov+xi'; 

% %%%%%%%%%%%%
% % Thompson %
% %%%%%%%%%%%%
% 9
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_thompson\2params_1Hor\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson2params1Hor';
mod.legend{model} = 'thompson';
%%%%%
% 10
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_thompson\3params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor';
mod.legend{model} = 'thompson+xi'; 
%%%%%
% 11
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_thompson_noveltybonus_2nov\2params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.legend{model} = 'thompson+nov';
%%%%%
% 12
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_05_07_developmental\participant_data\k4\crossval_thompson_noveltybonus_2nov\3params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor2novQ01';
mod.legend{model} = 'thompson+nov+xi';

%% Models DEV K6

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

% %%%%%%%%%%%%
% % Thompson %
% %%%%%%%%%%%%
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



%% Models NADA
%%%%%%%%%%
% HYBRID %
%%%%%%%%%%
% 1
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_hybrid\4params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid4params2Hor1w';
mod.legend{model} = strcat('---- NADA ----', 32,32,32,' hybrid'); 
%%%%%%
% 2
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_hybrid\5params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybrid5params2Hor1w';
mod.legend{model} = 'hybrid+xi';
%%%%%
% 3
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_hybrid_noveltybonus_both\4params_2Hor_1w_2eta\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4params2Hor1w';
mod.legend{model} = 'hybrid+nov'; 
%%%%%
% 4
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_hybrid_noveltybonus_both_2nov\5params_2Hor_1w\results\aver_prob_';
mod.model_type{model} = 'hybrid';
mod.name{model} = 'hybridnovboth4paramsxi2Hor2nov';
mod.legend{model} = 'hybrid+nov+xi'; 

%%%%%%%
% UCB %
%%%%%%%
% 5
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_UCB\2params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB';
%%%
% 6
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_UCB\2params_2Hor_2nov\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB2params2Hor';
mod.legend{model} = 'UCB+nov';
%%%%
% 7
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_UCB\3params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCB3params2Hor';
mod.legend{model} = 'UCB+xi';
%%%%
% 8
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_UCB_noveltybonus_2nov\3params_2Hor\results\aver_prob_';
mod.model_type{model} = 'UCB';
mod.name{model} = 'UCBnoveltybonus3params2Hor2nov';
mod.legend{model} = 'UCB+nov+xi'; 

% %%%%%%%%%%%%
% % Thompson %
% %%%%%%%%%%%%
% 9
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_thompson\2params_1Hor\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson2params1Hor';
mod.legend{model} = 'thompson';
%%%%%
% 10
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_thompson\3params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor';
mod.legend{model} = 'thompson+xi'; 
%%%%%
% 11
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_thompson_noveltybonus_2nov\2params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor2novQ01';
mod.legend{model} = 'thompson+nov';
%%%%%
% 12
model = model+1;
mod.file_name{model} = 'D:\MaggiesFarm\modeling_28_02\participant_data\crossval_thompson_noveltybonus_2nov\3params_2Hor_Q01\results\aver_prob_';
mod.model_type{model} = 'thompson';
mod.name{model} = 'thompson3params2Hor2novQ01';
mod.legend{model} = 'thompson+nov+xi';


%% Plotting  

average_prob_mat = [];

for model = 1:size(mod.file_name,2)
    
    dirData = dir(strcat(mod.file_name{model},'*.mat'));
    mod.number_par{model} = size(dirData,1);
    disp(strcat('participants for model', 32, int2str(model), '(',mod.name{model},'),', 32,mod.legend{model}, 32, '=', 32, int2str(mod.number_par{model})))
    
    participant_list = [];
    
    for i=1:size(dirData,1)
        if strcmp(mod.model_type{model},'thompson')
            participant_list(end+1) = str2num(dirData(i).name(20:22));
        elseif strcmp(mod.model_type{model},'UCB')
            participant_list(end+1) = str2num(dirData(i).name(15:17));
        elseif strcmp(mod.model_type{model},'hybrid')
            participant_list(end+1) = str2num(dirData(i).name(18:20));
        end
    end
    
    mod.participant_list{model} = participant_list;
    
    average_prob_mat = [];
    
    for ID_ind = 1:size(participant_list,2)
        ID = participant_list(ID_ind);
        load(strcat(mod.file_name{model}, mod.model_type{model},'_',int2str(ID),'.mat'));
        average_prob_mat(end+1,:) = average_prob;
    end
        
    mean_av_prob = nanmean(average_prob_mat,2); 
    
    mod.mean_pp{model} = mean_av_prob;
    mod.mean_all{model} = nanmean(mean_av_prob);
    mod.stderror_all{model} = nanstd(mean_av_prob) / sqrt(mod.number_par{model});
    
    clear mean_av_prob
end

for model = 1:size(mod.file_name,2)
   mean_all(model) = mod.mean_all{model};
   stderror_all(model) = mod.stderror_all{model};
   legend_all{model} = mod.legend{model};
   number_par_all(model) = mod.number_par{model};
end

figure()

% x = 1:size(mean_all,2);

x = [1:4 6:9 11:14 18:21 23:26 28:31 35:38 40:43 45:48];

% [~,I] = sort(mean_all);
I = 1:1:size(mean_all,2); 

bar(x,mean_all(I))                

hold on

er = errorbar(x,mean_all(I),stderror_all(I),stderror_all(I));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
title('4-fold, 6-fold and 10-fold crossvalidation performance per model')
ylabel('Average perforamnce accuracy [%]')
yrange = [0.3 0.57];
ylim(yrange)
%xticks(1:numel(mean_all))
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


% %% Individual model selection
% for model = 1:size(mod.mean_pp,2)
%     all_models(model,:) = mod.mean_pp{model}';
% end
% 
% [highest_acc_pp,best_model_ind_pp] = max(all_models(I,:),[],1);
% figure()
% hist(best_model_ind_pp,size(mod.mean_pp,2))
% xlim([1 numel(mean_all)])
% x_ax = 1:numel(mean_all);
% % xticks(x_ax);
% % xticklabels(legend_all(I));
% % xtickangle(45)
