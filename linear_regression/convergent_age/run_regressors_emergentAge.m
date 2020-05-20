
em_age_mat = 8:18;

em_age = 2;

consist_SH = load('linear_models\consist\demog_SH.mat');
eta_SH = load('linear_models\eta\demog_SH.mat');
firstApp_SH = load('linear_models\firstApp\demog_SH.mat');
highValue_SH = load('linear_models\highValue\demog_SH.mat');
pickedC_SH = load('linear_models\pickedC\demog_SH.mat');
pickedD_SH = load('linear_models\pickedD\demog_SH.mat');
score_SH = load('linear_models\score\demog_SH.mat');
sgm0_SH = load('linear_models\sgm0\demog_SH.mat');
xi_SH = load('linear_models\xi\demog_SH.mat');

consist_LH = load('linear_models\consist\demog_LH.mat');
eta_LH = load('linear_models\eta\demog_LH.mat');
firstApp_LH = load('linear_models\firstApp\demog_LH.mat');
highValue_LH = load('linear_models\highValue\demog_LH.mat');
pickedC_LH = load('linear_models\pickedC\demog_LH.mat');
pickedD_LH = load('linear_models\pickedD\demog_LH.mat');
score_LH = load('linear_models\score\demog_LH.mat');
sgm0_LH = load('linear_models\sgm0\demog_LH.mat');
xi_LH = load('linear_models\xi\demog_LH.mat');

consist_diff = load('linear_models\consist\demog_diff.mat');
eta_diff = load('linear_models\eta\demog_diff.mat');
firstApp_diff = load('linear_models\firstApp\demog_diff.mat');
highValue_diff = load('linear_models\highValue\demog_diff.mat');
pickedC_diff = load('linear_models\pickedC\demog_diff.mat');
pickedD_diff = load('linear_models\pickedD\demog_diff.mat');
score_diff = load('linear_models\score\demog_diff.mat');
sgm0_diff = load('linear_models\sgm0\demog_diff.mat');
xi_diff = load('linear_models\xi\demog_diff.mat');

data_param = {'consist', 'eta', '1stApp', 'highValue', 'Tree C', 'Tree D', 'score', 'sgm0', 'xi'};

% Age Squared SH
AgeSqu_beta_SH = [];
AgeSqu_beta_SH(:,end+1) = consist_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = eta_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = firstApp_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = highValue_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = pickedC_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = pickedD_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = sgm0_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = score_SH.lm_SH{em_age}.Coefficients.Estimate';
AgeSqu_beta_SH(:,end+1) = xi_SH.lm_SH{em_age}.Coefficients.Estimate';

% Age Squared LH
AgeSqu_beta_LH = [];
AgeSqu_beta_LH(:,end+1) = consist_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = eta_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = firstApp_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = highValue_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = pickedC_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = pickedD_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = sgm0_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = score_LH.lm_LH{em_age}.Coefficients.Estimate';
AgeSqu_beta_LH(:,end+1) = xi_LH.lm_LH{em_age}.Coefficients.Estimate';

% Age Squared diff
AgeSqu_beta_diff = [];
AgeSqu_beta_diff(:,end+1) = consist_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = eta_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = firstApp_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = highValue_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = pickedC_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = pickedD_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = sgm0_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = score_diff.lm_diff{em_age}.Coefficients.Estimate';
AgeSqu_beta_diff(:,end+1) = xi_diff.lm_diff{em_age}.Coefficients.Estimate';

%%
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 30 20]);

subplot(1,3,1)
plot(1:size(AgeSqu_beta_SH(2,:),2),AgeSqu_beta_SH(2,:), 'o'); hold on;
plot(0:size(AgeSqu_beta_LH(2,:),2)+1, ones(1,size(AgeSqu_beta_LH(2,:),2)+2)*0)
xticks([1:size(AgeSqu_beta_LH(2,:),2)+1])
xticklabels([data_param])
ylabel('\beta_2 of linear model')
xlim([0 size(AgeSqu_beta_LH(2,:),2)+1])
ylim([-1.5 1.5])
title('SH')

xtickangle(45)

subplot(1,3,2)
plot(1:size(AgeSqu_beta_LH(2,:),2),AgeSqu_beta_LH(2,:), 'o'); hold on;
plot(0:size(AgeSqu_beta_LH(2,:),2)+1, ones(1,size(AgeSqu_beta_LH(2,:),2)+2)*0)
xticks([1:size(AgeSqu_beta_LH(2,:),2)+1])
xticklabels([data_param])
ylabel('\beta_2 of linear model')
xlim([0 size(AgeSqu_beta_LH(2,:),2)+1])
ylim([-1.5 1.5])
title('LH')

xtickangle(45)

subplot(1,3,3)
plot(1:size(AgeSqu_beta_diff(2,:),2),AgeSqu_beta_diff(2,:), 'o'); hold on;
plot(0:size(AgeSqu_beta_LH(2,:),2)+1, ones(1,size(AgeSqu_beta_LH(2,:),2)+2)*0)
xticks([1:size(AgeSqu_beta_LH(2,:),2)+1])
xticklabels([data_param])
ylabel('\beta_2 of linear model')
xlim([0 size(AgeSqu_beta_LH(2,:),2)+1])
ylim([-1.5 1.5])
title('diff')

xtickangle(45)




