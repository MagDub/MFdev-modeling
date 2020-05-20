
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

pickedD_SH = data.all_D_short(2:end);
pickedD_LH = data.all_D_long(2:end);

lm_SH_inv = fitlm([const_SH pickedD_SH], 1./age);
lm_LH_inv = fitlm([const_LH pickedD_LH], 1./age);

lm_SH_log = fitlm([const_SH pickedD_SH], log(age));
lm_LH_log = fitlm([const_LH pickedD_LH], log(age));


BIC_mat_SH = [...
    lm_SH_inv.ModelCriterion.BIC...
    lm_SH_log.ModelCriterion.BIC...
    ];

BIC_mat_LH = [...
    lm_LH_inv.ModelCriterion.BIC...
    lm_LH_log.ModelCriterion.BIC...
    ];

figure()

subplot(2,2,1)
plot(age,const_SH,'o'); hold on;
plot(age, lm_SH_inv.Coefficients.Estimate(1) + lm_SH_inv.Coefficients.Estimate(2)*const_SH + lm_SH_inv.Coefficients.Estimate(2)*pickedD_SH);
xlabel('Age');
ylabel('Consistency - Short horizon');

subplot(2,2,2)
plot(age,const_LH,'o'); hold on;
plot(age, lm_LH_inv.Coefficients.Estimate(1) + lm_LH_inv.Coefficients.Estimate(2)*const_SH + lm_LH_inv.Coefficients.Estimate(2)*pickedD_LH);
xlabel('Age');
ylabel('Consistency - Long horizon');

subplot(2,2,3)
bar(BIC_mat_SH); 
ylim([-500 40])

subplot(2,2,4)
bar(BIC_mat_LH); 
ylim([-500 40])
