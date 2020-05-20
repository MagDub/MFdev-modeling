function [mo] = simple_model(mo,idx_hor,idx_g,t)

%% load in current values
Q = mo.mat.Q{idx_hor,idx_g}(:,t);
sgm = mo.mat.sgm{idx_hor,idx_g}(:,t);
alpha = mo.mat.alpha{idx_hor,idx_g}(:,t);

%% compute values
V = [];
for i = 1:length(Q)
    V(i) = Q(i) + (alpha*sgm(i));
end

%% calculate policy (only important for actual decision)
pi = mo.funs.decfun(V,mo,idx_hor);

%% write to mo
mo.mat.V_simple{idx_hor,idx_g}(:,t) = V;
mo.mat.pi{idx_hor,idx_g}(:,t) = pi;

end

