
close all ;

addpath('..')

iter_rand = 1%000;

% Data from onlyincluded prior2normal
% 'D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_thompson_mod12_new.xlsx'

tmp = load('datathompsonmod12_newB.mat');
data = tmp.datathompsonmod12_newB;
clear tmp;

tmp = load('dataquestionnaire.mat');
data_quest = tmp.dataquestionnaire;
clear tmp;

%%% demo

ID = data.ID(5:end);

todel = [find(ID==219)];

age = data.age(2:end);
age(todel) = [];

IQ = data_quest.Wasi_IQ;
IQ(todel) = [];

eta_SH = data.MAP_eta_short(2:end);
eta_SH(todel) = [];

eta_LH = data.MAP_eta_long(2:end);
eta_LH(todel) = [];

eta_diff = eta_LH - eta_SH;

conv_age = [];
emerg_age_mat = [];

i=1;

for age_i = 8:18
    tmp = asymptotic_emergent_age(age, age_i);
    conv_age(:,i) = tmp;
    lm_SH{i} = fitlm([conv_age(:,i)], eta_SH);
    lm_LH{i} = fitlm([conv_age(:,i)], eta_LH);
    lm_diff{i} = fitlm([conv_age(:,i)], eta_diff);
    i=i+1;
    emerg_age_mat(end+1) = (age_i); 
end




BIC_mat_SH = [];
BIC_mat_LH = [];
BIC_mat_diff = [];

for i = 1:size(lm_SH,2)
    BIC_mat_SH(end+1) = [lm_SH{i}.ModelCriterion.BIC];
    BIC_mat_LH(end+1) = [lm_LH{i}.ModelCriterion.BIC];
    BIC_mat_diff(end+1) = [lm_diff{i}.ModelCriterion.BIC];
end

%% CONTROL

control_age(:,1) = ones(size(conv_age,1),1);
control_age(:,2) = age;
control_age(:,3) = age.^2;
control_age(:,4) = IQ;
control_age(:,5:iter_rand+4) = rand(size(conv_age,1),iter_rand);

i=1;
for age_i = 1:size(control_age,2)
    lm_control_SH{i} = fitlm([control_age(:,i)], eta_SH);
    lm_control_LH{i} = fitlm([control_age(:,i)], eta_LH);
    lm_control_diff{i} = fitlm([control_age(:,i)], eta_diff);
    i=i+1;
end

tmp_BIC_mat_control_SH = [];
tmp_BIC_mat_control_LH = [];
tmp_BIC_mat_control_diff = [];

for i = 1:size(control_age,2)
    tmp_BIC_mat_control_SH(end+1) = [lm_control_SH{i}.ModelCriterion.BIC];
    tmp_BIC_mat_control_LH(end+1) = [lm_control_LH{i}.ModelCriterion.BIC];
    tmp_BIC_mat_control_diff(end+1) = [lm_control_diff{i}.ModelCriterion.BIC];
end

BIC_mat_control_SH = [tmp_BIC_mat_control_SH(1:4) mean(tmp_BIC_mat_control_SH(5:end))];
BIC_mat_control_LH = [tmp_BIC_mat_control_LH(1:4) mean(tmp_BIC_mat_control_LH(5:end))];
BIC_mat_control_diff = [tmp_BIC_mat_control_diff(1:4) mean(tmp_BIC_mat_control_diff(5:end))];


%%
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 30 20]);

subplot(2,3,1)
plot(age, eta_SH,'o'); hold on;
% plot(age, lm_SH{i}.Coefficients.Estimate(1)+lm_SH{i}.Coefficients.Estimate(2)*conv_age(:,10));
xlabel('age');
ylabel('eta - Short horizon')

subplot(2,3,2)
plot(age, eta_LH,'o'); hold on;
% plot(age, lm_LH{i}.Coefficients.Estimate(1)+lm_LH{i}.Coefficients.Estimate(2)*conv_age(:,3));
xlabel('age');
ylabel('eta - Long horizon')

subplot(2,3,3)
plot(age, eta_diff,'o'); hold on;
% plot(age, lm_diff{i}.Coefficients.Estimate(1)+lm_diff{i}.Coefficients.Estimate(2)*conv_age(:,4));
xlabel('age');
ylabel('eta - Diff')

subplot(2,3,4)
bar(BIC_mat_SH); hold on;
r_=bar([size(BIC_mat_SH,2)+1], BIC_mat_control_SH(1)); hold on;
s_=bar([size(BIC_mat_SH,2)+2], BIC_mat_control_SH(2)); hold on;
sq_=bar([size(BIC_mat_SH,2)+3], BIC_mat_control_SH(3)); hold on;
iq_=bar([size(BIC_mat_SH,2)+4], BIC_mat_control_SH(4)); hold on;
n_=bar([size(BIC_mat_SH,2)+5], BIC_mat_control_SH(5)); hold on;
h = errorbar(size(BIC_mat_SH,2)+5,BIC_mat_control_SH(5),std(tmp_BIC_mat_control_SH(5:end))./sqrt(iter_rand),'.','color','k');

[~, i] = min([BIC_mat_SH BIC_mat_control_SH]);
plot(i,round(min(min(BIC_mat_SH),min(BIC_mat_control_SH))-1), 'ko', 'MarkerSize',6)

legend([r_ s_ sq_ iq_ n_], {'all same', 'real age', 'squared age', 'IQ', 'random (iter=1000)'}); 
xticks(1:2:size(emerg_age_mat,2)); xticklabels([emerg_age_mat(1:2:size(emerg_age_mat,2))]);
ylim([round(min(min(BIC_mat_SH),min(BIC_mat_control_SH))-1) round(max(max(BIC_mat_SH),max(BIC_mat_control_SH))+1)])
xlabel('Emergent age')
ylabel('BIC score')


subplot(2,3,5)
bar(BIC_mat_LH); hold on;
r_=bar([size(BIC_mat_LH,2)+1], BIC_mat_control_LH(1)); hold on;
s_=bar([size(BIC_mat_LH,2)+2], BIC_mat_control_LH(2)); hold on;
sq_=bar([size(BIC_mat_LH,2)+3], BIC_mat_control_LH(3)); hold on;
iq_=bar([size(BIC_mat_LH,2)+4], BIC_mat_control_LH(4)); hold on;
n_=bar([size(BIC_mat_LH,2)+5], BIC_mat_control_LH(5)); hold on;
h = errorbar(size(BIC_mat_SH,2)+5,BIC_mat_control_LH(5),std(tmp_BIC_mat_control_LH(5:end))./sqrt(iter_rand),'.','color','k');

[~, i] = min([BIC_mat_LH BIC_mat_control_LH]);
plot(i,round(min(min(BIC_mat_LH),min(BIC_mat_control_LH))-1), 'ko', 'MarkerSize',6)

xticks(1:2:size(emerg_age_mat,2)); xticklabels([emerg_age_mat(1:2:size(emerg_age_mat,2))]);
ylim([round(min(min(BIC_mat_LH),min(BIC_mat_control_LH))-1) round(max(max(BIC_mat_LH),max(BIC_mat_control_LH))+1)])
xlabel('Emergent age')
ylabel('BIC score')



subplot(2,3,6)
bar(BIC_mat_diff); hold on; 
r_=bar([size(BIC_mat_diff,2)+1], BIC_mat_control_diff(1)); hold on;
s_=bar([size(BIC_mat_diff,2)+2], BIC_mat_control_diff(2)); hold on;
sq_=bar([size(BIC_mat_diff,2)+3], BIC_mat_control_diff(3)); hold on;
iq_=bar([size(BIC_mat_diff,2)+4], BIC_mat_control_diff(4)); hold on;
n_=bar([size(BIC_mat_diff,2)+5], BIC_mat_control_diff(5)); hold on;
h = errorbar(size(BIC_mat_diff,2)+5,BIC_mat_control_diff(5),std(tmp_BIC_mat_control_diff(5:end))./sqrt(iter_rand),'.','color','k');

[~, i] = min([BIC_mat_diff BIC_mat_control_diff]);
plot(i,round(min(min(BIC_mat_diff),min(BIC_mat_control_diff))-1), 'ko', 'MarkerSize',6)

xticks(1:2:size(emerg_age_mat,2)); xticklabels([emerg_age_mat(1:2:size(emerg_age_mat,2))]);
ylim([round(min(min(BIC_mat_diff),min(BIC_mat_control_diff))-1) round(max(max(BIC_mat_diff),max(BIC_mat_control_diff))+1)])
xlabel('Emergent age')
ylabel('BIC score')

%%
save('linear_models\eta\emergent_age_SH.mat', 'lm_SH')
save('linear_models\eta\emergent_age_LH.mat', 'lm_LH')
save('linear_models\eta\emergent_age_diff.mat', 'lm_diff')

lm_SH = [];
for i=1:4
    lm_SH{i}=lm_control_SH{i};
    lm_LH{i}=lm_control_LH{i};
    lm_diff{i}=lm_control_diff{i};
end

eta_demog_desc = {'Const Age', 'Age', 'Age Squared', 'IQ'};

save('linear_models\eta\demog_SH.mat', 'lm_SH')
save('linear_models\eta\demog_LH.mat', 'lm_LH')
save('linear_models\eta\demog_diff.mat', 'lm_diff')
save('linear_models\demog_desc.mat', 'eta_demog_desc')
%%

% out_dir = 'D:\MaggiesFarm\modeling_05_07_developmental\linear_regression\convergent_age\figs\';
% addpath('D:\writing\export_fig')
% export_fig([out_dir 'Fig_eta.tif'],'-nocrop','-r200')


