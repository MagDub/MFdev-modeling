function mo = initialise_model_MF_S0fixed_sgm0fixed_nolapse_max(settings)

%% set up model structure
mo = [];

%% set up parameters
mo.params.Q0            = nan(settings.task.N_games,1); 

%% set up matrices
mo.mat.Q(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,6)};   % Q-value(mean) - 4 trees, 6 draws (5 passive, 1 active)
mo.mat.pi(1:settings.task.N_hor,1:settings.task.Ngames_per_hor) = {nan(settings.task.N_trees,6)};   % policy
mo.mat.V_simple = mo.mat.Q; % values for the simple model 

%% learning functions
mo.funs.learningfun     = @argmax_no_sgm;


