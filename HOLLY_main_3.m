function HOLLY_main_3(ID)

    ID_mat = [127,129,130,132,126];
    
    ID_n = ID_mat(ID);
    
    HOLLY_cv_mod4_hybrid_4param_xi_nov_both_2Hor_2nov_1w_Q01(ID_n);
    HOLLY_cv_mod5_UCB_2param_2Hor_Q01(ID_n);
    HOLLY_cv_mod6_UCB_2param_2Hor_2nov_Q01(ID_n);
    HOLLY_cv_mod7_UCB_3param_2Hor_Q01(ID_n);
    HOLLY_cv_mod8_UCB_3param_noveltybonus_2Hor_2nov_Q01(ID_n);
    HOLLY_cv_mod9_thompson_2param_Q01(ID_n);
    HOLLY_cv_mod10_thompson_3param_2Hor_Q01(ID_n);
    HOLLY_cv_mod11_thompson_2param_nov_2Hor_2nov_Q01(ID_n);
    HOLLY_cv_mod12_thompson_3param_nov_2Hor_2nov_Q01(ID_n);

end