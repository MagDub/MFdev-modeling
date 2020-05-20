
close all;

tmp = load('datathompsonmod12.mat');
data = tmp.datathompsonmod12;
clear tmp;

tmp = load('dataquestionnaire.mat');
data_quest = tmp.dataquestionnaire;
clear tmp;

ID = data.ID(2:end);
age = data.age(2:end);
const_SH = data.ConsistenSH(2:end);
const_LH = data.ConsistenLH(2:end);

pickedD_SH = data.all_D_short(2:end);
pickedD_LH = data.all_D_long(2:end);

wasi_IQ = data_quest.Wasi_IQ;
wasi_raw = data_quest.Wasi_Raw;

figure()
plot(age, wasi_IQ, '*')

figure()
plot(pickedD_SH, wasi_IQ, '*')