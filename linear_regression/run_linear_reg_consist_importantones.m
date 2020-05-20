
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

const_SH = data.ConsistenSH(2:end);
const_SH(todel) = [];

const_LH = data.ConsistenLH(2:end);
const_LH(todel) = [];

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

lm_SH_IQ = fitlm([IQ], const_SH);
lm_LH_IQ = fitlm([IQ], const_LH);
lm_diff_IQ = fitlm([IQ], const_LH-const_SH);

lm_SH_raw = fitlm([raw], const_SH);
lm_LH_raw = fitlm([raw], const_LH);
lm_diff_raw = fitlm([raw], const_LH-const_SH);

lm_SH_ADHD = fitlm([ADHD], const_SH); 
lm_LH_ADHD = fitlm([ADHD], const_LH); % x=adhd ; y = pickedD ; pickedD = b0 + b1*ADHD
lm_diff_ADHD = fitlm([ADHD], const_LH-const_SH);

lm_SH_exp = fitlm([exp(age)], const_SH);
lm_LH_exp = fitlm([exp(age)], const_LH);
lm_diff_exp = fitlm([exp(age)], const_LH-const_SH);

labels_ = {'IQ', 'raw', 'ADHD', 'exp(age)'};

%%%

BIC_mat_SH = [...
    lm_SH_IQ.ModelCriterion.BIC...
    lm_SH_raw.ModelCriterion.BIC...
    lm_SH_ADHD.ModelCriterion.BIC...
    lm_SH_exp.ModelCriterion.BIC...
    ];

BIC_mat_LH = [...
    lm_LH_IQ.ModelCriterion.BIC...
    lm_LH_raw.ModelCriterion.BIC...
    lm_LH_ADHD.ModelCriterion.BIC...
    lm_LH_exp.ModelCriterion.BIC...
    ];

BIC_mat_diff = [...
    lm_diff_IQ.ModelCriterion.BIC...
    lm_diff_raw.ModelCriterion.BIC...
    lm_diff_ADHD.ModelCriterion.BIC...
    lm_diff_exp.ModelCriterion.BIC...
    ];

figure()

subplot(2,3,1)
plot(IQ, const_SH,'o'); hold on;
plot(IQ, lm_SH_IQ.Coefficients.Estimate(1)+lm_SH_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Const - Short horizon');

subplot(2,3,2)
plot(IQ, const_LH,'o'); hold on;
plot(IQ, lm_LH_IQ.Coefficients.Estimate(1)+lm_LH_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Const - Long horizon');

subplot(2,3,3)
plot(IQ, const_LH-const_SH,'o'); hold on;
plot(IQ, lm_diff_IQ.Coefficients.Estimate(1)+lm_diff_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Const - Difference');

subplot(2,3,4)
bar(BIC_mat_SH); 
ylim([775 820])

xticklabels(labels_)
xtickangle(45)

subplot(2,3,5)
bar(BIC_mat_LH); 
ylim([775 820])

xticklabels(labels_)
xtickangle(45)

subplot(2,3,6)
bar(BIC_mat_diff); 
ylim([775 820])

xticklabels(labels_)
xtickangle(45)
