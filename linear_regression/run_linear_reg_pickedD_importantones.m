
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

conv_age = asymptotic_emergent_age(age, 14);

sex = data.sex_code(2:end);
sex(todel) = [];

pickedD_SH = data.all_D_short(2:end);
pickedD_SH(todel) = [];

pickedD_LH = data.all_D_long(2:end);
pickedD_LH(todel) = [];

IQ = data_quest.Wasi_IQ;
IQ(todel) = [];

raw = data_quest.Wasi_Raw;
raw(todel) = [];

ADHD = data_quest.conners__adhd_tscore;
ADHD(todel) = [];

obs_comp = data_quest.ocicv_total; % obsessive compulsory
mfqc = data_quest.mfqc_total;
anxiety = data_quest.scareds_total; %anxiety
amicv = data_quest.amicv_total;

%%%

lm_SH_IQ = fitlm([IQ], pickedD_SH);
lm_LH_IQ = fitlm([IQ], pickedD_LH);
lm_diff_IQ = fitlm([IQ], pickedD_LH-pickedD_SH);

lm_SH_raw = fitlm([raw], pickedD_SH);
lm_LH_raw = fitlm([raw], pickedD_LH);
lm_diff_raw = fitlm([raw], pickedD_LH-pickedD_SH);

lm_SH_ADHD = fitlm([ADHD], pickedD_SH); 
lm_LH_ADHD = fitlm([ADHD], pickedD_LH); % x=adhd ; y = pickedD ; pickedD = b0 + b1*ADHD
lm_diff_ADHD = fitlm([ADHD], pickedD_LH-pickedD_SH);

lm_SH_exp = fitlm([exp(age)], pickedD_SH);
lm_LH_exp = fitlm([exp(age)], pickedD_LH);
lm_diff_exp = fitlm([exp(age)], pickedD_LH-pickedD_SH);

lm_SH_cage = fitlm([conv_age], pickedD_SH);
lm_LH_cage = fitlm([conv_age], pickedD_LH);
lm_diff_cage = fitlm([conv_age], pickedD_LH-pickedD_SH);

labels_ = {'IQ', 'raw', 'ADHD', 'exp(age)', 'convage'};

%%%

BIC_mat_SH = [...
    lm_SH_IQ.ModelCriterion.BIC...
    lm_SH_raw.ModelCriterion.BIC...
    lm_SH_ADHD.ModelCriterion.BIC...
    lm_SH_exp.ModelCriterion.BIC...
    lm_SH_cage.ModelCriterion.BIC...
    ];

BIC_mat_LH = [...
    lm_LH_IQ.ModelCriterion.BIC...
    lm_LH_raw.ModelCriterion.BIC...
    lm_LH_ADHD.ModelCriterion.BIC...
    lm_LH_exp.ModelCriterion.BIC...
    lm_LH_cage.ModelCriterion.BIC...
    ];

BIC_mat_diff = [...
    lm_diff_IQ.ModelCriterion.BIC...
    lm_diff_raw.ModelCriterion.BIC...
    lm_diff_ADHD.ModelCriterion.BIC...
    lm_diff_exp.ModelCriterion.BIC...
    lm_diff_cage.ModelCriterion.BIC...
    ];

figure()

subplot(2,3,1)
plot(IQ, pickedD_SH,'o'); hold on;
plot(IQ, lm_SH_IQ.Coefficients.Estimate(1)+lm_SH_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Picked D - Short horizon');

subplot(2,3,2)
plot(IQ, pickedD_LH,'o'); hold on;
plot(IQ, lm_LH_IQ.Coefficients.Estimate(1)+lm_LH_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Picked D - Long horizon');

subplot(2,3,3)
plot(IQ, pickedD_LH-pickedD_SH,'o'); hold on;
plot(IQ, lm_diff_IQ.Coefficients.Estimate(1)+lm_diff_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Picked D - Difference');

subplot(2,3,4)
bar(BIC_mat_SH); 
ylim([495 515])

xticklabels(labels_)
xtickangle(45)

subplot(2,3,5)
bar(BIC_mat_LH); 
ylim([495 515])

xticklabels(labels_)
xtickangle(45)

subplot(2,3,6)
bar(BIC_mat_diff); 
ylim([495 497])

xticklabels(labels_)
xtickangle(45)
