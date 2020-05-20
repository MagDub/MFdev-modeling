
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

xi_SH = data.MAP_xi_short(2:end);
xi_SH(todel) = [];

xi_LH = data.MAP_xi_long(2:end);
xi_LH(todel) = [];

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

lm_SH_IQ = fitlm([IQ], xi_SH);
lm_LH_IQ = fitlm([IQ], xi_LH);
lm_diff_IQ = fitlm([IQ], xi_LH-xi_SH);

lm_SH_raw = fitlm([raw], xi_SH);
lm_LH_raw = fitlm([raw], xi_LH);
lm_diff_raw = fitlm([raw], xi_LH-xi_SH);

lm_SH_ADHD = fitlm([ADHD], xi_SH); 
lm_LH_ADHD = fitlm([ADHD], xi_LH); % x=adhd ; y = pickedD ; pickedD = b0 + b1*ADHD
lm_diff_ADHD = fitlm([ADHD], xi_LH-xi_SH);

lm_SH_exp = fitlm([exp(age)], xi_SH);
lm_LH_exp = fitlm([exp(age)], xi_LH);
lm_diff_exp = fitlm([exp(age)], xi_LH-xi_SH);

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
plot(IQ, xi_SH,'o'); hold on;
plot(IQ, lm_SH_IQ.Coefficients.Estimate(1)+lm_SH_IQ.Coefficients.Estimate(2)*IQ);
xlabel('IQ');
ylabel('Xi - Short horizon');

subplot(2,3,2)
plot(ADHD, xi_LH,'o'); hold on;
plot(ADHD, lm_LH_ADHD.Coefficients.Estimate(1)+lm_LH_ADHD.Coefficients.Estimate(2)*ADHD);
xlabel('ADHD');
ylabel('Xi - Long horizon');

subplot(2,3,3)
plot(ADHD, xi_LH-xi_SH,'o'); hold on;
plot(ADHD, lm_diff_ADHD.Coefficients.Estimate(1)+lm_diff_ADHD.Coefficients.Estimate(2)*ADHD);
xlabel('ADHD');
ylabel('Xi - Difference');

bic_range = [-50 10];

subplot(2,3,4)
bar(BIC_mat_SH); 
ylim(bic_range)

xticklabels(labels_)
xtickangle(45)

subplot(2,3,5)
bar(BIC_mat_LH); 
ylim(bic_range)

xticklabels(labels_)
xtickangle(45)

subplot(2,3,6)
bar(BIC_mat_diff); 
ylim(bic_range)

xticklabels(labels_)
xtickangle(45)
