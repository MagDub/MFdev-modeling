function HOLLY_cv_mod6_UCB_2param_2Hor_2nov(ID)

    %%%%%%% k-fold validation indexes %%%%%%%
    tot_trials = 48;
    Kf = 4;
    
    trials_tested_on = tot_trials / Kf;
    trials_trained_on = tot_trials - trials_tested_on ;

    range_test_mat = nan(Kf,trials_tested_on);
    range_train_mat = nan(Kf,trials_trained_on);

    for i =1:Kf
        k=i-1;
        range_train_mat(i,:) = [1:trials_tested_on*k, ...
            trials_tested_on*k+trials_tested_on+1:tot_trials];
        range_test_mat(i,:) = [trials_tested_on*k+1:trials_tested_on*k+trials_tested_on];
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    holly = 1;
    
    for k = 1:Kf

        range_test = range_test_mat(k,:);
        range_train = range_train_mat(k,:);


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        param_bounds_gamma = [10^-8,10]; % information bonus
        param_bounds_tau = [10^-8,7]; % inverse temperature
        param_bounds_eta = [0,5];
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            algo = 'crossval_UCB';
            n_param = 2;

            if holly == 1
                results_dir = strcat('/home/mdubois/data/dev_participant_data/',algo,'/',int2str(n_param), 'params_2Hor_2nov/results/');
            else
                results_dir = strcat('D:\MaggiesFarm\modeling_28_02\participant_data\',algo,'\', int2str(n_param), 'params_2Hor_2nov\results\');
            end


            %% settings
            settings = [];
            settings.task.N_games = 400; % %400/10*9; 
            settings.task.N_hor = 2;
            settings.task.Ngames_per_hor = settings.task.N_games / settings.task.N_hor;
            settings.task.N_trees = 3; % Changed
            settings.opts.TLT       = [];
            settings.funs.decfun        = @softmax;
            settings.funs.valuefun      = @UCB; 
            settings.funs.priorfun      = [];
            settings.funs.learningfun   = @kalman_filt;
            settings.desc = ['UCB'];    % description of model (settings, etc)
            settings.params.param_names = {'gamma'     ''    'tau' '' 'eta' ''};   % is same param name as prev, write ''
            settings.params.lb          = [param_bounds_gamma(1) param_bounds_gamma(1)  param_bounds_tau(1) param_bounds_tau(1) param_bounds_eta(1) param_bounds_eta(1)];    % lower bound
            settings.params.ub          = [param_bounds_gamma(2) param_bounds_gamma(2)  param_bounds_tau(2) param_bounds_tau(2) param_bounds_eta(2) param_bounds_eta(2)];    % upper bound

            %% get data
            if holly == 1
                data_dir = strcat('/data/mdubois/MaggiesFarm/data_dev/',num2str(ID),'/');
            else
                data_dir = strcat('D:\MaggiesFarm\2019_04_17_MF_dev_explore\data\new\',num2str(ID),'\');
            end
            [data,gameIDs] = aggregateData(ID,data_dir);

            %% fit model

            data_train = data(1:2,range_train);
            gameIDs_train = gameIDs(1:2,range_train);

            modelfun = @(x) modelMF_S0fixed_Q0fixed_sgm0fixed_eta_crossval(x,settings.params.param_names,ID,settings,data_train,gameIDs_train, 1, trials_trained_on);   

            %%%%%%%% fmincon %%%%%%%%
            options = optimoptions('fmincon','Display','off');
            a = settings.params.lb;
            b = settings.params.ub;

               mEmatparams = nan(8,6);
               mEmatmle = nan(8,1);
               mEexitflag = nan(8,1);

                for iter=1:8
                % starting point
                    xo_fmincon = (b-a).*rand(1,1) + a; % random value in this interval     
                    [mEparams, mEmle, mEexitflag] = fmincon(modelfun,...
                        xo_fmincon,[],[],[],[],...
                        settings.params.lb,settings.params.ub,...
                        [],options);
                    mEmatparams(iter,:) = mEparams;
                    mEmatmle(iter,:) = mEmle;
                    mEexitflag(iter,:) = mEexitflag;
                end

            %% tidy up  
            mEsubj = ID;
            %[nLogL, mo, logL] = modelfun(mEparams);

            [mEmle, ind]= min(mEmatmle);
            mEparams  = mEmatparams(ind,:);
            mEexitflag = mEexitflag(ind);
            if ~exist(results_dir)
                mkdir(results_dir)
            end

            % save
            save_func_data(ID+k*1000, settings, results_dir, mEparams, mEmle, [], mEexitflag, mEsubj, [], [], mEmatparams, mEmatmle)


            %% test model

            data_test = data(1:2,range_test);
            gameIDs_test = gameIDs(1:2,range_test);

            [test_nLogL, ~, ~] = modelMF_S0fixed_Q0fixed_sgm0fixed_lapse_eta_crossval(mEparams,settings.params.param_names,ID,settings,data_test,gameIDs_test, 1, trials_tested_on);
            average_prob(k) = exp(-test_nLogL/(2*trials_tested_on));
    end

    save([results_dir 'aver_prob_' settings.desc '_' int2str(ID) '.mat'],'average_prob')

end