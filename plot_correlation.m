function plot_correlation(algo, n_param, n_per_dim)
    
    out_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\',algo,'\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');
    sim_dir = strcat(out_dir,'results\');
    
    % Load one file to get the parameter names
    tmp = load([sim_dir 'sim_1.mat']);
    
    % Load the concatenated matrix
    load([out_dir 'out_sim_' algo '.mat'])
    
           
    for j = 1:n_param 
        corr_plot = figure(j);
        annotation('textbox', [0 0.9 1 0.1], ...
        'String', [tmp.settings.params.param_names{j}], ...
        'EdgeColor', 'none', ...
        'HorizontalAlignment', 'center')
        y_legends{j} = tmp.settings.params.param_names{j};
        for i = 1:n_param %length(out.fitted(tmp.ID,:))
            subplot(2,n_param,i)
            plot(out.fitted(:,i),out.org(:,j),'.') % inversed x and y
            ylabel('original param')
            xlabel('fitted param')
            rho = corr(out.fitted(:,i),out.org(:,j), 'rows','complete', 'Type','Pearson');
            parameter_recov_mat(j,i) = rho;
            x_legends{i} = tmp.settings.params.param_names{i};
            title([tmp.settings.params.param_names{i} ': rho=' num2str(rho)])
            
            subplot(2,n_param,n_param+i)
            hist(out.fitted(:,i))
            
        end
        saveas(corr_plot, strcat(out_dir,'corr_plot_', int2str(j),'.png'))
        save(strcat(out_dir,'corr_plot_', int2str(j),'.mat'), 'corr_plot');
    end

    corr_mat=figure();
    imagesc(abs(parameter_recov_mat))
    xticks([1 2 3 4])
    xlabel('Fitted parameters')
    xticklabels({x_legends{1}, x_legends{2}, x_legends{3}, x_legends{4}})
    yticks([1 2 3 4])
    ylabel('Original parameters')
    yticklabels({y_legends{1}, y_legends{2}, y_legends{3}, y_legends{4}})
    colorbar(); 
    textStrings = num2str(parameter_recov_mat(:), '%0.2f');       % Create strings from the matrix values
    textStrings = strtrim(cellstr(textStrings));  % Remove any space padding
    [x, y] = meshgrid(1:n_param);  % Create x and y coordinates for the strings
    hStrings = text(x(:), y(:), textStrings(:), ...  % Plot the strings
                    'HorizontalAlignment', 'center');
    midValue = mean(get(gca, 'CLim'));  % Get the middle value of the color range
    title(strcat('Parameter recovery - ' ,32, algo, ' - ',32, int2str(n_per_dim),  ' per dim - Pearson - Kalman filter')) 
    saveas(corr_mat,strcat(out_dir,'corr_mat.png'))
    save(strcat(out_dir,'corr_mat.fig'), 'corr_mat');

end