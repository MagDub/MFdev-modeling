function [Q_new, sgm_new] = argmax_indiv(Q, sgm, size_apple)


%% update mean and variance    
Q_new = max(size_apple,Q);

sgm_new = sgm - 1;

        
end
