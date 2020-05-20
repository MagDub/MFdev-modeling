

close all

tmp = load('datathompsonmod12.mat');
data = tmp.datathompsonmod12;
clear tmp;

% n = 8:18;
% 
% subplot(1,3,1)
% plot(n,-exp(-n)./max(exp(-n))+1)
% 
% subplot(1,3,2)
% plot(n, asymptotic_emergent_age(n, 14));
% 
% subplot(1,3,3)
% plot(n, -1./gamma(n));


% age = data.age(2:end);
% 
% conv_age = asymptotic_emergent_age(age, 10);
% 
% [age conv_age]

age = data.age(2:end);
a = -exp(-age)./max(exp(-age))+1;
plot(age, -exp(-age)./max(exp(-age))+1)