function [mo] = information_gain_argmax(mo,idx_hor,idx_g,t)

%% load parameters
% if length(mo.params.xi) > 1
%     gamma = mo.params.gamma(idx_hor);
% else
%     gamma = mo.params.gamma;
% end
% if isempty(gamma) || isnan(gamma) || isinf(abs(gamma))
%     error('gamma parameter not set properly for UCB')
% end
gamma = mo.params.gamma(idx_hor);

%% load in current values
Q = mo.mat.Q{idx_hor,idx_g}(:,t);
sgm = mo.mat.sgm{idx_hor,idx_g}(:,t);

%% compute values
 V = [];
 IG = [];
  
n_samples = 200;
  
for i = 1:length(Q)
    pd_t = truncate(makedist('Normal','mu',Q(i),'sigma',sgm(i)),2,10);
    distrib_current = random(pd_t,[1 n_samples]);
    distrib_future = posterior_distrib_argmax(pd_t, Q(i), sgm(i), n_samples);
    IG(i) = KLDiv(distrib_current,distrib_future);
    V(i) = Q(i) + (gamma*IG(i));
end

%% calculate policy (only important for actual decision)
pi = mo.funs.decfun(V,mo,idx_hor);
%% write to mo
mo.mat.V_UCB{idx_hor,idx_g}(:,t) = V;
mo.mat.pi{idx_hor,idx_g}(:,t) = pi;




