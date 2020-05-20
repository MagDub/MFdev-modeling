function mo = argmax_no_sgm(mo,data,idx_hor,idx_g,t)


%% update mean and variance

% Compute Q value (mean) and variance (seen apples)
if data.unshown_tree == 1
    Q = [data.b mo.params.Q0(1) data.d];
elseif data.unshown_tree == 2
    Q = [max(data.a) mo.params.Q0(1) data.d];
elseif data.unshown_tree == 3
    Q = [max(data.a) data.b data.d];
elseif data.unshown_tree == 4
    Q = [max(data.a) data.b mo.params.Q0(1)];
end


%% write to mat
mo.mat.Q{idx_hor,idx_g}(:,t+1) = Q';
