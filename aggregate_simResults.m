function aggregate_simResults(algo, n_param, n_per_dim)


    %% settings
    if strcmp(algo,'thompson')
        sim_name = 'sim_thompson';
    elseif strcmp(algo,'UCB')
        sim_name = 'sim_UCB';
    elseif strcmp(algo,'UCBmean')
        sim_name = 'sim_UCBmean';
    elseif strcmp(algo,'UCBargmax')
        sim_name = 'sim_UCBargmax';
    end


    %% get data
        
    out_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\',algo,'\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');

        
    sim_dir = strcat(out_dir,'results/');
    list = dir([sim_dir '*' sim_name '*_results.mat']);
    n_junks = length(list);

    %% loop through data and assemble
    disp('aggregating data...')
    out = [];

    for i = 1:n_junks
        clear tmp tmp2
        if mod(i,1000) == 0
            disp(i)
        end

        % load
        tmp = load([sim_dir list(i).name]);

        if i == 1   % instantiate matrices
            out.org = nan(n_junks,length(tmp.settings.params.param_names));
            out.fitted = nan(n_junks,length(tmp.mE.params));
        end

        % fill in fitted
        out.fitted(tmp.ID,:) = tmp.mE.params;

        % load and fill original
        %disp(tmp.ID)
        tmp2 = load([sim_dir 'sim_' int2str(tmp.ID) '.mat']);
        out.org(tmp.ID,:) = tmp2.para_vals;

    end
    
    disp(out);

    %% save
    disp('saving')

    
    save([out_dir, 'out_' sim_name '.mat'],'out')
    


end