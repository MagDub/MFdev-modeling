
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

todel = [find(ID==219)];

age = data.age(2:end);
age(todel) = [];

sex = data.sex_code(2:end);
sex(todel) = [];

pickedC_SH = data.all_C_short(2:end);
pickedC_SH(todel) = [];

pickedC_LH = data.all_C_long(2:end);
pickedC_LH(todel) = [];

IQ = data_quest.Wasi_IQ;
IQ(todel) = [];

raw = data_quest.Wasi_Raw;
raw(todel) = [];

ADHD = data_quest.conners__adhd_tscore;
ADHD(todel) = [];

obs_comp = data_quest.ocicv_total; % obsessive compulsory
obs_comp(todel) = [];

mfqc = data_quest.mfqc_total;
mfqc(todel) = [];

anxiety = data_quest.scareds_total; %anxiety
anxiety(todel) = [];

amicv = data_quest.amicv_total;
amicv(todel) = [];

%%%

lm_SH_IQ = fitlm([IQ], pickedC_SH);
lm_LH_IQ = fitlm([IQ], pickedC_LH);
lm_diff_IQ = fitlm([IQ], pickedC_LH-pickedC_SH);

lm_SH_raw = fitlm([raw], pickedC_SH);
lm_LH_raw = fitlm([raw], pickedC_LH);
lm_diff_raw = fitlm([raw], pickedC_LH-pickedC_SH);

lm_SH_age = fitlm([age], pickedC_SH);
lm_LH_age = fitlm([age], pickedC_LH);
lm_diff_age = fitlm([age], pickedC_LH-pickedC_SH);

lm_SH_exp = fitlm([exp(age)], pickedC_SH); % x=exp(age) ; y = pickedC ; pickedC = b0 + b1*exp(age)
lm_LH_exp = fitlm([exp(age)], pickedC_LH);
lm_diff_exp = fitlm([exp(age)], pickedC_LH-pickedC_SH);

labels_ = {'IQ', 'raw', 'age', 'exp(age)'};

%%%

BIC_mat_SH = [...
    lm_SH_IQ.ModelCriterion.BIC...
    lm_SH_raw.ModelCriterion.BIC...
    lm_SH_age.ModelCriterion.BIC...
    lm_SH_exp.ModelCriterion.BIC...
    ];

BIC_mat_LH = [...
    lm_LH_IQ.ModelCriterion.BIC...
    lm_LH_raw.ModelCriterion.BIC...
    lm_LH_age.ModelCriterion.BIC...
    lm_LH_exp.ModelCriterion.BIC...
    ];

BIC_mat_diff = [...
    lm_diff_IQ.ModelCriterion.BIC...
    lm_diff_raw.ModelCriterion.BIC...
    lm_diff_age.ModelCriterion.BIC...
    lm_diff_exp.ModelCriterion.BIC...
    ];

figure()

subplot(2,3,1)
plot(IQ, pickedC_SH,'o'); hold on;
plot(IQ, lm_SH_IQ.Coefficients.Estimate(1)+lm_SH_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Picked C - Short horizon');

subplot(2,3,2)
plot(age, pickedC_LH,'o'); hold on;
plot(age, lm_LH_exp.Coefficients.Estimate(1)+lm_LH_exp.Coefficients.Estimate(2)*exp(age));
xlabel('age');
ylabel('Picked C - Long horizon');

subplot(2,3,3)
plot(age, pickedC_LH-pickedC_SH,'o'); hold on;
plot(age, lm_diff_exp.Coefficients.Estimate(1)+lm_diff_exp.Coefficients.Estimate(2)*exp(age));
xlabel('age');
ylabel('Picked C - Difference');

bic_range = [580 680];

subplot(2,3,4)
bar(BIC_mat_SH); 
ylim([630 635])

xticklabels(labels_)
xtickangle(45)

subplot(2,3,5)
bar(BIC_mat_LH); 
ylim([650 660])

xticklabels(labels_)
xtickangle(45)

subplot(2,3,6)
bar(BIC_mat_diff); 
ylim([600 610])

xticklabels(labels_)
xtickangle(45)
