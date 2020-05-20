function mo = initialise_model_MF_S0fixed_sgm0fixed_nolapse_eta_max(settings)


%% set up model structure
mo = [];

%% set up parameters
mo.params.eta           = [];
mo.params.Q0            = nan(settings.task.N_games,1); %5*ones(settings.task.N_games,1); % prior mean (set up, so that learning can be implemented

%% set up matrices
mo.mat.Q(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,6)};   % Q-value(mean) - 4 trees, 6 draws (5 passive, 1 active)
mo.mat.pi(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,6)};   % policy

%% set up functions
mo.funs.learningfun     = @argmax_no_sgm; % learning model

%% other fun things
mo.warnings = {};