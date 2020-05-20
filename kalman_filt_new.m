function mo = kalman_filt_new(mo,data,idx_hor,idx_g,t)

%% load in current values
Q = mo.mat.Q{idx_hor,idx_g}(:,t);
sgm = mo.mat.sgm{idx_hor,idx_g}(:,t);
S = mo.params.S0(1);

%%
if data.unshown_tree == 1
    mo.mat.appleA{idx_hor,idx_g} = [];
    mo.mat.appleB{idx_hor,idx_g} = data.b;
    mo.mat.appleD{idx_hor,idx_g} = data.d;
elseif data.unshown_tree == 2
    mo.mat.appleA{idx_hor,idx_g} = data.a;
    mo.mat.appleB{idx_hor,idx_g} = [];
    mo.mat.appleD{idx_hor,idx_g} = data.d;
elseif data.unshown_tree == 3
    mo.mat.appleA{idx_hor,idx_g} = data.a;
    mo.mat.appleB{idx_hor,idx_g} = data.b;
    mo.mat.appleD{idx_hor,idx_g} = data.d;
elseif data.unshown_tree == 4
    mo.mat.appleA{idx_hor,idx_g} = data.a;
    mo.mat.appleB{idx_hor,idx_g} = data.b;
    mo.mat.appleD{idx_hor,idx_g} = [];
end

%% update mean and variance
idx = find(~isnan(data.allshowntrees(t,1:3))); % Changed

% prediction error
da = data.alltrees(t,5) - Q(idx); %size of apple at time t

% Kalman Gain
K = sgm(idx)^2 / (sgm(idx)^2 + S^2);

% update Q-value
Q(idx) = Q(idx) + K * da;

% update variance
sgm(idx) = sqrt(sgm(idx)^2 - K * sgm(idx)^2);

%% write to mat
mo.mat.Q{idx_hor,idx_g}(:,t+1) = Q;
mo.mat.sgm{idx_hor,idx_g}(:,t+1) = sgm;
mo.mat.da{idx_hor,idx_g}(t) = da;
mo.mat.k{idx_hor,idx_g}(t) = K;