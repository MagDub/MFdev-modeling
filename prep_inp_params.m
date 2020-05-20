function prep_inp_params(n_per_dim,algo, n_param, param_bounds, try_num)


    %% settings
    n_junks = 1500;
    
    if strcmp (algo, 'thompson')
        %% create grid for Thompson
        if n_param == 4

            param_names = {'sgm0','Q0','xi','eta'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.Q0(1),param_bounds.Q0(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            grd.dim{4} = linspace(param_bounds.eta(1),param_bounds.eta(2),n_per_dim);

            [x1, x2, x3, x4] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4});
            inp_params = single([x1(:) x2(:) x3(:) x4(:)]);
            clear x*
            
        elseif n_param == 2
            param_names = {'xi', 'eta'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.eta(1),param_bounds.eta(2),n_per_dim);

            [x1, x2] = ndgrid(grd.dim{1},grd.dim{2});
            inp_params = single([x1(:) x2(:)]);
            clear x*
        elseif n_param == 1
            param_names = {'eta'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.eta(1),param_bounds.eta(2),n_per_dim);

            [x1] = ndgrid(grd.dim{1});
            inp_params = single([x1(:)]);
            clear x*
        elseif n_param == 3
            param_names = {'sgm0','Q0','xi'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.Q0(1),param_bounds.Q0(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);

            [x1, x2, x3] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3});
            inp_params = single([x1(:) x2(:) x3(:)]);
            clear x*
        end
        
        saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\thompson\', int2str(n_per_dim), 'perdim\');
        
        if exist(saving_dir) == 0
            mkdir(saving_dir)
        end
        
        save(strcat(saving_dir,'inp_params_thompson.mat'),'inp_params');
        %disp('confusion matrices (inp_param): done')
        

    
    elseif strcmp (algo, 'UCB')
        %% create grid for UCB
        if n_param == 6
        param_names = {'S0','sgm0','Q0','gamma','xi','tau'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.S0(1),param_bounds.S0(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.Q0(1),param_bounds.Q0(2),n_per_dim);
            grd.dim{4} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{5} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            grd.dim{6} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);

            [x1, x2, x3, x4, x5, x6] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4},grd.dim{5},grd.dim{6});
            inp_params = single([x1(:) x2(:) x3(:) x4(:) x5(:) x6(:)]);
            clear x*
            
            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCB\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');

        elseif n_param == 5
            param_names = {'sgm0','Q0','gamma','xi','tau'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.Q0(1),param_bounds.Q0(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{4} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            grd.dim{5} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);

            [x1, x2, x3, x4, x5] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4},grd.dim{5});
            inp_params = single([x1(:) x2(:) x3(:) x4(:) x5(:)]);
            clear x*
            
        elseif n_param == 4
            param_names = {'sgm0','gamma','xi','tau'};

            grd = [];
            
            if size(param_bounds.sgm0,2) == 2 % splits in values between the bounds if 2 dimensions are given
                grd.dim{1} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            elseif size(param_bounds.sgm0,2) == 1 % Repeats the same value if it's a constant value (no bounds), if one value is given
                grd.dim{1} = param_bounds.sgm0(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.gamma,2) == 2
                grd.dim{2} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            elseif size(param_bounds.gamma,2) == 1
                grd.dim{2} = param_bounds.gamma(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.xi,2) == 2
                grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            elseif size(param_bounds.xi,2) == 1
                grd.dim{3} = param_bounds.xi(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.tau,2) == 2
                grd.dim{4} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            elseif size(param_bounds.tau,2) == 1
                grd.dim{4} = param_bounds.tau(1) * ones(1,n_per_dim);
            end
     

            [x1, x2, x3, x4] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4});
            inp_params = single([x1(:) x2(:) x3(:) x4(:)]);
            clear x*


            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCB\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim', int2str(try_num),'\');

        elseif n_param == 3
            param_names = {'gamma','tau', 'xi'};

            grd = [];
            
            if size(param_bounds.gamma,2) == 2
                grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            elseif size(param_bounds.gamma,2) == 1
                grd.dim{1} = param_bounds.gamma(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.tau,2) == 2
                grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            elseif size(param_bounds.tau,2) == 1
                grd.dim{2} = param_bounds.tau(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.xi,2) == 2
                grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            elseif size(param_bounds.xi,2) == 1
                grd.dim{3} = param_bounds.xi(1) * ones(1,n_per_dim);
            end
            

            [x1, x2, x3] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3});
            inp_params = single([x1(:) x2(:) x3(:)]);
            clear x*
            

            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCB\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');

            
        elseif n_param == 2
            param_names = {'gamma','tau'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);

            [x1, x2] = ndgrid(grd.dim{1},grd.dim{2});
            inp_params = single([x1(:) x2(:)]);
            clear x*
            
            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCB\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');
            
        elseif n_param == 1
            param_names = {'tau'};

            grd = [];

            grd.dim{1} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);

            [x1] = ndgrid(grd.dim{1});
            inp_params = single([x1(:)]);
            clear x*
        end
        
        
        if exist(saving_dir) == 0
            mkdir(saving_dir)
        end
        
        save(strcat(saving_dir,'inp_params_UCB.mat'),'inp_params');
        %disp('done')

    elseif strcmp (algo, 'UCB_noveltybonus')
        
        if  n_param == 4
            param_names = {'gamma', 'tau', 'eta', 'xi'};

            grd = [];
            
            grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.eta(1),param_bounds.eta(2),n_per_dim);
            grd.dim{4} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);

            [x1, x2, x3, x4] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4});
            inp_params = single([x1(:) x2(:) x3(:) x4(:)]);
            clear x*

            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCB_noveltybonus\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');
        end
        
        if exist(saving_dir) == 0
            mkdir(saving_dir)
        end
        
        save(strcat(saving_dir,'inp_params_UCB_noveltybonus.mat'),'inp_params');
        
        
    
    elseif strcmp (algo, 'hybrid')
        %% create grid for hybrid
        
        if n_param == 6
            
            param_names = {'gamma','tau','xi','sgm0', 'Q0', 'w_hyb'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            grd.dim{4} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            grd.dim{5} = linspace(param_bounds.Q0(1),param_bounds.Q0(2),n_per_dim);
            grd.dim{6} = linspace(param_bounds.w_hyb(1),param_bounds.w_hyb(2),n_per_dim);

            [x1, x2, x3, x4, x5, x6] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4},grd.dim{5}, grd.dim{6});
            inp_params = single([x1(:) x2(:) x3(:) x4(:) x5(:) x6(:)]);
            clear x*

            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\hybrid\6params\', int2str(n_per_dim), 'perdim\');
            
        elseif n_param == 5
            
            param_names = {'gamma','tau','xi','sgm0','w_hyb'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            grd.dim{4} = linspace(param_bounds.sgm0(1),param_bounds.sgm0(2),n_per_dim);
            grd.dim{5} = linspace(param_bounds.w_hyb(1),param_bounds.w_hyb(2),n_per_dim);

            [x1, x2, x3, x4, x5] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3},grd.dim{4},grd.dim{5});
            inp_params = single([x1(:) x2(:) x3(:) x4(:) x5(:)]);
            clear x*

            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\hybrid\5params\', int2str(n_per_dim), 'perdim\');
            
        end
        
        if exist(saving_dir) == 0
            mkdir(saving_dir)
        end
        
        save(strcat(saving_dir, 'inp_params_hybrid.mat'),'inp_params');
        %disp('done')
   
    
        elseif strcmp (algo, 'UCBmean')
        %% create grid for UCB
        if n_param == 3
            param_names = {'gamma','tau', 'xi'};

            grd = [];
            
            if size(param_bounds.gamma,2) == 2
                grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            elseif size(param_bounds.gamma,2) == 1
                grd.dim{1} = param_bounds.gamma(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.tau,2) == 2
                grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            elseif size(param_bounds.tau,2) == 1
                grd.dim{2} = param_bounds.tau(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.xi,2) == 2
                grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            elseif size(param_bounds.xi,2) == 1
                grd.dim{3} = param_bounds.xi(1) * ones(1,n_per_dim);
            end
            

            [x1, x2, x3] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3});
            inp_params = single([x1(:) x2(:) x3(:)]);
            clear x*
            

            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCBmean\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');

            
        elseif n_param == 2
            param_names = {'gamma','tau'};

            grd = [];
            grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);

            [x1, x2] = ndgrid(grd.dim{1},grd.dim{2});
            inp_params = single([x1(:) x2(:)]);
            clear x*
            
            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCBmean\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');
            
        elseif n_param == 1
            param_names = {'tau'};

            grd = [];

            grd.dim{1} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);

            [x1] = ndgrid(grd.dim{1});
            inp_params = single([x1(:)]);
            clear x*
        end
        
        
        if exist(saving_dir) == 0
            mkdir(saving_dir)
        end
        
        save(strcat(saving_dir,'inp_params_UCBmean.mat'),'inp_params');
        %disp('done')
        
        elseif strcmp (algo, 'UCBargmax')
        %% create grid for UCB
        if n_param == 3
            param_names = {'gamma','tau', 'xi'};

            grd = [];
            
            if size(param_bounds.gamma,2) == 2
                grd.dim{1} = linspace(param_bounds.gamma(1),param_bounds.gamma(2),n_per_dim);
            elseif size(param_bounds.gamma,2) == 1
                grd.dim{1} = param_bounds.gamma(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.tau,2) == 2
                grd.dim{2} = linspace(param_bounds.tau(1),param_bounds.tau(2),n_per_dim);
            elseif size(param_bounds.tau,2) == 1
                grd.dim{2} = param_bounds.tau(1) * ones(1,n_per_dim);
            end
            
            if size(param_bounds.xi,2) == 2
                grd.dim{3} = linspace(param_bounds.xi(1),param_bounds.xi(2),n_per_dim);
            elseif size(param_bounds.xi,2) == 1
                grd.dim{3} = param_bounds.xi(1) * ones(1,n_per_dim);
            end
            

            [x1, x2, x3] = ndgrid(grd.dim{1},grd.dim{2},grd.dim{3});
            inp_params = single([x1(:) x2(:) x3(:)]);
            clear x*
            

            saving_dir = strcat('D:\MaggiesFarm\modeling_05_07_developmental\simulation_data\UCBargmax\',int2str(n_param),'params\', int2str(n_per_dim), 'perdim\');
        end
        
        if exist(saving_dir) == 0
            mkdir(saving_dir)
        end
        
        save(strcat(saving_dir,'inp_params_UCBargmax.mat'),'inp_params');
        
    end
end