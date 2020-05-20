close all;

tmp = load('datathompsonmod12.mat');
data = tmp.datathompsonmod12;
clear tmp;

ID = data.ID(2:end);
age = data.age(2:end);

pickedD_SH = data.all_D_short(2:end);
pickedD_LH = data.all_D_long(2:end);

conv_age = asymptotic_emergent_age(age, 16);

% age

plot([1:98],age, 'r*'); hold on;
plot([1:98],conv_age, 'b*'); hold on;
plot([1:98],conv_age, 'b*'); hold on;
xlabel('ID')
ylabel('age')