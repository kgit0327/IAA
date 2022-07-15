function dqdt = OdeFunc2(t, q, RJT, a_tor, Constants)
    
    g1 = Constants.g(1);
    g2 = Constants.g(2);
    g3 = Constants.g(3);
    
    m0u = Constants.m(2);
    m1 = Constants.m(3);
    m2 = Constants.m(4);
    m3 = Constants.m(5);
    m4 = Constants.m(6);
    
    a_tor_1 = a_tor(1, iFrame_);
    a_tor_2 = a_tor(2, iFrame_);
    a_tor_3 = a_tor(3, iFrame_);
    
    L01 = L0(1, iFrame_);
    L02 = L0(2, iFrame_);
    L03 = L0(3, iFrame_);
    
    L0d1 = L0d(1, iFrame_);
    L0d2 = L0d(2, iFrame_);
    L0d3 = L0d(3, iFrame_);
    
    L11 = L1(1, iFrame_);
    L12 = L1(2, iFrame_);
    L13 = L1(3, iFrame_);
    
    L21 = L2(1, iFrame_);
    L22 = L2(2, iFrame_);
    L23 = L2(3, iFrame_);
    
    L31 = L3(1, iFrame_);
    L32 = L3(2, iFrame_);
    L33 = L3(3, iFrame_);
    
    Lg01 = Lg0(1, iFrame_);
    Lg02 = Lg0(2, iFrame_);
    Lg03 = Lg0(3, iFrame_);
    
    Lg11 = Lg1(1, iFrame_);
    Lg12 = Lg1(2, iFrame_);
    Lg13 = Lg1(3, iFrame_);
    
    Lg21 = Lg2(1, iFrame_);
    Lg22 = Lg2(2, iFrame_);
    Lg23 = Lg2(3, iFrame_);
    
    Lg31 = Lg3(1, iFrame_);
    Lg32 = Lg3(2, iFrame_);
    Lg33 = Lg3(3, iFrame_);
    
    Lg41 = Lg4(1, iFrame_);
    Lg42 = Lg4(2, iFrame_);
    Lg43 = Lg4(3, iFrame_);

    thd0_1 = thd0(1, iFrame_);
    thd0_2 = thd0(2, iFrame_);
    thd0_3 = thd0(3, iFrame_);
    
    thd1_1 = thd1(1, iFrame_);
    thd1_2 = thd1(2, iFrame_);
    thd1_3 = thd1(3, iFrame_);
    
    thd2_1 = thd2(1, iFrame_);
    thd2_2 = thd2(2, iFrame_);
    thd2_3 = thd2(3, iFrame_);
    
    thd3_1 = thd3(1, iFrame_);
    thd3_2 = thd3(2, iFrame_);
    thd3_3 = thd3(3, iFrame_);
    
    thd4_1 = thd4(1, iFrame_);
    thd4_2 = thd4(2, iFrame_);
    thd4_3 = thd4(3, iFrame_);

    om0u_1 = om0u(1, iFrame_);
    om0u_2 = om0u(2, iFrame_);
    om0u_3 = om0u(3, iFrame_);
    
    om1_1 = om1(1, iFrame_);
    om1_2 = om1(2, iFrame_);
    om1_3 = om1(3, iFrame_);
    
    om2_1 = om2(1, iFrame_);
    om2_2 = om2(2, iFrame_);
    om2_3 = om2(3, iFrame_);
    
    om3_1 = om3(1, iFrame_);
    om3_2 = om3(2, iFrame_);
    om3_3 = om3(3, iFrame_);
    
    om4_1 = om4(1, iFrame_);
    om4_2 = om4(2, iFrame_);
    om4_3 = om4(3, iFrame_);

    omd0l_1 = omd0l(1, iFrame_);
    omd0l_2 = omd0l(2, iFrame_);
    omd0l_3 = omd0l(3, iFrame_);

    Om0_1 = Om0(1, iFrame_);
    Om0_2 = Om0(2, iFrame_);
    Om0_3 = Om0(3, iFrame_);
    
    Om1_1 = Om1(1, iFrame_);
    Om1_2 = Om1(2, iFrame_);
    Om1_3 = Om1(3, iFrame_);
    
    Om2_1 = Om2(1, iFrame_);
    Om2_2 = Om2(2, iFrame_);
    Om2_3 = Om2(3, iFrame_);
    
    Om3_1 = Om3(1, iFrame_);
    Om3_2 = Om3(2, iFrame_);
    Om3_3 = Om3(3, iFrame_);
    
    Om4_1 = Om4(1, iFrame_);
    Om4_2 = Om4(2, iFrame_);
    Om4_3 = Om4(3, iFrame_);

    I_gcs01_1 = I_gcs0(1, 1, iFrame_);
    I_gcs01_2 = I_gcs0(1, 2, iFrame_);
    I_gcs01_3 = I_gcs0(1, 3, iFrame_);
    I_gcs02_1 = I_gcs0(2, 1, iFrame_);
    I_gcs02_2 = I_gcs0(2, 2, iFrame_);
    I_gcs02_3 = I_gcs0(2, 3, iFrame_);
    I_gcs03_1 = I_gcs0(3, 1, iFrame_);
    I_gcs03_2 = I_gcs0(3, 2, iFrame_);
    I_gcs03_3 = I_gcs0(3, 3, iFrame_);

    I_gcs11_1 = I_gcs1(1, 1, iFrame_);
    I_gcs11_2 = I_gcs1(1, 2, iFrame_);
    I_gcs11_3 = I_gcs1(1, 3, iFrame_);
    I_gcs12_1 = I_gcs1(2, 1, iFrame_);
    I_gcs12_2 = I_gcs1(2, 2, iFrame_);
    I_gcs12_3 = I_gcs1(2, 3, iFrame_);
    I_gcs13_1 = I_gcs1(3, 1, iFrame_);
    I_gcs13_2 = I_gcs1(3, 2, iFrame_);
    I_gcs13_3 = I_gcs1(3, 3, iFrame_);

    I_gcs21_1 = I_gcs2(1, 1, iFrame_);
    I_gcs21_2 = I_gcs2(1, 2, iFrame_);
    I_gcs21_3 = I_gcs2(1, 3, iFrame_);
    I_gcs22_1 = I_gcs2(2, 1, iFrame_);
    I_gcs22_2 = I_gcs2(2, 2, iFrame_);
    I_gcs22_3 = I_gcs2(2, 3, iFrame_);
    I_gcs23_1 = I_gcs2(3, 1, iFrame_);
    I_gcs23_2 = I_gcs2(3, 2, iFrame_);
    I_gcs23_3 = I_gcs2(3, 3, iFrame_);

    I_gcs31_1 = I_gcs3(1, 1, iFrame_);
    I_gcs31_2 = I_gcs3(1, 2, iFrame_);
    I_gcs31_3 = I_gcs3(1, 3, iFrame_);
    I_gcs32_1 = I_gcs3(2, 1, iFrame_);
    I_gcs32_2 = I_gcs3(2, 2, iFrame_);
    I_gcs32_3 = I_gcs3(2, 3, iFrame_);
    I_gcs33_1 = I_gcs3(3, 1, iFrame_);
    I_gcs33_2 = I_gcs3(3, 2, iFrame_);
    I_gcs33_3 = I_gcs3(3, 3, iFrame_);

    I_gcs41_1 = I_gcs4(1, 1, iFrame_);
    I_gcs41_2 = I_gcs4(1, 2, iFrame_);
    I_gcs41_3 = I_gcs4(1, 3, iFrame_);
    I_gcs42_1 = I_gcs4(2, 1, iFrame_);
    I_gcs42_2 = I_gcs4(2, 2, iFrame_);
    I_gcs42_3 = I_gcs4(2, 3, iFrame_);
    I_gcs43_1 = I_gcs4(3, 1, iFrame_);
    I_gcs43_2 = I_gcs4(3, 2, iFrame_);
    I_gcs43_3 = I_gcs4(3, 3, iFrame_);
    
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
    
    GRA = find_GRA2(L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,g1,g2,g3,m1,m2,m3,m4,m0u);
    INT = find_INT2(I_gcs01_1,I_gcs01_2,I_gcs01_3,I_gcs02_1,I_gcs02_2,I_gcs02_3,I_gcs03_1,I_gcs03_2,I_gcs03_3,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,Om0_1,Om0_2,Om0_3,Om1_1,Om1_2,Om1_3,Om2_1,Om2_2,Om2_3,Om3_1,Om3_2,Om3_3,Om4_1,Om4_2,Om4_3,a_tor_1,a_tor_2,a_tor_3,m1,m2,m3,m4,m0u,om1_1,om1_2,om1_3,om2_1,om2_2,om2_3,om3_1,om3_2,om3_3,om4_1,om4_2,om4_3,om0u_1,om0u_2,om0u_3,omd0l_1,omd0l_2,omd0l_3,thd0_1,thd0_2,thd0_3,thd1_1,thd1_2,thd1_3,thd2_1,thd2_2,thd2_3,thd3_1,thd3_2,thd3_3,thd4_1,thd4_2,thd4_3);
    Itheta = find_Itheta2(I_gcs01_1,I_gcs01_2,I_gcs01_3,I_gcs02_1,I_gcs02_2,I_gcs02_3,I_gcs03_1,I_gcs03_2,I_gcs03_3,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m1,m2,m3,m4,m0u);

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
