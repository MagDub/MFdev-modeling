function [Q_new, sgm_new] = kalman_filt_indiv(Q, sgm, S, size_apple)

% prediction error
da = size_apple - Q;

% Kalman Gain
K = sgm^2 / (sgm^2 + S^2);

% update Q-value
Q_new = Q + K * da;

% update variance
sgm_new = sqrt(sgm^2 - K * sgm^2);
        
end
