

% problem with 106, 119, 212, 231, 238, 312, 333
% 107 is an err file in data_analysis
% 
% for ID = 120:143
%     f = dir(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data\new\',int2str(ID),'\'));
%     if ~(f(end).bytes==0) % checks that is not empty
%         crossvalidation_thompson_3param_nov_2Hor_2nov_Q01(ID)
%     end
% end

%for ID = 239:241
%     f = dir(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data\new\',int2str(ID),'\'));
%     if ~(f(end).bytes ==0) % checks that is not empty
%         crossvalidation_thompson_3param_nov_2Hor_2nov_Q01(ID)
%     end
% end

for ID = 334:341
    f = dir(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data\new\',int2str(ID),'\'));
    if ~(f(end).bytes==0) % checks that is not empty
        crossvalidation_thompson_3param_nov_2Hor_2nov_Q01(ID)
    end
end