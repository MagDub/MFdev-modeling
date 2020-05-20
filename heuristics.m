function [mo] = heuristics(mo,idx_hor,idx_g,t)



%% load in current values
Q = mo.mat.Q{idx_hor,idx_g}(:,t);

%% policy
pi = mo.funs.decfun(Q,mo,idx_hor);

%% write to mo
mo.mat.pi{idx_hor,idx_g}(:,t) = pi;




