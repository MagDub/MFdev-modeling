

[num,txt,raw] = xlsread('D:\MaggiesFarm\2019_04_17_MF_dev_explore\excels\data_thompson_mod12_best');

ID=cell2mat(raw(2:end-3,1));
age=cell2mat(raw(2:end-3,2));
sgm0_SH=cell2mat(raw(2:end-3,8));
sgm0_LH=cell2mat(raw(2:end-3,9));
Q0=cell2mat(raw(2:end-3,10));
xi_SH=cell2mat(raw(2:end-3,11));
xi_LH=cell2mat(raw(2:end-3,12));
eta_SH=cell2mat(raw(2:end-3,13));
eta_LH=cell2mat(raw(2:end-3,14));
adhd=cell2mat(raw(2:end-3,75));

save('data/ID.mat','ID')
save('data/age.mat','age')
save('data/sgm0_SH.mat','sgm0_SH')
save('data/sgm0_LH.mat','sgm0_LH')
save('data/eta_SH.mat','eta_SH')
save('data/eta_LH.mat','eta_LH')
save('data/xi_SH.mat','xi_SH')
save('data/xi_LH.mat','xi_LH')
save('data/adhd.mat','adhd')




