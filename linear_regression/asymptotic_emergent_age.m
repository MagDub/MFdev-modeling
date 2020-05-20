function conv_age = asymptotic_emergent_age(org_ages, peak_age)

conv_age = org_ages;

n=find(org_ages>=peak_age);

conv_age(n) = peak_age;

end