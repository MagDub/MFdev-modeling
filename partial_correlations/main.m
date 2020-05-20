clear

load('data\xi_LH.mat')
load('data\xi_SH.mat')

load('data\eta_LH.mat')
load('data\eta_SH.mat')

load('data\sgm0_LH.mat')
load('data\sgm0_SH.mat')

load('data\adhd.mat')
load('data\adhd_new.mat')
load('data\age.mat')

Mode = 'Spearman';

X = [xi_LH]; % xi_SH eta_LH eta_SH sgm0_LH sgm0_SH];
Y = adhd_new;
Z = age;


% % Correlations
[R,sig] = corrcoef(X,Y,Mode);
disp(strcat('R= ', num2str(round(R,3)')))
disp(strcat('p= ', num2str(round(sig,3)')))

% % Partial correlations (controlling for age)
% [R,sig,ci1,ci2] = partcorrcoef(X,Y,Z,Mode);
% disp(strcat('R= ', num2str(round(R,3)')))
% disp(strcat('p= ', num2str(round(sig,3)')))

% [rho, pval] = corr(X,Y,'Type',Mode);
% disp(strcat('R= ', num2str(round(rho,3)')))
% disp(strcat('p= ', num2str(round(pval,3)')))