
function [] = plot_behaviour_numberofapplesofchosentree_g3(numel_n, IS_SH_mat, IS_LH_mat)


N_apples_of_selected_tree_SH=IS_SH_mat;
N_apples_of_selected_tree_LH=IS_LH_mat;

%% Figure
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

%
col.groupSH(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; 
col.groupLH(1,:) = [0.513725519180298 0.380392163991928 0.482352942228317]; 
col.dots(2,:) = [0.34901961684227 0.200000002980232 0.329411774873734];

x_ax = 0:0.4:4;

% SH
b1S= bar(x_ax(3),nanmean(N_apples_of_selected_tree_SH),'FaceColor',col.groupSH(1,:), 'FaceAlpha', 0.9, 'BarWidth',1); 

% data points
plot(x_ax(3)*ones(1,size(N_apples_of_selected_tree_SH,1)), N_apples_of_selected_tree_SH','.','MarkerEdgeColor',col.dots(2,:), 'MarkerSize',3);

% first LH
b1Lf = bar(x_ax(6),nanmean(N_apples_of_selected_tree_LH),'FaceColor',col.groupLH(1,:), 'FaceAlpha', 0.9, 'BarWidth',1);

% data points
plot(x_ax(6)*ones(1,size(N_apples_of_selected_tree_LH,1)), N_apples_of_selected_tree_LH','.','MarkerEdgeColor',col.dots(2,:), 'MarkerSize',3); 

for n = 1:size(N_apples_of_selected_tree_LH,1)
    lin2 = plot(x_ax([3 6]),[N_apples_of_selected_tree_SH(n) N_apples_of_selected_tree_LH(n)]); hold on;
    lin2.Color = [col.dots(2,:) 0.3]; % transparency
end

h = errorbar(x_ax([3 6]),...
    [nanmean(N_apples_of_selected_tree_SH) nanmean(N_apples_of_selected_tree_LH)], ...
    [nanstd(N_apples_of_selected_tree_SH)./sqrt(numel_n) nanstd(N_apples_of_selected_tree_LH)./sqrt(numel_n)],'.','color','k');

set(h,'Marker','none')

xlim([0 2.8])   
set(gca,'XTick',[x_ax(3) x_ax(6)])

labels = {'Short horizon', 'Long horizon'};

a = gca;
a.XTickLabel = labels;

ylabel({'Number of initial samples','of chosen bandit'},'FontName','Arial','Fontweight','bold','FontSize',12);
set(gca,'YTick',0:0.5:3)
ylim([0 2.2])

% ylim([0 100])
% %% Export
% out_dir = 'D:\writing\MF\figs\';
% addpath('D:\writing\export_fig')
% export_fig([out_dir 'Fig_number_apples_chosentree.tif'],'-nocrop','-r200')

%% Export
out_dir = 'D:\MaggiesFarm\modeling_05_07_developmental\info_seeking\';
addpath('D:\writing\export_fig\')
export_fig([out_dir 'Fig_number_apples_chosentree_g3.tif'],'-nocrop','-r200')

end
