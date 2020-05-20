function [mo] = heuristics_noveltybonus(mo,idx_hor,idx_g,t)

if length(mo.params.eta) > 1
    eta = mo.params.eta(idx_hor);
else
    eta = mo.params.eta;
end

%% load in current values
Q = mo.mat.Q{idx_hor,idx_g}(:,t);

if isempty(mo.mat.appleA{idx_hor,idx_g}) || isempty(mo.mat.appleB{idx_hor,idx_g})
    %disp('no A - BCD || no B - ACD')
    V(1) = Q(1);
    V(2) = Q(2) + eta; %novelty bonus on tree C
    V(3) = Q(3); 
elseif isempty(mo.mat.appleD{idx_hor,idx_g})
    %disp('no D - ABC')
    V(1) = Q(1);
    V(2) = Q(2);
    V(3) = Q(3) + eta; %novelty bonus on tree C
else
    %disp('no C')
    for i = 1:length(Q)
        V(i) = Q(i);
    end
end


%% policy
pi = mo.funs.decfun(V,mo,idx_hor);


%% write to mo
mo.mat.V_UCB{idx_hor,idx_g}(:,t) = V;
mo.mat.pi{idx_hor,idx_g}(:,t) = pi;




