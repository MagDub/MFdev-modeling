
    %% Data
    load('D:\writing\MF_dev\data_for_figs\model_parameters.mat')
        
    % xi
    xi_SH = model_parameters(:,5);
    xi_LH = model_parameters(:,6);
    
    load('D:\writing\MF_dev\data_for_figs\model_parameters.mat')
    
    load('D:\MaggiesFarm\modeling_05_07_developmental\linear_regression\dataquestionnaire.mat');
       
    % xi
    xi_SH = model_parameters(:,5);
    xi_LH = model_parameters(:,6);
    
    ID = model_parameters(:,1);
    
    ADHD = dataquestionnaire.conners__adhd_tscore;
    
    %% Plot

    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 
               
    figure('Color','w');
    set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
    set(gca,'FontName','Arial','FontSize',10)
    hold on
    plot([xi_LH; xi_SH],[ADHD; ADHD], 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(3,:),'MarkerSize',3.3, 'LineWidth', 0.7); hold on;
    ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('\epsilon-greedy parameter','FontName','Arial','Fontweight','bold','FontSize',12);

    xlimmax = max(max(xi_SH), max(xi_LH));
    ylimmax = max(max(ADHD), max(ADHD));
    
    xlim([0 xlimmax])
    ylim([0 ylimmax])
    yticks((0:10:ylimmax))
    xticks([0:0.2:1])
%     plot([0,xlimmax-distancelinestop],[0,ylimmax-(distancelinestop*(ylimmax/xlimmax))],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
    plot([0,xlimmax],[0,ylimmax],'Color','k', 'Linewidth', 0.4,'LineStyle','--');

    rho = corr([xi_LH; xi_SH],[ADHD; ADHD], 'rows','complete', 'Type','Pearson');
%                 parameter_recov_mat(j,i) = rho;
%                 x_legends{i} = tmp.settings.params.param_names{i};
    dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
    legend([dummyh],{['r=' num2str(rho)]}, 'Position',[0.516210096783394 0.221197382540127 0.392265185878422 0.112686977748615],'FontSize',15)
    legend boxoff;

    % Export

    addpath('D:\writing\export_fig')
    export_fig(['Fig_corr_xi_pickedD_bothH.tif'],'-nocrop','-r200')
