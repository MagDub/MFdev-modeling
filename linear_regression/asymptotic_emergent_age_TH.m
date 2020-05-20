function conv_age = asymptotic_emergent_age_TH(org_ages, peak_age)

% remove peake age
age = org_ages - mean(org_ages);
%age = org_ages;

% make it quadratic
age = age - (org_ages - peak_age).^2;
%age = - (org_ages - peak_age).^2;

% put it in reasonable bounds and mean centre
age = age - min(age);
age = age ./ max(age);
age = age - mean(age);


% make it 'asymptotic' by replacing values > peak
[val,idx] = max(age);
age(idx:end) = val;

% output
conv_age = age;

end