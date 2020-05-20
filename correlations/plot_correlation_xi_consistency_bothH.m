
    %% Data
    load('D:\writing\MF_dev\data_for_figs\model_parameters.mat')
           
    % xi
    xi_SH = model_parameters(:,5);
    xi_LH = model_parameters(:,6);
    
    % picked D
    load('D:\writing\MF_dev\data_for_figs\consistency_freq.mat')
    consist_SH = consistency_freq(:,2);
    consist_LH = consistency_freq(:,1);

    %% Plot

    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 
               
    figure('Color','w');
    set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
    set(gca,'FontName','Arial','FontSize',10)
    hold on
    plot([xi_LH; xi_SH],[consist_LH; consist_SH], 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(3,:),'MarkerSize',3.3, 'LineWidth', 0.7); hold on;
    ylabel('Proportion of same choices [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('\epsilon-greedy parameter','FontName','Arial','Fontweight','bold','FontSize',12);

    xlimmax = max(max(xi_SH), max(xi_LH));
    ylimmin = min(min(consist_SH), min(consist_LH));
    ylimmax = max(max(consist_SH), max(consist_LH));
    
    xlim([0 xlimmax])
    ylim([ylimmin ylimmax])
    plot([0,xlimmax],[ylimmax,ylimmin],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
    
    yticks((0:15:ylimmax))

    rho = corr([xi_LH; xi_SH],[consist_LH; consist_SH], 'rows','complete', 'Type','Pearson');
%                 parameter_recov_mat(j,i) = rho;
%                 x_legends{i} = tmp.settings.params.param_names{i};
    dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
    legend([dummyh],{['r=' num2str(rho)]}, 'Position',[0.476154848452753 0.845758786048899 0.41160220187672 0.112686977748615],'FontSize',15)
    legend boxoff;

    % Export
    %    out_dir = 'figs\correlations\';
    addpath('D:\writing\export_fig')
    export_fig(['Fig_corr_xi_consist_bothH.tif'],'-nocrop','-r200')
