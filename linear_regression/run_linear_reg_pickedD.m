
close all ;

% Data from onlyincluded prior2normal
% 'D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_thompson_mod12_new.xlsx'

tmp = load('datathompsonmod12.mat');
data = tmp.datathompsonmod12;
clear tmp;

tmp = load('dataquestionnaire.mat');
data_quest = tmp.dataquestionnaire;
clear tmp;

%%% demo

ID = data.ID(2:end);

age = data.age(2:end);

sex = data.sex_code(2:end);

pickedD_SH = data.all_D_short(2:end);
pickedD_LH = data.all_D_long(2:end);

IQ = data_quest.Wasi_IQ;
raw = data_quest.Wasi_Raw;
ADHD = data_quest.conners__adhd_tscore;

%%%

lm_SH_IQonly = fitlm([IQ], pickedD_SH);
lm_LH_IQonly = fitlm([IQ], pickedD_LH);

lm_SH_IQrawonly = fitlm([raw], pickedD_SH);
lm_LH_IQrawonly = fitlm([raw], pickedD_LH);

lm_SH = fitlm([age], pickedD_SH);
lm_LH = fitlm([age], pickedD_LH);

lm_SH_ADHD = fitlm([ADHD], pickedD_SH);
lm_LH_ADHD = fitlm([ADHD], pickedD_LH);

lm_SH_IQ = fitlm([age IQ], pickedD_SH);
lm_LH_IQ = fitlm([age IQ], pickedD_LH);

lm_SH_sq = fitlm([age.^2], pickedD_SH);
lm_LH_sq = fitlm([age.^2], pickedD_LH);

lm_SH_sq_sex = fitlm([age.^2 sex], pickedD_SH);
lm_LH_sq_sex = fitlm([age.^2 sex], pickedD_LH);

lm_SH_sq_IQ = fitlm([age.^2 IQ], pickedD_SH);
lm_LH_sq_IQ = fitlm([age.^2 IQ], pickedD_LH); % pickedD = b0 + b1*age^2 + b2*IQ

lm_SH_inv = fitlm([1./age], pickedD_SH);
lm_LH_inv = fitlm([1./age], pickedD_LH);

lm_SH_log = fitlm([log(age)], pickedD_SH);
lm_LH_log = fitlm([log(age)], pickedD_LH);

lm_SH_exp = fitlm([exp(age)], pickedD_SH);
lm_LH_exp = fitlm([exp(age)], pickedD_LH);

BIC_mat_SH = [...
    lm_SH_IQonly.ModelCriterion.BIC...
    lm_SH_IQrawonly.ModelCriterion.BIC...
    lm_SH.ModelCriterion.BIC...
    lm_SH_ADHD.ModelCriterion.BIC...
    lm_SH_IQ.ModelCriterion.BIC...
    lm_SH_sq.ModelCriterion.BIC...
    lm_SH_sq_sex.ModelCriterion.BIC...
    lm_SH_sq_IQ.ModelCriterion.BIC...
    lm_SH_inv.ModelCriterion.BIC...
    lm_SH_log.ModelCriterion.BIC...
    lm_SH_exp.ModelCriterion.BIC...
    ];

BIC_mat_LH = [...
    lm_LH_IQonly.ModelCriterion.BIC...
    lm_LH_IQrawonly.ModelCriterion.BIC...
    lm_LH.ModelCriterion.BIC...
    lm_LH_ADHD.ModelCriterion.BIC...
    lm_LH_IQ.ModelCriterion.BIC...
    lm_LH_sq.ModelCriterion.BIC...
    lm_LH_sq_sex.ModelCriterion.BIC...
    lm_LH_sq_IQ.ModelCriterion.BIC...
    lm_LH_inv.ModelCriterion.BIC...
    lm_LH_log.ModelCriterion.BIC...
    lm_LH_exp.ModelCriterion.BIC...
    ];

figure()

subplot(2,2,1)
plot(age,pickedD_SH,'o'); hold on;
plot(age, lm_SH_exp.Coefficients.Estimate(1)+lm_SH_exp.Coefficients.Estimate(2)*age);
xlabel('Age');
ylabel('Picked D - Short horizon');

subplot(2,2,2)
plot(age,pickedD_LH,'o'); hold on;
plot(age, lm_LH_exp.Coefficients.Estimate(1)+lm_LH_exp.Coefficients.Estimate(2)*age);
xlabel('Age');
ylabel('Picked D - Long horizon');

subplot(2,2,3)
bar(BIC_mat_SH); 
ylim([514 527])

subplot(2,2,4)
bar(BIC_mat_LH); 
ylim([514 527])
