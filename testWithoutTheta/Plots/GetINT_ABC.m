function INT = GetINT_ABC(ExpDat, iData)

    addpath('../')
    addpath('../../')    
    
    Constants = GetConstants2(ExpDat, iData);
    tDeps = GetTDepend2(ExpDat, iData);
    
    NUM_FRAME = ExpDat(iData).nFr;

    m0u = Constants.m(2);
    m1 = Constants.m(3);
    m2 = Constants.m(4);
    m3 = Constants.m(5);
    m4 = Constants.m(6);
        
    L0l = tDeps.L0l;
    L0 = tDeps.L0;
    L1 = tDeps.L1;
    L2 = tDeps.L2;
    L3 = tDeps.L3;
    
    Lg0l = tDeps.Lg0l;
    Lg0 = tDeps.Lg0;
    Lg1 = tDeps.Lg1;
    Lg2 = tDeps.Lg2;
    Lg3 = tDeps.Lg3;
    Lg4 = tDeps.Lg4;

    Om0 = tDeps.Om0;
    Om1 = tDeps.Om1;
    Om2 = tDeps.Om2;
    Om3 = tDeps.Om3;
    Om4 = tDeps.Om4;

    Rj0 = tDeps.Rj0;
    Rj1 = tDeps.Rj1;
    Rj2 = tDeps.Rj2;
    Rj3 = tDeps.Rj3;
    Rj4 = tDeps.Rj4;

    thd0 = tDeps.thd0;
    thd1 = tDeps.thd1;
    thd2 = tDeps.thd2;
    thd3 = tDeps.thd3;
    thd4 = tDeps.thd4;
    
    for iFrame = 1 : NUM_FRAME
        A0(:, iFrame) = cross(Om0(:, iFrame), Rj0(:, :, iFrame) * thd0(:, iFrame));
        A1(:, iFrame) = cross(Om1(:, iFrame), Rj1(:, :, iFrame) * thd1(:, iFrame));
        A2(:, iFrame) = cross(Om2(:, iFrame), Rj2(:, :, iFrame) * thd2(:, iFrame));
        A3(:, iFrame) = cross(Om3(:, iFrame), Rj3(:, :, iFrame) * thd3(:, iFrame));
        A4(:, iFrame) = cross(Om4(:, iFrame), Rj4(:, :, iFrame) * thd4(:, iFrame));
    end
    
    om0l = tDeps.om0l;
    om0u = tDeps.om0u;
    om1 = tDeps.om1;
    om2 = tDeps.om2;
    om3 = tDeps.om3;
    om4 = tDeps.om4;

    omd0l = tDeps.omd0l;

    B0 = cross(om0u, cross(om0u, L0));
    Bg0 = cross(om0u, cross(om0u, Lg0));
    B1 = cross(om1, cross(om1, L1));
    Bg1 = cross(om1, cross(om1, Lg1));
    B2 = cross(om2, cross(om2, L2));
    Bg2 = cross(om2, cross(om2, Lg2));
    B3 = cross(om3, cross(om3, L3));
    Bg3 = cross(om3, cross(om3, Lg3));
    Bg4 = cross(om4, cross(om4, Lg4));

    fprintf('A, B, L defined\t')
    toc

    I_gcs0 = tDeps.I_gcs0;
    I_gcs1 = tDeps.I_gcs1;
    I_gcs2 = tDeps.I_gcs2;
    I_gcs3 = tDeps.I_gcs3;
    I_gcs4 = tDeps.I_gcs4;
    
    for iFrame = 1 : NUM_FRAME
        C0(:, iFrame) = cross(om0u(:, iFrame), I_gcs0(:, :, iFrame) * om0u(:, iFrame));
        C1(:, iFrame) = cross(om1(:, iFrame), I_gcs1(:, :, iFrame) * om1(:, iFrame));
        C2(:, iFrame) = cross(om2(:, iFrame), I_gcs2(:, :, iFrame) * om2(:, iFrame));
        C3(:, iFrame) = cross(om3(:, iFrame), I_gcs3(:, :, iFrame) * om3(:, iFrame));
        C4(:, iFrame) = cross(om4(:, iFrame), I_gcs4(:, :, iFrame) * om4(:, iFrame));
    end
    
    fprintf('Initialized\n')
    toc
    
    tic
    for iFrame = 1 : NUM_FRAME
        
        A01 = A0(1, iFrame);
        A02 = A0(2, iFrame);
        A03 = A0(3, iFrame);

        A11 = A1(1, iFrame);
        A12 = A1(2, iFrame);
        A13 = A1(3, iFrame);

        A21 = A2(1, iFrame);
        A22 = A2(2, iFrame);
        A23 = A2(3, iFrame);

        A31 = A3(1, iFrame);
        A32 = A3(2, iFrame);
        A33 = A3(3, iFrame);

        A41 = A4(1, iFrame);
        A42 = A4(2, iFrame);
        A43 = A4(3, iFrame);

        B01 = B0(1, iFrame);
        B02 = B0(2, iFrame);
        B03 = B0(3, iFrame);

        B11 = B1(1, iFrame);
        B12 = B1(2, iFrame);
        B13 = B1(3, iFrame);

        B21 = B2(1, iFrame);
        B22 = B2(2, iFrame);
        B23 = B2(3, iFrame);

        B31 = B3(1, iFrame);
        B32 = B3(2, iFrame);
        B33 = B3(3, iFrame);

        Bg01 = Bg0(1, iFrame);
        Bg02 = Bg0(2, iFrame);
        Bg03 = Bg0(3, iFrame);

        Bg11 = Bg1(1, iFrame);
        Bg12 = Bg1(2, iFrame);
        Bg13 = Bg1(3, iFrame);

        Bg21 = Bg2(1, iFrame);
        Bg22 = Bg2(2, iFrame);
        Bg23 = Bg2(3, iFrame);

        Bg31 = Bg3(1, iFrame);
        Bg32 = Bg3(2, iFrame);
        Bg33 = Bg3(3, iFrame);

        Bg41 = Bg4(1, iFrame);
        Bg42 = Bg4(2, iFrame);
        Bg43 = Bg4(3, iFrame);

        C01 = C0(1, iFrame);
        C02 = C0(2, iFrame);
        C03 = C0(3, iFrame);

        C11 = C1(1, iFrame);
        C12 = C1(2, iFrame);
        C13 = C1(3, iFrame);

        C21 = C2(1, iFrame);
        C22 = C2(2, iFrame);
        C23 = C2(3, iFrame);

        C31 = C3(1, iFrame);
        C32 = C3(2, iFrame);
        C33 = C3(3, iFrame);

        C41 = C4(1, iFrame);
        C42 = C4(2, iFrame);
        C43 = C4(3, iFrame);

        L0l1 = L0l(1, iFrame);
        L0l2 = L0l(2, iFrame);
        L0l3 = L0l(3, iFrame);

        L01 = L0(1, iFrame);
        L02 = L0(2, iFrame);
        L03 = L0(3, iFrame);
        
        L11 = L1(1, iFrame);
        L12 = L1(2, iFrame);
        L13 = L1(3, iFrame);
        
        L21 = L2(1, iFrame);
        L22 = L2(2, iFrame);
        L23 = L2(3, iFrame);
        
        L31 = L3(1, iFrame);
        L32 = L3(2, iFrame);
        L33 = L3(3, iFrame);

        Lg0l1 = Lg0l(1, iFrame);
        Lg0l2 = Lg0l(2, iFrame);
        Lg0l3 = Lg0l(3, iFrame);

        Lg01 = Lg0(1, iFrame);
        Lg02 = Lg0(2, iFrame);
        Lg03 = Lg0(3, iFrame);
        
        Lg11 = Lg1(1, iFrame);
        Lg12 = Lg1(2, iFrame);
        Lg13 = Lg1(3, iFrame);
        
        Lg21 = Lg2(1, iFrame);
        Lg22 = Lg2(2, iFrame);
        Lg23 = Lg2(3, iFrame);
        
        Lg31 = Lg3(1, iFrame);
        Lg32 = Lg3(2, iFrame);
        Lg33 = Lg3(3, iFrame);
        
        Lg41 = Lg4(1, iFrame);
        Lg42 = Lg4(2, iFrame);
        Lg43 = Lg4(3, iFrame);

        om0l_1 = om0l(1, iFrame);
        om0l_2 = om0l(2, iFrame);
        om0l_3 = om0l(3, iFrame);

        omd0l_1 = omd0l(1, iFrame);
        omd0l_2 = omd0l(2, iFrame);
        omd0l_3 = omd0l(3, iFrame);


        I_gcs01_1 = I_gcs0(1, 1, iFrame);
        I_gcs01_2 = I_gcs0(1, 2, iFrame);
        I_gcs01_3 = I_gcs0(1, 3, iFrame);
        I_gcs02_1 = I_gcs0(2, 1, iFrame);
        I_gcs02_2 = I_gcs0(2, 2, iFrame);
        I_gcs02_3 = I_gcs0(2, 3, iFrame);
        I_gcs03_1 = I_gcs0(3, 1, iFrame);
        I_gcs03_2 = I_gcs0(3, 2, iFrame);
        I_gcs03_3 = I_gcs0(3, 3, iFrame);
    
        I_gcs11_1 = I_gcs1(1, 1, iFrame);
        I_gcs11_2 = I_gcs1(1, 2, iFrame);
        I_gcs11_3 = I_gcs1(1, 3, iFrame);
        I_gcs12_1 = I_gcs1(2, 1, iFrame);
        I_gcs12_2 = I_gcs1(2, 2, iFrame);
        I_gcs12_3 = I_gcs1(2, 3, iFrame);
        I_gcs13_1 = I_gcs1(3, 1, iFrame);
        I_gcs13_2 = I_gcs1(3, 2, iFrame);
        I_gcs13_3 = I_gcs1(3, 3, iFrame);
    
        I_gcs21_1 = I_gcs2(1, 1, iFrame);
        I_gcs21_2 = I_gcs2(1, 2, iFrame);
        I_gcs21_3 = I_gcs2(1, 3, iFrame);
        I_gcs22_1 = I_gcs2(2, 1, iFrame);
        I_gcs22_2 = I_gcs2(2, 2, iFrame);
        I_gcs22_3 = I_gcs2(2, 3, iFrame);
        I_gcs23_1 = I_gcs2(3, 1, iFrame);
        I_gcs23_2 = I_gcs2(3, 2, iFrame);
        I_gcs23_3 = I_gcs2(3, 3, iFrame);
    
        I_gcs31_1 = I_gcs3(1, 1, iFrame);
        I_gcs31_2 = I_gcs3(1, 2, iFrame);
        I_gcs31_3 = I_gcs3(1, 3, iFrame);
        I_gcs32_1 = I_gcs3(2, 1, iFrame);
        I_gcs32_2 = I_gcs3(2, 2, iFrame);
        I_gcs32_3 = I_gcs3(2, 3, iFrame);
        I_gcs33_1 = I_gcs3(3, 1, iFrame);
        I_gcs33_2 = I_gcs3(3, 2, iFrame);
        I_gcs33_3 = I_gcs3(3, 3, iFrame);
    
        I_gcs41_1 = I_gcs4(1, 1, iFrame);
        I_gcs41_2 = I_gcs4(1, 2, iFrame);
        I_gcs41_3 = I_gcs4(1, 3, iFrame);
        I_gcs42_1 = I_gcs4(2, 1, iFrame);
        I_gcs42_2 = I_gcs4(2, 2, iFrame);
        I_gcs42_3 = I_gcs4(2, 3, iFrame);
        I_gcs43_1 = I_gcs4(3, 1, iFrame);
        I_gcs43_2 = I_gcs4(3, 2, iFrame);
        I_gcs43_3 = I_gcs4(3, 3, iFrame);
    
        INT_A0 = find_INT_A0(A01,A02,A03,I_gcs01_1,I_gcs01_2,I_gcs01_3,I_gcs02_1,I_gcs02_2,I_gcs02_3,I_gcs03_1,I_gcs03_2,I_gcs03_3,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m1,m2,m3,m4,m0u);
        INT_A1 = find_INT_A1(A11,A12,A13,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m1,m2,m3,m4);
        INT_A2 = find_INT_A2(A21,A22,A23,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m2,m3,m4);
        INT_A3 = find_INT_A3(A31,A32,A33,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m3,m4);
        INT_A4 = find_INT_A4(A41,A42,A43,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg41,Lg42,Lg43,m4);

        INT_B0 = find_INT_B0(B01,B02,B03,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m1,m2,m3,m4);
        INT_B1 = find_INT_B1(B11,B12,B13,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m2,m3,m4);
        INT_B2 = find_INT_B2(B21,B22,B23,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m3,m4);
        INT_B3 = find_INT_B3(B31,B32,B33,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg41,Lg42,Lg43,m4);

        INT_Bg0 = find_INT_Bg0(Bg01,Bg02,Bg03,Lg01,Lg02,Lg03,m0u);
        INT_Bg1 = find_INT_Bg1(Bg11,Bg12,Bg13,L01,L02,L03,Lg11,Lg12,Lg13,m1);
        INT_Bg2 = find_INT_Bg2(Bg21,Bg22,Bg23,L01,L02,L03,L11,L12,L13,Lg21,Lg22,Lg23,m2);
        INT_Bg3 = find_INT_Bg3(Bg31,Bg32,Bg33,L01,L02,L03,L11,L12,L13,L21,L22,L23,Lg31,Lg32,Lg33,m3);
        INT_Bg4 = find_INT_Bg4(Bg41,Bg42,Bg43,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg41,Lg42,Lg43,m4);

        INT_C0 = find_INT_C0(C01,C02,C03);
        INT_C1 = find_INT_C1(C11,C12,C13);
        INT_C2 = find_INT_C2(C21,C22,C23);
        INT_C3 = find_INT_C3(C31,C32,C33);
        INT_C4 = find_INT_C4(C41,C42,C43);

        INT_Other = find_INT_Other(I_gcs01_1,I_gcs01_2,I_gcs01_3,I_gcs02_1,I_gcs02_2,I_gcs02_3,I_gcs03_1,I_gcs03_2,I_gcs03_3,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,L0l1,L0l2,L0l3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,Lg0l1,Lg0l2,Lg0l3,m1,m2,m3,m4,m0u,om0l_1,om0l_2,om0l_3,omd0l_1,omd0l_2,omd0l_3);

        INT(iData).A0(:, iFrame) = INT_A0;
        INT(iData).A1(:, iFrame) = INT_A1;
        INT(iData).A2(:, iFrame) = INT_A2;
        INT(iData).A3(:, iFrame) = INT_A3;
        INT(iData).A4(:, iFrame) = INT_A4;

        INT(iData).B0(:, iFrame) = INT_B0;
        INT(iData).B1(:, iFrame) = INT_B1;
        INT(iData).B2(:, iFrame) = INT_B2;
        INT(iData).B3(:, iFrame) = INT_B3;

        INT(iData).Bg0(:, iFrame) = INT_Bg0;
        INT(iData).Bg1(:, iFrame) = INT_Bg1;
        INT(iData).Bg2(:, iFrame) = INT_Bg2;
        INT(iData).Bg3(:, iFrame) = INT_Bg3;
        INT(iData).Bg4(:, iFrame) = INT_Bg4;

        INT(iData).C0(:, iFrame) = INT_C0;
        INT(iData).C1(:, iFrame) = INT_C1;
        INT(iData).C2(:, iFrame) = INT_C2;
        INT(iData).C3(:, iFrame) = INT_C3;
        INT(iData).C4(:, iFrame) = INT_C4;

        INT(iData).O(:, iFrame) = INT_Other;

        

        
    end
end
