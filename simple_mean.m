function mo = simple_mean(mo,data,idx_hor,idx_g,t)

%% load in current values
S = mo.params.S0(1);

%% update mean and variance

% Compute Q value (mean) and variance (seen apples)
if data.unshown_tree == 1
    Q = [data.b mo.params.Q0(1) data.d];
    sgm = [2 3 2]; %b c d
elseif data.unshown_tree == 2
    Q = [mean(data.a) mo.params.Q0(1) data.d];
    sgm = [0 3 2]; %a c d
elseif data.unshown_tree == 3
    Q = [mean(data.a) data.b data.d];
    sgm = [0 2 2]; %a b d
elseif data.unshown_tree == 4
    Q = [mean(data.a) data.b mo.params.Q0(1)];
    sgm = [0 2 3]; %a b c
end


%% write to mat
mo.mat.Q{idx_hor,idx_g}(:,t+1) = Q';
mo.mat.sgm{idx_hor,idx_g}(:,t+1) = sgm';
