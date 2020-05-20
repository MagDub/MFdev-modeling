
    n_param = 7;
    
    load('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\thompson\4perdim\out_sim_thompson.mat')
    load('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\thompson\4perdim\param_bounds.mat') %parameter bounds

    
    tmp.settings.params.param_names{1} = 'sigma_0_1';
    tmp.settings.params.param_names{2} = 'sigma_0_2';
    tmp.settings.params.param_names{3} = 'Q_0';
    tmp.settings.params.param_names{4} = 'epsilon_1';
    tmp.settings.params.param_names{5} = 'epsilon_2';
    tmp.settings.params.param_names{6} = 'eta_1';
    tmp.settings.params.param_names{7} = 'eta_2';
    
    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 
               
    for j = 1:n_param 
        y_legends{j} = tmp.settings.params.param_names{j};
        for i = 1:n_param 
            if i==j
                %
                figure('Color','w');
                set(gcf,'Unit','centimeters','OuterPosition',[0 0 8 8]);
                set(gca,'FontName','Arial','FontSize',10)
                hold on
                plot(out.fitted(:,i),out.org(:,j), 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(3,:),'MarkerSize',3.3, 'LineWidth', 0.7); hold on;
                ylabel('Original value','FontName','Arial','Fontweight','bold','FontSize',12);
                xlabel('Fitted value','FontName','Arial','Fontweight','bold','FontSize',12);
                
                if j==1 || j==2
                    xlim([0 param_bounds.sgm0(2)+param_bounds.sgm0(2)/4])
                    ylim([0 param_bounds.sgm0(2)+param_bounds.sgm0(2)/4])
                    xticks([0 1 2 3])
                    yticks([0 1 2 3])
                    plot([0,param_bounds.sgm0(2)+param_bounds.sgm0(2)/5],[0,param_bounds.sgm0(2)+param_bounds.sgm0(2)/5],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
                elseif j==3
                    xlim([0 param_bounds.Q0(2)+param_bounds.Q0(2)/5])
                    ylim([0 param_bounds.Q0(2)+param_bounds.Q0(2)/5])
                    xticks([0 2 4 6])
                    yticks([0 2 4 6])
                    plot([0,param_bounds.Q0(2)+param_bounds.Q0(2)/5],[0,param_bounds.Q0(2)+param_bounds.Q0(2)/5],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
                elseif j==4 || j==5
                    xlim([0 param_bounds.xi(2)+param_bounds.xi(2)/4])
                    ylim([0 param_bounds.xi(2)+param_bounds.xi(2)/4])
                    xticks([0 0.2 0.4 0.6])
                    yticks([0 0.2 0.4 0.6])
                    plot([0,param_bounds.xi(2)+param_bounds.xi(2)/5],[0,param_bounds.xi(2)+param_bounds.xi(2)/5],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
                elseif j==6 || j==7
                    xlim([0 param_bounds.eta(2)+param_bounds.eta(2)/4])
                    ylim([0 param_bounds.eta(2)+param_bounds.eta(2)/4])
                    xticks([0 2 4 6])
                    yticks([0 2 4 6])
                    plot([0,param_bounds.eta(2)+param_bounds.eta(2)/5],[0,param_bounds.eta(2)+param_bounds.eta(2)/5],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
                end
                
                rho = corr(out.fitted(:,i),out.org(:,j), 'rows','complete', 'Type','Pearson');
                parameter_recov_mat(j,i) = rho;
                x_legends{i} = tmp.settings.params.param_names{i};
                dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
                legend([dummyh],{['r=' num2str(rho)]}, 'Location',[0.0714587155679245 0.824706154469951 0.392265185878422 0.112686977748616],'FontSize',15)
                legend boxoff;

                % Export
                out_dir = 'D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\thompson\4perdim\';
                addpath('D:\writing\export_fig')
                export_fig([out_dir 'Fig_corr_' tmp.settings.params.param_names{i} '_new.tif'],'-nocrop','-r200')

%                 %
%                 figure('Color','w');
%                 set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
%                 set(gca,'FontName','Arial','FontSize',18)
%                 hold on
%                 hist(out.fitted(:,i));
%                 h = findobj(gca,'Type','patch');
%                 h.FaceColor=cols(1,:);
%                 ylim([0 2500]);
%                 yticks([0 1000 2000])
%                 yticklabels([0 1000/100 2000/100])
%                 set(gca,'fontsize',13)
%                 ylabel('count (\times10^2)','FontName','Arial','FontSize',18);
%                 xlabel('fitted value','FontName','Arial','FontSize',18);
%                 if j==1
%                     xlim([0 2+2/5])
%                     xticks([0 1 2])
%                 elseif j==2
%                     xlim([0 10+10/5])
%                     xticks([0 5 10])
%                 elseif j==3
%                     xlim([0 0.5+0.5/5])
%                     xticks([0 0.25 0.5])
%                 elseif j==4
%                     xlim([0 5+5/5])
%                     xticks([0 2.5 5])
%                 end
% 
                % Export
                addpath('D:\writing\export_fig')
                export_fig(['fig_' tmp.settings.params.param_names{i} '.tif'],'-nocrop','-r200')
            end
        end
    end