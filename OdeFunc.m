function dqdt = OdeFunc(t, q, RJT, r_tor, Constants)

    
    l0 = Constants.l(1);
    l1 = Constants.l(2);
    l2 = Constants.l(3);
    l3 = Constants.l(4);
    l4 = Constants.l(5);
    
    m0 = Constants.m(1);
    m1 = Constants.m(2);
    m2 = Constants.m(3);
    m3 = Constants.m(4);
    m4 = Constants.m(5);
    
    I_01 = Constants.I(1, 1);
    I_02 = Constants.I(1, 2);
    I_03 = Constants.I(1, 3);
    I_11 = Constants.I(2, 1);
    I_12 = Constants.I(2, 2);
    I_13 = Constants.I(2, 3);
    I_21 = Constants.I(3, 1);
    I_22 = Constants.I(3, 2);
    I_23 = Constants.I(3, 3);
    I_31 = Constants.I(4, 1);
    I_32 = Constants.I(4, 2);
    I_33 = Constants.I(4, 3);
    I_41 = Constants.I(5, 1);
    I_42 = Constants.I(5, 2);
    I_43 = Constants.I(5, 3);
    
    th0_1 = q(1);
    th0_2 = q(2);
    th0_3 = q(3);
    
    thd0_1 = q(4);
    thd0_2 = q(5);
    thd0_3 = q(6);
    
    th1_1 = q(7);
    th1_2 = q(8);
    th1_3 = q(9);
    
    thd1_1 = q(10);
    thd1_2 = q(11);
    thd1_3 = q(12);
    
    th2_1 = q(13);
    th2_2 = q(14);
    th2_3 = q(15);
    
    thd2_1 = q(16);
    thd2_2 = q(17);
    thd2_3 = q(18);
    
    th3_1 = q(19);
    th3_2 = q(20);
    th3_3 = q(21);
    
    thd3_1 = q(22);
    thd3_2 = q(23);
    thd3_3 = q(24);
    
    th4_1 = q(25);
    th4_2 = q(26);
    th4_3 = q(27);
    
    thd4_1 = q(28);
    thd4_2 = q(29);
    thd4_3 = q(30);
    
    a_tor = dif3(dif3(r_tor, size(r_tor, 2), 1/200), size(r_tor, 2), 1/200);
    at = 1:size(a_tor);
    a_tor_1 = interp(at, a_tor(1, :), t, 'spline');
    a_tor_2 = interp(at, a_tor(2, :), t, 'spline');
    a_tor_3 = interp(at, a_tor(3, :), t, 'spline');
    
    GRA = find_GRA(l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3);
    INT = find_INT(I_01,I_02,I_03,I_11,I_12,I_13,I_21,I_22,I_23,I_31,I_32,I_33,I_41,I_42,I_43,a_tor_1,a_tor_2,a_tor_3,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3,thd0_1,thd0_2,thd0_3,thd1_1,thd1_2,thd1_3,thd2_1,thd2_2,thd2_3,thd3_1,thd3_2,thd3_3,thd4_1,thd4_2,thd4_3);
    Itheta = find_Itheta(I_01,I_02,I_03,I_11,I_12,I_13,I_21,I_22,I_23,I_31,I_32,I_33,I_41,I_42,I_43,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3);

    th2d = Itheta \ (RJT + INT + GRA);

    th2d01 = th2d(1);
    th2d02 = th2d(2);
    th2d03 = th2d(3);
    th2d11 = th2d(4);
    th2d12 = th2d(5);
    th2d13 = th2d(6);
    th2d21 = th2d(7);
    th2d22 = th2d(8);
    th2d23 = th2d(9);
    th2d31 = th2d(10);
    th2d32 = th2d(11);
    th2d33 = th2d(12);
    th2d41 = th2d(13);
    th2d42 = th2d(14);
    th2d43 = th2d(15);

    dqdt = [...
            thd0_1, thd0_2, thd0_3, ...
            th2d01, th2d02, th2d03, ...
            thd1_1, thd1_2, thd1_3, ...
            th2d11, th2d12, th2d13, ...
            thd2_1, thd2_2, thd2_3, ...
            th2d21, th2d22, th2d23, ...
            thd3_1, thd3_2, thd3_3, ...
            th2d31, th2d32, th2d33, ...
            thd4_1, thd4_2, thd4_3, ...
            th2d41, th2d42, th2d43, ...
            ];
end
