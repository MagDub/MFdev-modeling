
function [EV_SH_mat,EV_LH_mat] = compute_EV_all(part_num)

        load('D:\MaggiesFarm\2019_01_07_NADA_explore\MaggiesFarm_task\2019_07_01_apple_task_training\data_analysis\part_501\mat_ABD_desc.mat');
    
        for ID=1:size(part_num,2)
            
            part = part_num(ID);
            
            if part~=107 && part~=119 && part~=212
            
                EV_SH = [];
                EV_LH = [];

                %% ABD
                tmp = load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',int2str(part),'\mat_ABD.mat'));

                chosen_apple = tmp.mat_ABD(:,10);
                hor_mat = tmp.mat_ABD(:,3);

                for i = 1:size(chosen_apple,1)

                    if chosen_apple(i) == 1                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = mean([tmp.mat_ABD(i,5),tmp.mat_ABD(i,6),tmp.mat_ABD(i,7)]')';
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = mean([tmp.mat_ABD(i,5),tmp.mat_ABD(i,6),tmp.mat_ABD(i,7)]')';
                        end

                    elseif chosen_apple(i) == 2 
                        if hor_mat(i) == 6
                            EV_SH(end+1) = tmp.mat_ABD(i,8);
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = tmp.mat_ABD(i,8);
                        end

                    elseif chosen_apple(i) == 4                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = tmp.mat_ABD(i,9);
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = tmp.mat_ABD(i,9);
                        end
                    end

                end

                %% AB
                tmp = load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',int2str(part),'\mat_AB.mat'));

                chosen_apple = tmp.mat_AB(:,9);
                hor_mat = tmp.mat_AB(:,3);

                for i = 1:size(chosen_apple,1)

                    if chosen_apple(i) == 1                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = mean([tmp.mat_AB(i,5),tmp.mat_AB(i,6),tmp.mat_AB(i,7)]')';
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = mean([tmp.mat_AB(i,5),tmp.mat_AB(i,6),tmp.mat_AB(i,7)]')';
                        end

                    elseif chosen_apple(i) == 2 
                        if hor_mat(i) == 6
                            EV_SH(end+1) = tmp.mat_AB(i,8);
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = tmp.mat_AB(i,8);
                        end

                    elseif chosen_apple(i) == 3                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = nan;
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = nan;
                        end
                    end

                end

                %% AD
                tmp = load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',int2str(part),'\mat_AD.mat'));

                chosen_apple = tmp.mat_AD(:,9);
                hor_mat = tmp.mat_AD(:,3);

                for i = 1:size(chosen_apple,1)

                    if chosen_apple(i) == 1                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = mean([tmp.mat_AD(i,5),tmp.mat_AD(i,6),tmp.mat_AD(i,7)]')';
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = mean([tmp.mat_AD(i,5),tmp.mat_AD(i,6),tmp.mat_AD(i,7)]')';
                        end

                    elseif chosen_apple(i) == 4 
                        if hor_mat(i) == 6
                            EV_SH(end+1) = tmp.mat_AD(i,8);
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = tmp.mat_AD(i,8);
                        end

                    elseif chosen_apple(i) == 3                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = nan;
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = nan;
                        end
                    end

                end

                %% BD
                tmp = load(strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data_analysis\part_',int2str(part),'\mat_BD.mat'));

                chosen_apple = tmp.mat_BD(:,7);
                hor_mat = tmp.mat_BD(:,3);

                for i = 1:size(chosen_apple,1)

                    if chosen_apple(i) == 2 
                        if hor_mat(i) == 6
                            EV_SH(end+1) = tmp.mat_BD(i,5);
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = tmp.mat_BD(i,5);
                        end

                    elseif chosen_apple(i) == 3                
                        if hor_mat(i) == 6
                            EV_SH(end+1) = nan;
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = nan;
                        end

                    elseif chosen_apple(i) == 4
                        if hor_mat(i) == 6
                            EV_SH(end+1) = tmp.mat_BD(i,6);
                        elseif hor_mat(i) == 11
                            EV_LH(end+1) = tmp.mat_BD(i,6);
                        end
                    end

                end

                %%
                EV_SH_mat(ID) = nanmean(EV_SH);
                EV_LH_mat(ID) = nanmean(EV_LH);
                
            end

        end
        
        EV_SH_mat = EV_SH_mat';
        EV_LH_mat = EV_LH_mat';

end
