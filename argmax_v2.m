function mo = argmax_v2(mo,data,idx_hor,idx_g,t)

%% load in current values
%S = mo.params.S0(1);
Q = mo.mat.Q{idx_hor,idx_g}(:,t);

%% update mean and variance
idx = find(~isnan(data.allshowntrees(t,1:3))); % Changed

% update Q-value (argmax)
Q(idx) = max(data.alltrees(t,5), Q(idx));

% Compute Q value (mean) and variance (seen apples)
if data.unshown_tree == 1
    sgm = [2 3 2]; %b c d
elseif data.unshown_tree == 2
    sgm = [0 3 2]; %a c d
elseif data.unshown_tree == 3
    sgm = [0 2 2]; %a b d
elseif data.unshown_tree == 4
    sgm = [0 2 3]; %a b c
end


%% write to mat
mo.mat.Q{idx_hor,idx_g}(:,t+1) = Q;
mo.mat.sgm{idx_hor,idx_g}(:,t+1) = sgm;
