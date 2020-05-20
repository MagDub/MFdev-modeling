
close all ;

% Data from onlyincluded prior2normal
% 'D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_thompson_mod12_new.xlsx'

tmp = load('datathompsonmod12.mat');
data = tmp.datathompsonmod12;
clear tmp;

ID = data.ID(2:end);
age = data.age(2:end);

const_SH = data.ConsistenSH(2:end);
const_LH = data.ConsistenLH(2:end);

lm_SH = fitlm([age], const_SH);
lm_LH = fitlm([age], const_LH);

lm_SH_sq = fitlm([age.^2], const_SH);
lm_LH_sq = fitlm([age.^2], const_LH);

lm_SH_inv = fitlm([1./age], const_SH);
lm_LH_inv = fitlm([1./age], const_LH);

lm_SH_log = fitlm([log(age)], const_SH);
lm_LH_log = fitlm([log(age)], const_LH);

lm_SH_exp = fitlm([exp(age)], const_SH);
lm_LH_exp = fitlm([exp(age)], const_LH);

BIC_mat_SH = [...
    lm_SH.ModelCriterion.BIC...
    lm_SH_sq.ModelCriterion.BIC...
    lm_SH_inv.ModelCriterion.BIC...
    lm_SH_log.ModelCriterion.BIC...
    lm_SH_exp.ModelCriterion.BIC...
    ];

BIC_mat_LH = [...
    lm_LH.ModelCriterion.BIC...
    lm_LH_sq.ModelCriterion.BIC...
    lm_LH_inv.ModelCriterion.BIC...
    lm_LH_log.ModelCriterion.BIC...
    lm_LH_exp.ModelCriterion.BIC...
    ];

figure()

subplot(2,2,1)
plot(age,const_SH,'o'); hold on;
plot(age, lm_SH_exp.Coefficients.Estimate(1)+lm_SH_exp.Coefficients.Estimate(2)*age);
xlabel('Age');
ylabel('Consistency - Short horizon');

subplot(2,2,2)
plot(age,const_LH,'o'); hold on;
plot(age, lm_LH_exp.Coefficients.Estimate(1)+lm_LH_exp.Coefficients.Estimate(2)*age);
xlabel('Age');
ylabel('Consistency - Long horizon');

subplot(2,2,3)
bar(BIC_mat_SH); 
ylim([815 825])

subplot(2,2,4)
bar(BIC_mat_LH); 
ylim([815 825])
