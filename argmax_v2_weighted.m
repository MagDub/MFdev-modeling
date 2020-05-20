function mo = argmax_v2_weighted(mo,data,idx_hor,idx_g,t)

%% load in current values
Q = mo.mat.Q{idx_hor,idx_g}(:,t);
sgm = mo.mat.sgm{idx_hor,idx_g}(:,t);
S = mo.params.S0(1);
w = mo.params.w_argmax(idx_hor);

%% update mean and variance
idx = find(~isnan(data.allshowntrees(t,1:3))); % Changed

% prediction error
da = data.alltrees(t,5) - Q(idx); %size of apple at time t

% Kalman Gain
K = sgm(idx)^2 / (sgm(idx)^2 + S^2);

% update Q-value (argmax)
Q(idx) = Q(idx) + K * da + w*max(data.alltrees(t,5), Q(idx));

% update variance
sgm(idx) = sqrt(sgm(idx)^2 - K * sgm(idx)^2);

%% write to mat
mo.mat.Q{idx_hor,idx_g}(:,t+1) = Q;
mo.mat.sgm{idx_hor,idx_g}(:,t+1) = sgm;
mo.mat.da{idx_hor,idx_g}(t) = da;
mo.mat.k{idx_hor,idx_g}(t) = K;
