function mo = lapse(mo,idx_hor,idx_g,t)

%% get params

% irreducible noise parameter xi
if length(mo.params.xi) > 1
    xi = mo.params.xi(idx_hor);
else
    xi = mo.params.xi;
end

%% data 
pi = mo.mat.pi{idx_hor,idx_g}(:,t);

%% add lapse
pi = pi .* (1 - xi) + xi / 4;

%% plug back to mo
mo.mat.pi{idx_hor,idx_g}(:,t) = pi;