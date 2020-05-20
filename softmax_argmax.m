function pi = softmax_argmax(Vs,mo,idx_hor, idx_g)

%% get params
% temperature parameter
if length(mo.params.tau) > 1
    tau = mo.params.tau(idx_hor);
else
    tau = mo.params.tau;
end

beta1 = mo.params.beta1(idx_hor);
beta2 = mo.params.beta2(idx_hor);

Q0 = mo.params.Q0(idx_g);

size_appleA = mo.mat.appleA{idx_hor,idx_g}';
size_appleB = mo.mat.appleB{idx_hor,idx_g};
size_appleD = mo.mat.appleD{idx_hor,idx_g};

[~, index_] = sort(size_appleA);
 
% % betamax * biggest + betamin * midsize + beta3 * smallest
if isempty(size_appleA)
    Qs(1,1) = size_appleB;  %B
    Qs(1,2) = Q0;           %C
    Qs(1,3) = size_appleD;  %D
elseif isempty(size_appleB)
    Qs(1,1) = beta1*size_appleA(index_(3)) + beta2*size_appleA(index_(2)) - (1-beta1-beta2)*size_appleA(index_(1)); %A
    Qs(1,2) = Q0;           %C
    Qs(1,3) = size_appleD;  %D
elseif isempty(size_appleD)
    Qs(1,1) = beta1*size_appleA(index_(3)) + beta2*size_appleA(index_(2)) - (1-beta1-beta2)*size_appleA(index_(1)); %A
    Qs(1,2) = size_appleB;  %B
    Qs(1,3) = Q0;           %C
else
    Qs(1,1) = beta1*size_appleA(index_(3)) + beta2*size_appleA(index_(2)) - (1-beta1-beta2)*size_appleA(index_(1)); %A
    Qs(1,2) = size_appleB;  %B
    Qs(1,3) = size_appleD;  %D
end

%% data hygiene
%VsT = (Vs - max(Vs)) ./ tau; % remove max to avoid numerical overflow (cf Friston spm_softmax)
QsT = (Qs - max(Qs)) ./ tau; % remove max to avoid numerical overflow (cf Friston spm_softmax)

%% softmax transformation 
% pi = (exp(VsT) / sum(exp(VsT)));
pi = (exp(QsT) / sum(exp(QsT)));

