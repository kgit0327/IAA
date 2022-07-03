function tDeps = GetTDepend(ExperimentDatas, iData)

    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
    
    NUM_FRAME = ExperimentDatas(iData).nFr;

    SCS = ExperimentDatas(iData).SCS;
    Unit = ExperimentDatas(iData).Unit;

    TorCS = nan(3, 3, NUM_FRAME);
    UaCS = nan(3, 3, NUM_FRAME);
    FaCS = nan(3, 3, NUM_FRAME);
    HdCS = nan(3, 3, NUM_FRAME);
    RaCS = nan(3, 3, NUM_FRAME);

    TlowCS = nan(3, 3, NUM_FRAME);
    ShCS = nan(3, 3, NUM_FRAME);
    ElCS = nan(3, 3, NUM_FRAME);
    WrCS = nan(3, 3, NUM_FRAME);
    RhCS = nan(3, 3, NUM_FRAME);

    for iFrame = 1 : NUM_FRAME
        TorCS(:, :, iFrame) = SCS(14).Var(iFrame).R; % left, back, up
        UaCS(:, :, iFrame) = SCS(3).Var(iFrame).R; % out-in, z X x, ua long
        FaCS(:, :, iFrame) = SCS(2).Var(iFrame).R; % rad-ul, z X x, fa long
        HdCS(:, :, iFrame) = SCS(1).Var(iFrame).R; % rad-ul, z X x, hd long
        RaCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R; 

        TlowCS(:, :, iFrame) = Unit(5).JCS(2).Var(iFrame).R;
        ShCS(:, :, iFrame) = Unit(1).JCS(3).Var(iFrame).R;
        ElCS(:, :, iFrame) = Unit(1).JCS(2).Var(iFrame).R;
        WrCS(:, :, iFrame) = Unit(1).JCS(1).Var(iFrame).R;
        RhCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R;
    end

    th0_FE = Unit(5).JA(4, :);
    th0_Ru = Unit(5).JA(5, :);
    th0_Rr = Unit(5).JA(6, :);
    
    th1_FE = Unit(1).JA(1, :);

    th1_Ab = Unit(1).JA(2, :);
    th1_Er = Unit(1).JA(3, :);
    
    th2_FE = Unit(1).JA(4, :);
    th2_VV = Unit(1).JA(5, :); % Valgus+
    th2_Er = Unit(1).JA(6, :);
    
    th3_Pf = Unit(1).JA(7, :);
    th3_Ra = Unit(1).JA(8, :);
    th3_IE = Unit(1).JA(9, :);

    th4_z = RacketSegdat.rh_an(1, :);
    th4_y = RacketSegdat.rh_an(2, :);
    th4_x = RacketSegdat.rh_an(3, :);

    th0 = th0_FE .* reshape(TlowCS(:, 1, :), [3 NUM_FRAME]) ...
        + th0_Ru .* reshape(TlowCS(:, 2, :), [3 NUM_FRAME]) ...
        + th0_Rr .* reshape(TlowCS(:, 3, :), [3 NUM_FRAME]);

    th1 = th1_FE .* reshape(ShCS(:, 1, :), [3 NUM_FRAME]) ...
        + th1_Ab .* reshape(ShCS(:, 2, :), [3 NUM_FRAME]) ...
        + th1_Er .* reshape(ShCS(:, 3, :), [3 NUM_FRAME]);

    th2 = th2_FE .* reshape(ElCS(:, 1, :), [3 NUM_FRAME]) ...
        + th2_VV .* reshape(ElCS(:, 2, :), [3 NUM_FRAME]) ...
        + th2_Er .* reshape(ElCS(:, 3, :), [3 NUM_FRAME]);

    th3 = th3_Pf .* reshape(WrCS(:, 1, :), [3 NUM_FRAME]) ...
        + th3_Ra .* reshape(WrCS(:, 2, :), [3 NUM_FRAME]) ...
        + th3_IE .* reshape(WrCS(:, 3, :), [3 NUM_FRAME]);

    th4 = th4_z .* reshape(RhCS(:, 1, :), [3 NUM_FRAME]) ...
        + th4_y .* reshape(RhCS(:, 2, :), [3 NUM_FRAME]) ...
        + th4_x .* reshape(RhCS(:, 3, :), [3 NUM_FRAME]);

    dTorCS = GetDiffR(TorCS);
    dUaCS = GetDiffR(UaCS);
    dFaCS = GetDiffR(FaCS);
    dHdCS = GetDiffR(HdCS);
    dRaCS = GetDiffR(RaCS);
    
    dTlowCS = GetDiffR(TlowCS);
    dShCS = GetDiffR(ShCS);
    dElCS = GetDiffR(ElCS);
    dWrCS = GetDiffR(WrCS);
    dRhCS = GetDiffR(RhCS);
    
    om0 = reshape( ...
        dot(dTorCS(:, 2, :), TorCS(:, 3, :)).*TorCS(:, 1, :) ...
         + dot(dTorCS(:, 3, :), TorCS(:, 1, :)).*TorCS(:, 2, :) ...
         + dot(dTorCS(:, 1, :), TorCS(:, 2, :)).*TorCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    om1 = reshape( ...
        dot(dUaCS(:, 2, :), UaCS(:, 3, :)).*UaCS(:, 1, :) ...
         + dot(dUaCS(:, 3, :), UaCS(:, 1, :)).*UaCS(:, 2, :) ...
         + dot(dUaCS(:, 1, :), UaCS(:, 2, :)).*UaCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    om2 = reshape( ...
        dot(dFaCS(:, 2, :), FaCS(:, 3, :)).*FaCS(:, 1, :) ...
         + dot(dFaCS(:, 3, :), FaCS(:, 1, :)).*FaCS(:, 2, :) ...
         + dot(dFaCS(:, 1, :), FaCS(:, 2, :)).*FaCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    om3 = reshape( ...
        dot(dHdCS(:, 2, :), HdCS(:, 3, :)).*HdCS(:, 1, :) ...
         + dot(dHdCS(:, 3, :), HdCS(:, 1, :)).*HdCS(:, 2, :) ...
         + dot(dHdCS(:, 1, :), HdCS(:, 2, :)).*HdCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    om4 = reshape( ...
        dot(dRaCS(:, 2, :), RaCS(:, 3, :)).*RaCS(:, 1, :) ...
         + dot(dRaCS(:, 3, :), RaCS(:, 1, :)).*RaCS(:, 2, :) ...
         + dot(dRaCS(:, 1, :), RaCS(:, 2, :)).*RaCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    Om0 = reshape( ...
        dot(dTlowCS(:, 2, :), TlowCS(:, 3, :)).*TlowCS(:, 1, :) ...
         + dot(dTlowCS(:, 3, :), TlowCS(:, 1, :)).*TlowCS(:, 2, :) ...
         + dot(dTlowCS(:, 1, :), TlowCS(:, 2, :)).*TlowCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    Om1 = reshape( ...
        dot(dShCS(:, 2, :), ShCS(:, 3, :)).*ShCS(:, 1, :) ...
         + dot(dShCS(:, 3, :), ShCS(:, 1, :)).*ShCS(:, 2, :) ...
         + dot(dShCS(:, 1, :), ShCS(:, 2, :)).*ShCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    Om2 = reshape( ...
        dot(dElCS(:, 2, :), ElCS(:, 3, :)).*ElCS(:, 1, :) ...
         + dot(dElCS(:, 3, :), ElCS(:, 1, :)).*ElCS(:, 2, :) ...
         + dot(dElCS(:, 1, :), ElCS(:, 2, :)).*ElCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    Om3 = reshape( ...
        dot(dWrCS(:, 2, :), WrCS(:, 3, :)).*WrCS(:, 1, :) ...
         + dot(dWrCS(:, 3, :), WrCS(:, 1, :)).*WrCS(:, 2, :) ...
         + dot(dWrCS(:, 1, :), WrCS(:, 2, :)).*WrCS(:, 3, :), ...
         [3 NUM_FRAME]);
    
    Om4 = reshape( ...
        dot(dRhCS(:, 2, :), RhCS(:, 3, :)).*RhCS(:, 1, :) ...
         + dot(dRhCS(:, 3, :), RhCS(:, 1, :)).*RhCS(:, 2, :) ...
         + dot(dRhCS(:, 1, :), RhCS(:, 2, :)).*RhCS(:, 3, :), ...
         [3 NUM_FRAME]);
    

    thd0 = om0;
    thd1 = om1 - om0;
    thd2 = om2 - om1;
    thd3 = om3 - om2;
    thd4 = om4 - om3;

    th2d0 = dif3(thd0, NUM_FRAME, 1/200) - cross(Om0, thd0, 1);
    th2d1 = dif3(thd1, NUM_FRAME, 1/200) - cross(Om1, thd1, 1);
    th2d2 = dif3(thd2, NUM_FRAME, 1/200) - cross(Om2, thd2, 1);
    th2d3 = dif3(thd3, NUM_FRAME, 1/200) - cross(Om3, thd3, 1);
    th2d4 = dif3(thd4, NUM_FRAME, 1/200) - cross(Om4, thd4, 1); 

    r_tor = ExperimentDatas(iData).n.troC;
    v_tor = dif3(r_tor, NUM_FRAME, 1/200);
    a_tor = dif3(v_tor, NUM_FRAME, 1/200);


    %-----------   
    tDeps.th0 = th0;
    tDeps.th1 = th1;
    tDeps.th2 = th2;
    tDeps.th3 = th3;
    tDeps.th4 = th4;

    tDeps.thd0 = thd0;
    tDeps.thd1 = thd1;
    tDeps.thd2 = thd2;
    tDeps.thd3 = thd3;
    tDeps.thd4 = thd4;

    tDeps.th2d0 = th2d0;
    tDeps.th2d1 = th2d1;
    tDeps.th2d2 = th2d2;
    tDeps.th2d3 = th2d3;
    tDeps.th2d4 = th2d4;

    tDeps.a_tor = a_tor;
    
    function dR = GetDiffR(R)
        SIZE = size(R, 3);
    
        Rx = reshape(R(:, 1, :), [3 SIZE]);
        Ry = reshape(R(:, 2, :), [3 SIZE]);
        Rz = reshape(R(:, 3, :), [3 SIZE]);
        dRx = reshape(dif3(Rx, SIZE, 1/200), [3 1 SIZE]);
        dRy = reshape(dif3(Ry, SIZE, 1/200), [3 1 SIZE]);
        dRz = reshape(dif3(Rz, SIZE, 1/200), [3 1 SIZE]);
    
        dR = [dRx dRy dRz];
    end

end

