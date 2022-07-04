function [INT, GRA, Itheta] = GetTorques_
    tic
    syms m0 m1 m2 m3 m4 
    syms g [3 1] 
    syms I0 [1 3] 
    syms I1 [1 3] 
    syms I2 [1 3] 
    syms I3 [1 3] 
    syms I4 [1 3] 
    syms th0(t) [3 1]
    syms th1(t) [3 1]
    syms th2(t) [3 1]
    syms th3(t) [3 1]
    syms th4(t) [3 1]
    syms l0 l1 l2 l3 l4 
    syms r_tor(t) [3 1]

    syms th0_ om0_ omd0_ [3 1] real
    syms th1_ om1_ omd1_ [3 1] real
    syms th2_ om2_ omd2_ [3 1] real
    syms th3_ om3_ omd3_ [3 1] real
    syms th4_ om4_ omd4_ [3 1] real
    syms th2d0_ [3 1] real
    syms th2d1_ [3 1] real
    syms th2d2_ [3 1] real
    syms th2d3_ [3 1] real
    syms th2d4_ [3 1] real
    syms thd0_ [3 1] real
    syms thd1_ [3 1] real
    syms thd2_ [3 1] real
    syms thd3_ [3 1] real
    syms thd4_ [3 1] real
    syms r_tor_ [3 1] real
    syms v_tor_ [3 1] real
    syms a_tor_ [3 1] real

    fprintf('syms Done\t')
    toc


    %% from define_positions

    syms_Replaced = [
    th0 diff(th0, t) diff(th0, t, t), ...
    th1 diff(th1, t) diff(th1, t, t), ...
    th2 diff(th2, t) diff(th2, t, t), ...
    th3 diff(th3, t) diff(th3, t, t), ...
    th4 diff(th4, t) diff(th4, t, t), ...
    r_tor diff(r_tor, t) diff(r_tor, t, t), ...
    ];

    syms_Replacing = [
        th0_ thd0_ th2d0_ ...
        th1_ thd1_ th2d1_ ...
        th2_ thd2_ th2d2_ ...
        th3_ thd3_ th2d3_ ...
        th4_ thd4_ th2d4_ ...
        r_tor_ v_tor_ a_tor_ ...
        ];
    
    subs_pre = @(input) subs( input, syms_Replaced, syms_Replacing);
%     simplify_subs_pre = @(input) simplify( subs_pre( input ) );

    
    %%
    tic
    syms th_ [3 1]
    R1(th_) = [1,0,0;0,cos(th_1),-sin(th_1);0,sin(th_1),cos(th_1)];
    R2(th_) = [cos(th_2),0,sin(th_2);0,1,0;-sin(th_2),0,cos(th_2)];
    R3(th_) = [cos(th_3),-sin(th_3),0;sin(th_3),cos(th_3),0;0,0,1];
    R(th_) = R3*R2*R1;
    
    TorCS = R(th01, th02, th03);
    % x0 = TorCS(:, 1);
    % y0 = TorCS(:, 2);
    % z0 = TorCS(:, 3);
    UaCS = R(th11, th12, th13); %*TorCS;
    FaCS = R(th21, th22, th23); %*UaCS;
    HdCS = R(th31, th32, th33); %*FaCS;
    RaCS = R(th41, th42, th43); %*HdCS;

    % Define joint coordinate system, x: distal z, y: cross(z, x), z: proximal x 
    TlowCS(:, 1) = TorCS(:, 3);
    TlowCS(:, 3) = TorCS(:, 1);
    TlowCS(:, 2) = unitvec(cross(TlowCS(:, 3), TlowCS(:, 1)));

    ShCS(:, 1) = UaCS(:, 3);
    ShCS(:, 3) = TorCS(:, 1);
    ShCS(:, 2) = unitvec(cross(ShCS(:, 3), ShCS(:, 1)));

    ElCS(:, 1) = FaCS(:, 3);
    ElCS(:, 3) = UaCS(:, 1);
    ElCS(:, 2) = unitvec(cross(ElCS(:, 3), ElCS(:, 1)));

    WrCS(:, 1) = HdCS(:, 3);
    WrCS(:, 3) = FaCS(:, 1);
    WrCS(:, 2) = unitvec(cross(WrCS(:, 3), WrCS(:, 1)));

    RhCS(:, 1) = RaCS(:, 3);
    RhCS(:, 3) = HdCS(:, 1);
    RhCS(:, 2) = unitvec(cross(RhCS(:, 3), RhCS(:, 1)));

    fprintf('Coordinate system defined\t')
    toc

    tic
    om0 = dot(diff(TorCS(:, 2), t), TorCS(:, 3)).*TorCS(:, 1) ...
         + dot(diff(TorCS(:, 3), t), TorCS(:, 1)).*TorCS(:, 2) ...
         + dot(diff(TorCS(:, 1), t), TorCS(:, 2)).*TorCS(:, 3);

    om1 = dot(diff(UaCS(:, 2), t), UaCS(:, 3)).*UaCS(:, 1) ...
         + dot(diff(UaCS(:, 3), t), UaCS(:, 1)).*UaCS(:, 2) ...
         + dot(diff(UaCS(:, 1), t), UaCS(:, 2)).*UaCS(:, 3);

    om2 = dot(diff(FaCS(:, 2), t), FaCS(:, 3)).*FaCS(:, 1) ...
         + dot(diff(FaCS(:, 3), t), FaCS(:, 1)).*FaCS(:, 2) ...
         + dot(diff(FaCS(:, 1), t), FaCS(:, 2)).*FaCS(:, 3);

    om3 = dot(diff(HdCS(:, 2), t), HdCS(:, 3)).*HdCS(:, 1) ...
         + dot(diff(HdCS(:, 3), t), HdCS(:, 1)).*HdCS(:, 2) ...
         + dot(diff(HdCS(:, 1), t), HdCS(:, 2)).*HdCS(:, 3);

    om4 = dot(diff(RaCS(:, 2), t), RaCS(:, 3)).*RaCS(:, 1) ...
         + dot(diff(RaCS(:, 3), t), RaCS(:, 1)).*RaCS(:, 2) ...
         + dot(diff(RaCS(:, 1), t), RaCS(:, 2)).*RaCS(:, 3);

    Om0 = dot(diff(TlowCS(:, 2), t), TlowCS(:, 3)).*TlowCS(:, 1) ...
         + dot(diff(TlowCS(:, 3), t), TlowCS(:, 1)).*TlowCS(:, 2) ...
         + dot(diff(TlowCS(:, 1), t), TlowCS(:, 2)).*TlowCS(:, 3);

    Om1 = dot(diff(ShCS(:, 2), t), ShCS(:, 3)).*ShCS(:, 1) ...
         + dot(diff(ShCS(:, 3), t), ShCS(:, 1)).*ShCS(:, 2) ...
         + dot(diff(ShCS(:, 1), t), ShCS(:, 2)).*ShCS(:, 3);

    Om2 = dot(diff(ElCS(:, 2), t), ElCS(:, 3)).*ElCS(:, 1) ...
         + dot(diff(ElCS(:, 3), t), ElCS(:, 1)).*ElCS(:, 2) ...
         + dot(diff(ElCS(:, 1), t), ElCS(:, 2)).*ElCS(:, 3);

    Om3 = dot(diff(WrCS(:, 2), t), WrCS(:, 3)).*WrCS(:, 1) ...
         + dot(diff(WrCS(:, 3), t), WrCS(:, 1)).*WrCS(:, 2) ...
         + dot(diff(WrCS(:, 1), t), WrCS(:, 2)).*WrCS(:, 3);
    
    Om4 = dot(diff(RhCS(:, 2), t), RhCS(:, 3)).*RhCS(:, 1) ...
         + dot(diff(RhCS(:, 3), t), RhCS(:, 1)).*RhCS(:, 2) ...
         + dot(diff(RhCS(:, 1), t), RhCS(:, 2)).*RhCS(:, 3);



    fprintf('om, Om calculated\t')
    toc

    tic
    thd0 = om0;
    thd1 = om1 - om0;
    thd2 = om2 - om1;
    thd3 = om3 - om2;
    thd4 = om4 - om3;

    th2d0 = diff(thd0, t) - cross(Om0, thd0);
    th2d1 = diff(thd1, t) - cross(Om1, thd1);
    th2d2 = diff(thd2, t) - cross(Om2, thd2);
    th2d3 = diff(thd3, t) - cross(Om3, thd3);
    th2d4 = diff(thd4, t) - cross(Om4, thd4);

    I_lcs0 = diag(I0);
    I_lcs1 = diag(I1);
    I_lcs2 = diag(I2);
    I_lcs3 = diag(I3);
    I_lcs4 = diag(I4);

    I_gcs0 = TorCS*I_lcs0*TorCS.';
    I_gcs1 = UaCS*I_lcs1*UaCS.';
    I_gcs2 = FaCS*I_lcs2*FaCS.';
    I_gcs3 = HdCS*I_lcs3*HdCS.';
    I_gcs4 = RaCS*I_lcs4*RaCS.';

    omd0 = th2d0+cross(Om0, thd0);

    fprintf('theta2dot defined\t')
    toc
    
    tic
    A1 = omd0+cross(Om1, thd1);
    A2 = A1+cross(Om2, thd2);
    A3 = A2+cross(Om3, thd3);
    A4 = A3+cross(Om4, thd4);
    
    L0 = l0.*TorCS(:, 3);
    Lg0 = 0.428*l0.*TorCS(:, 3);
    L1 = l1.*(-UaCS(:, 3));
    Lg1 = L1.*0.529;
    L2 = l2.*(-FaCS(:, 3));
    Lg2 = L2.*0.415;
    L3 = l3.*(-HdCS(:, 3));
    Lg3 = L3.*0.891;
    Lg4 = 0.519.*l4.*(-RaCS(:, 3));
    
    B0 = cross(om0, cross(om0, Lg0));
    Bg0 = cross(om0, cross(om0, L0));
    B1 = cross(om1, cross(om1, L1));
    Bg1 = cross(om1, cross(om1, Lg1));
    B2 = cross(om2, cross(om2, L2));
    Bg2 = cross(om2, cross(om2, Lg2));
    B3 = cross(om3, cross(om3, L3));
    Bg3 = cross(om3, cross(om3, Lg3));
    Bg4 = cross(om4, cross(om4, Lg4));

    fprintf('A, B, L defined\t')
    toc
    
%     C1 = cross(om1, I_gcs1*om1);
%     C2 = cross(om2, I_gcs2*om2);
%     C3 = cross(om3, I_gcs3*om3);
%     C4 = cross(om4, I_gcs4*om4);
    
    %%
    tic
    omd1 = th2d1+A1;
    omd2 = th2d1+th2d2+A2;
    omd3 = th2d1+th2d2+th2d3+A3;
    omd4 = th2d1+th2d2+th2d3+th2d4+A4;

    a0 = diff(diff(r_tor, t), t);
    a1 = a0+cross(omd0, L0)+B0;
    a2 = a1+cross(omd1, L1)+B1;
    a3 = a2+cross(omd2, L2)+B2;
    a4 = a3+cross(omd3, L3)+B3;
    
    ag0 = a0+cross(omd0, Lg0)+Bg0;
    ag1 = a1+cross(omd1, Lg1)+Bg1;
    ag2 = a2+cross(omd2, Lg2)+Bg2;
    ag3 = a3+cross(omd3, Lg3)+Bg3;
    ag4 = a4+cross(omd4, Lg4)+Bg4;

    
    fprintf('Other vars defined\t')
    toc
    
    %%
    tic
    F4 = m4*ag4-m4*g;
    F3 = m3*ag3-m3*g+F4;
    F2 = m2*ag2-m2*g+F3;
    F1 = m1*ag1-m1*g+F2;
    F0 = m0*ag0-m0*g+F1;

    fprintf('F defined\t')
    toc
    
    tic
    RJT4 = I_gcs4*omd4+cross(om4, (I_gcs4 * om4))     -cross(-Lg4, F4);
    RJT3 = I_gcs3*omd3+cross(om3, (I_gcs3 * om3))+RJT4-cross(-Lg3, F3)-cross((L3-Lg3), -F4);
    RJT2 = I_gcs2*omd2+cross(om2, (I_gcs2 * om2))+RJT3-cross(-Lg2, F2)-cross((L2-Lg2), -F3);
    RJT1 = I_gcs1*omd1+cross(om1, (I_gcs1 * om1))+RJT2-cross(-Lg1, F1)-cross((L1-Lg1), -F2);
    RJT0 = I_gcs0*omd0+cross(om0, (I_gcs0 * om0))+RJT1-cross(-Lg0, F0)-cross((L0-Lg0), -F1);


    RJT0 = formula(subs_pre(RJT0));
    RJT1 = formula(subs_pre(RJT1));
    RJT2 = formula(subs_pre(RJT2));
    RJT3 = formula(subs_pre(RJT3));
    RJT4 = formula(subs_pre(RJT4));
     
    RJT = [RJT0; RJT1; RJT2; RJT3; RJT4];

    fprintf('Equation defined\t')
    toc
    %%
    th2d_ = [formula(th2d0_); formula(th2d1_); formula(th2d2_); formula(th2d3_); formula(th2d4_)];

    [Coeff, Term] = coeffs_Vector(RJT, [th2d_.', g.']);

    Term

    GRA = -Coeff(:, 16:18) * g;
    Itheta = Coeff(:, 1:15);
    INT = -Coeff(:, 19);

%     NET = Itheta * th2d_;


    fprintf('INT&GRA got\t')
    toc


end
