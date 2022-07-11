function [INT, GRA, Itheta] = GetTorques_
    tic
    syms m0u m1 m2 m3 m4 
    syms g [3 1] 
    syms I0u [1 3]
    syms I1 [1 3] 
    syms I2 [1 3] 
    syms I3 [1 3] 
    syms I4 [1 3] 
    syms th0l(t) [3 1]
    syms th0u(t) [3 1]
    syms th1(t) [3 1]
    syms th2(t) [3 1]
    syms th3(t) [3 1]
    syms th4(t) [3 1]
    syms r_tor(t) [3 1]

    syms th0_ [3 1] real
    syms th1_ [3 1] real
    syms th2_ [3 1] real
    syms th3_ [3 1] real
    syms th4_ [3 1] real
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
    syms L0 [3 1] real
    syms L0d [3 1] real
    syms L1 [3 1] real
    syms L2 [3 1] real
    syms L3 [3 1] real
    syms Lg0 [3 1] real
    syms Lg1 [3 1] real
    syms Lg2 [3 1] real
    syms Lg3 [3 1] real
    syms Lg4 [3 1] real

    fprintf('syms Done\t')
    toc

    %%
    tic
    syms th_ [3 1]
    R1(th_) = [1,          0,         0; ...
               0,  cos(th_1), sin(th_1); ...
               0, -sin(th_1), cos(th_1)];

    R2(th_) = [ cos(th_2), 0, -sin(th_2); ...
                        0, 1,          0; ...
                sin(th_2), 0,  cos(th_2)];

    R3(th_) = [ cos(th_3),  sin(th_3), 0; ...
               -sin(th_3),  cos(th_3), 0; ...
                        0,          0, 1];
    R(th_) = R3*R2*R1;
   
    % Define segment coordinate system
    lTorCS = R(th0l1, th0l2, th0l3);
    % x0 = TorCS(:, 1);
    % y0 = TorCS(:, 2);
    % z0 = TorCS(:, 3);
    uTorCS = R(th0u1, th0u2, th0u3);
    UaCS = R(th11, th12, th13);
    FaCS = R(th21, th22, th23);
    HdCS = R(th31, th32, th33);
    RaCS = R(th41, th42, th43);
    
    % Define joint coordinate system, x: proximal x, y: cross(z, x), z: distal z 
    TrCS(:, 1) = lTorCS(:, 1);
    TrCS(:, 3) = uTorCS(:, 3);
    TrCS(:, 2) = unitvec(cross(TrCS(:, 3), TrCS(:, 1)));
    
    % ShCS -> y-x-z rotation, x: cross(y, z), y: proximal y, z: distal z
    ShCS(:, 2) = TrCS(:, 2);
    ShCS(:, 3) = UaCS(:, 3);
    ShCS(:, 1) = unitvec(cross(ShCS(:, 2), ShCS(:, 3)));

    ElCS(:, 1) = UaCS(:, 1);
    ElCS(:, 3) = FaCS(:, 3);
    ElCS(:, 2) = unitvec(cross(ElCS(:, 3), ElCS(:, 1)));

    WrCS(:, 1) = FaCS(:, 1);
    WrCS(:, 3) = HdCS(:, 3);
    WrCS(:, 2) = unitvec(cross(WrCS(:, 3), WrCS(:, 1)));

    RhCS(:, 1) = HdCS(:, 1);
    RhCS(:, 3) = RaCS(:, 3);
    RhCS(:, 2) = unitvec(cross(RhCS(:, 3), RhCS(:, 1)));

    fprintf('Coordinate system defined\t')
    toc

    tic

    om0l = dot(diff(lTorCS(:, 2), t), lTorCS(:, 3)) .* lTorCS(:, 1) ...
         + dot(diff(lTorCS(:, 3), t), lTorCS(:, 1)) .* lTorCS(:, 2) ...
         + dot(diff(lTorCS(:, 1), t), lTorCS(:, 2)) .* lTorCS(:, 3);

    om0u = dot(diff(uTorCS(:, 2), t), uTorCS(:, 3)) .* uTorCS(:, 1) ...
         + dot(diff(uTorCS(:, 3), t), uTorCS(:, 1)) .* uTorCS(:, 2) ...
         + dot(diff(uTorCS(:, 1), t), uTorCS(:, 2)) .* uTorCS(:, 3);

    om1  = dot(diff(UaCS(:, 2), t), UaCS(:, 3)) .* UaCS(:, 1) ...
         + dot(diff(UaCS(:, 3), t), UaCS(:, 1)) .* UaCS(:, 2) ...
         + dot(diff(UaCS(:, 1), t), UaCS(:, 2)) .* UaCS(:, 3);

    om2  = dot(diff(FaCS(:, 2), t), FaCS(:, 3)) .* FaCS(:, 1) ...
         + dot(diff(FaCS(:, 3), t), FaCS(:, 1)) .* FaCS(:, 2) ...
         + dot(diff(FaCS(:, 1), t), FaCS(:, 2)) .* FaCS(:, 3);

    om3  = dot(diff(HdCS(:, 2), t), HdCS(:, 3)) .* HdCS(:, 1) ...
         + dot(diff(HdCS(:, 3), t), HdCS(:, 1)) .* HdCS(:, 2) ...
         + dot(diff(HdCS(:, 1), t), HdCS(:, 2)) .* HdCS(:, 3);

    om4  = dot(diff(RaCS(:, 2), t), RaCS(:, 3)) .* RaCS(:, 1) ...
         + dot(diff(RaCS(:, 3), t), RaCS(:, 1)) .* RaCS(:, 2) ...
         + dot(diff(RaCS(:, 1), t), RaCS(:, 2)) .* RaCS(:, 3);

    Om0  = dot(diff(TrCS(:, 2), t), TrCS(:, 3)) .* TrCS(:, 1) ...
         + dot(diff(TrCS(:, 3), t), TrCS(:, 1)) .* TrCS(:, 2) ...
         + dot(diff(TrCS(:, 1), t), TrCS(:, 2)) .* TrCS(:, 3);

    Om1  = dot(diff(ShCS(:, 2), t), ShCS(:, 3)) .* ShCS(:, 1) ...
         + dot(diff(ShCS(:, 3), t), ShCS(:, 1)) .* ShCS(:, 2) ...
         + dot(diff(ShCS(:, 1), t), ShCS(:, 2)) .* ShCS(:, 3);

    Om2  = dot(diff(ElCS(:, 2), t), ElCS(:, 3)) .* ElCS(:, 1) ...
         + dot(diff(ElCS(:, 3), t), ElCS(:, 1)) .* ElCS(:, 2) ...
         + dot(diff(ElCS(:, 1), t), ElCS(:, 2)) .* ElCS(:, 3);

    Om3  = dot(diff(WrCS(:, 2), t), WrCS(:, 3)) .* WrCS(:, 1) ...
         + dot(diff(WrCS(:, 3), t), WrCS(:, 1)) .* WrCS(:, 2) ...
         + dot(diff(WrCS(:, 1), t), WrCS(:, 2)) .* WrCS(:, 3);
    
    Om4  = dot(diff(RhCS(:, 2), t), RhCS(:, 3)) .* RhCS(:, 1) ...
         + dot(diff(RhCS(:, 3), t), RhCS(:, 1)) .* RhCS(:, 2) ...
         + dot(diff(RhCS(:, 1), t), RhCS(:, 2)) .* RhCS(:, 3);

    fprintf('om, Om calculated\t')
    toc

    tic
    thd0 = om0u - om0l;
    thd1 = om1  - om0u;
    thd2 = om2  -  om1;
    thd3 = om3  -  om2;
    thd4 = om4  -  om3;

    fprintf('thd calculated\t')
    toc

    tic
    thd0_jcs = TrCS \ thd0;
    toc
    thd1_jcs = ShCS \ thd1;
    thd2_jcs = ElCS \ thd2;
    thd3_jcs = WrCS \ thd3;
    thd4_jcs = RhCS \ thd4;

    th2d0_jcs = diff(thd0_jcs, t);
    th2d1_jcs = diff(thd1_jcs, t);
    th2d2_jcs = diff(thd2_jcs, t);
    th2d3_jcs = diff(thd3_jcs, t);
    th2d4_jcs = diff(thd4_jcs, t);

    th2d0 = TrCS * th2d0_jcs;
    th2d1 = ShCS * th2d1_jcs;
    th2d2 = ElCS * th2d2_jcs;
    th2d3 = WrCS * th2d3_jcs;
    th2d4 = RhCS * th2d4_jcs;

    fprintf('th2d caluculated\t')
    toc

    tic
    I_lcs0u = diag(I0u);
    I_lcs1  =  diag(I1);
    I_lcs2  =  diag(I2);
    I_lcs3  =  diag(I3);
    I_lcs4  =  diag(I4);

    I_gcs0 = uTorCS * I_lcs0u * uTorCS.';
    I_gcs1 = UaCS * I_lcs1 * UaCS.';
    I_gcs2 = FaCS * I_lcs2 * FaCS.';
    I_gcs3 = HdCS * I_lcs3 * HdCS.';
    I_gcs4 = RaCS * I_lcs4 * RaCS.';

    

    fprintf('I defined\t')
    toc
    
    tic
    A0 = cross(Om0, thd0);
    A1 = cross(Om1, thd1);
    A2 = cross(Om2, thd2);
    A3 = cross(Om3, thd3);
    A4 = cross(Om4, thd4);
    
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
    
%     C1 = cross(om1, I_gcs1*om1);
%     C2 = cross(om2, I_gcs2*om2);
%     C3 = cross(om3, I_gcs3*om3);
%     C4 = cross(om4, I_gcs4*om4);
    
    %%
    tic
    omd0l = diff(om0l, t);
    omd0u = omd0l + th2d0 + A0;
    omd1  = omd0u + th2d1 + A1;
    omd2  = omd1  + th2d2 + A2;
    omd3  = omd2  + th2d3 + A3;
    omd4  = omd3  + th2d4 + A4;

    a0 = diff(r_tor, t, t);
    a1 = a0 + cross(omd0u, L0) + B0;
    a2 = a1 + cross(omd1, L1)  + B1;
    a3 = a2 + cross(omd2, L2)  + B2;
    a4 = a3 + cross(omd3, L3)  + B3;
    
    ag0 = a0 + cross(omd0, Lg0) + Bg0;
    ag1 = a1 + cross(omd1, Lg1) + Bg1;
    ag2 = a2 + cross(omd2, Lg2) + Bg2;
    ag3 = a3 + cross(omd3, Lg3) + Bg3;
    ag4 = a4 + cross(omd4, Lg4) + Bg4;

    
    fprintf('Other vars defined\t')
    toc
    
    %%
    tic
    F4 = m4  * ag4 - m4  * g;
    F3 = m3  * ag3 - m3  * g + F4;
    F2 = m2  * ag2 - m2  * g + F3;
    F1 = m1  * ag1 - m1  * g + F2;
    F0 = m0u * ag0 - m0u * g + F1;

    fprintf('F defined\t')
    toc
    
    tic
    RJT4 = I_gcs4*omd4+cross(om4,  (I_gcs4 * om4))         - cross(-Lg4, F4);
    RJT3 = I_gcs3*omd3+cross(om3,  (I_gcs3 * om3))  + RJT4 - cross(-Lg3, F3) - cross((L3-Lg3), -F4);
    RJT2 = I_gcs2*omd2+cross(om2,  (I_gcs2 * om2))  + RJT3 - cross(-Lg2, F2) - cross((L2-Lg2), -F3);
    RJT1 = I_gcs1*omd1+cross(om1,  (I_gcs1 * om1))  + RJT2 - cross(-Lg1, F1) - cross((L1-Lg1), -F2);
    RJT0 = I_gcs0*omd0+cross(om0u, (I_gcs0 * om0u)) + RJT1 - cross(-Lg0, F0) - cross(L0d, -F1);


    syms_Replaced = [
        th0u, thd0, th2d0; ...
         th1, thd1, th2d1; ...
         th2, thd2, th2d2; ...
         th3, thd3, th2d3; ...
         th4, thd4, th2d4; ...
       r_tor, diff(r_tor, t), diff(r_tor, t, t) ...
    ];

    syms_Replacing = [
        th0_, thd0_, th2d0_; ...
        th1_, thd1_, th2d1_; ...
        th2_, thd2_, th2d2_; ...
        th3_, thd3_, th2d3_; ...
        th4_, thd4_, th2d4_; ...
        r_tor_, v_tor_, a_tor_;...
        ];
    
    subs_pre = @(input) subs( input, syms_Replaced, syms_Replacing);

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

