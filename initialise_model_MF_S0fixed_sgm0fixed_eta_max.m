function mo = initialise_model_MF_S0fixed_sgm0fixed_eta_max(settings)


%% set up model structure
mo = [];

%% set up parameters
mo.params.eta           = [];
mo.params.xi            = [];   % lapse rate
mo.params.Q0            = nan(settings.task.N_games,1); % prior mean (set up, so that learning can be implemented

%% set up matrices
mo.mat.Q(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,6)};   % Q-value(mean) - 4 trees, 6 draws (5 passive, 1 active)
mo.mat.pi(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,6)};   % policy

mo.mat.appleA(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,3)}; 
mo.mat.appleB(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,1)}; 
mo.mat.appleD(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,1)}; 


%% set up functions
mo.funs.decfun          = [];           % decision function default: softmax (only when UCB)
mo.funs.valuefun        = [];           % UCB, etc
mo.funs.priorfun        = [];           % how priors are set up
mo.funs.learningfun     = @argmax_no_sgm; % learning model

%% other fun things
mo.warnings = {};