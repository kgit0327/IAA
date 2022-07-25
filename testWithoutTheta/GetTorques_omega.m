function [INT, GRA, Itheta] = GetTorques_omega
    tic

    syms m0l m0u m1 m2 m3 m4 
    syms g [3 1] 
    syms I_gcs0 [3 3]
    syms I_gcs1 [3 3] 
    syms I_gcs2 [3 3] 
    syms I_gcs3 [3 3] 
    syms I_gcs4 [3 3]

    syms a0(t) [3 1]
    syms thd0(t) [3 1]
    syms thd1(t) [3 1]
    syms thd2(t) [3 1]
    syms thd3(t) [3 1]
    syms thd4(t) [3 1]
    syms th2d0(t) [3 1]
    syms th2d1(t) [3 1]
    syms th2d2(t) [3 1]
    syms th2d3(t) [3 1]
    syms th2d4(t) [3 1]
    syms om0l(t) [3 1]
    syms om0u(t) [3 1]
    syms om1(t) [3 1]
    syms om2(t) [3 1]
    syms om3(t) [3 1]
    syms om4(t) [3 1]
    syms Om0(t) [3 1]
    syms Om1(t) [3 1]
    syms Om2(t) [3 1]
    syms Om3(t) [3 1]
    syms Om4(t) [3 1]

    syms a0_ [3 1] real
    syms thd0_ [3 1] real
    syms thd1_ [3 1] real
    syms thd2_ [3 1] real
    syms thd3_ [3 1] real
    syms thd4_ [3 1] real
    syms th2d0_ [3 1] real
    syms th2d1_ [3 1] real
    syms th2d2_ [3 1] real
    syms th2d3_ [3 1] real
    syms th2d4_ [3 1] real
    syms om0l_ [3 1]
    syms om0u_ [3 1]
    syms om1_ [3 1]
    syms om2_ [3 1]
    syms om3_ [3 1]
    syms om4_ [3 1]
    syms Om0_ [3 1]
    syms Om1_ [3 1]
    syms Om2_ [3 1]
    syms Om3_ [3 1]
    syms Om4_ [3 1]

    syms omd0l_ [3 1]
    
    syms L0l [3 1] real
    syms L0 [3 1] real
    syms L0d [3 1] real
    syms L1 [3 1] real
    syms L2 [3 1] real
    syms L3 [3 1] real

    syms Lg0l [3 1] real
    syms Lg0 [3 1] real
    syms Lg1 [3 1] real
    syms Lg2 [3 1] real
    syms Lg3 [3 1] real
    syms Lg4 [3 1] real

    syms Rj0 [3 3]
    syms Rj1 [3 3]
    syms Rj2 [3 3]
    syms Rj3 [3 3]
    syms Rj4 [3 3]

    fprintf('syms Done\t')
    toc

    subs_var_pre = [
                    a0, diff(om0l, t), om0l,          ...
                     thd0,  thd1,  thd2,  thd3,  thd4, ...
                    th2d0, th2d1, th2d2, th2d3, th2d4, ...
                     om0u,   om1,   om2,   om3,   om4, ...
                      Om0,   Om1,   Om2,   Om3,   Om4];

    subs_var_post = [
                     a0_, omd0l_, om0l_,                   ...
                     thd0_,  thd1_,  thd2_,  thd3_,  thd4_, ...
                    th2d0_, th2d1_, th2d2_, th2d3_, th2d4_, ...
                     om0u_,   om1_,   om2_,   om3_,   om4_, ...
                      Om0_,   Om1_,   Om2_,   Om3_,   Om4_];

    subs_pre = @(input) subs(input, subs_var_pre, subs_var_post);

    tic
    A0 = cross(Om0, Rj0 * thd0);
    A1 = cross(Om1, Rj1 * thd1);
    A2 = cross(Om2, Rj2 * thd2);
    A3 = cross(Om3, Rj3 * thd3);
    A4 = cross(Om4, Rj4 * thd4);
    
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
    omd0 = omd0l  + Rj0 * th2d0 + A0;
    omd1  = omd0  + Rj1 * th2d1 + A1;
    omd2  = omd1  + Rj2 * th2d2 + A2;
    omd3  = omd2  + Rj3 * th2d3 + A3;
    omd4  = omd3  + Rj4 * th2d4 + A4;

%     a0 = a0l + cross(omd0l, L0l) + B0l;
    a1 = a0  + cross(omd0, L0)   + B0;
    a2 = a1  + cross(omd1, L1)   + B1;
    a3 = a2  + cross(omd2, L2)   + B2;
    a4 = a3  + cross(omd3, L3)   + B3;
    
    ag0 = a0 + cross(omd0, Lg0) + Bg0;
    ag1 = a1 + cross(omd1, Lg1) + Bg1;
    ag2 = a2 + cross(omd2, Lg2) + Bg2;
    ag3 = a3 + cross(omd3, Lg3) + Bg3;
    ag4 = a4 + cross(omd4, Lg4) + Bg4;
    
    fprintf('Other vars defined\t')
    toc

    %%
    tic
    syms F0 F1 F2 F3 F4 [3 1] real
    f_eq = [
        F0 == F1 + m0u * (ag0 - g);
        F1 == F2 + m1  * (ag1 - g);
        F2 == F3 + m2  * (ag2 - g);
        F3 == F4 + m3  * (ag3 - g);
        F4 ==      m4  * (ag4 - g)];

    [A, B] = equationsToMatrix(f_eq, [F0, F1, F2, F3, F4]);
    F_solved = linsolve(A, B);
    
    F0 = F_solved(1 : 3, :);
    F1 = F_solved(4 : 6, :);
    F2 = F_solved(7 : 9, :);
    F3 = F_solved(10 : 12, :);
    F4 = F_solved(13 : 15, :);

    fprintf('F defined\t')
    toc
    
    tic

    syms RJT0 RJT1 RJT2 RJT3 RJT4 [3 1] real
    RJT_eq = [
        RJT0 == I_gcs0 * omd0 + cross(om0u, (I_gcs0 * om0u)) + RJT1 - cross(-Lg0, F0) - cross((L0 - Lg0), -F1);
        RJT1 == I_gcs1 * omd1 + cross( om1, (I_gcs1 *  om1)) + RJT2 - cross(-Lg1, F1) - cross((L1 - Lg1), -F2);
        RJT2 == I_gcs2 * omd2 + cross( om2, (I_gcs2 *  om2)) + RJT3 - cross(-Lg2, F2) - cross((L2 - Lg2), -F3);
        RJT3 == I_gcs3 * omd3 + cross( om3, (I_gcs3 *  om3)) + RJT4 - cross(-Lg3, F3) - cross((L3 - Lg3), -F4);
        RJT4 == I_gcs4 * omd4 + cross( om4, (I_gcs4 *  om4))        - cross(-Lg4, F4);
        ];
    
    [A, B] = equationsToMatrix(RJT_eq, [RJT0, RJT1, RJT2, RJT3, RJT4]);
    RJT_solved = linsolve(A, B);

    RJT0 = RJT_solved(1 : 3, :);
    RJT1 = RJT_solved(4 : 6, :);
    RJT2 = RJT_solved(7 : 9, :);
    RJT3 = RJT_solved(10 : 12, :);
    RJT4 = RJT_solved(13 : 15, :);

    RJT0 = formula(subs_pre(RJT0));
    RJT1 = formula(subs_pre(RJT1));
    RJT2 = formula(subs_pre(RJT2));
    RJT3 = formula(subs_pre(RJT3));
    RJT4 = formula(subs_pre(RJT4));

    F0 = formula(subs_pre(F0));
     
    RJT = [F0; RJT0; RJT1; RJT2; RJT3; RJT4];

    fprintf('Equation defined\t')
    toc
    %%
    th2d_ = [formula(a0_); formula(th2d0_); formula(th2d1_); formula(th2d2_); formula(th2d3_); formula(th2d4_)];

    addpath('../')

    [Coeff, Term] = coeffs_Vector(RJT, [th2d_.', g.']);

    Term

    GRA = -Coeff(:, 19:21) * g;
    Itheta = Coeff(:, 1:18);
    INT = -Coeff(:, 22);

%     NET = Itheta * th2d_;


    fprintf('INT&GRA got\t')
    toc


end

