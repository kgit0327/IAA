function tDeps = GetTDepend2(ExperimentDatas, iData)

    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
    Constants = GetConstants2(ExperimentDatas, iData);
    
    NUM_FRAME = ExperimentDatas(iData).nFr;

    SCS = ExperimentDatas(iData).SCS;
    Unit = ExperimentDatas(iData).Unit;

    lTorCS = nan(3, 3, NUM_FRAME);
    uTorCS = nan(3, 3, NUM_FRAME);
    UaCS = nan(3, 3, NUM_FRAME);
    FaCS = nan(3, 3, NUM_FRAME);
    HdCS = nan(3, 3, NUM_FRAME);
    RaCS = nan(3, 3, NUM_FRAME);

    TrCS = nan(3, 3, NUM_FRAME);
    ShCS = nan(3, 3, NUM_FRAME);
    ElCS = nan(3, 3, NUM_FRAME);
    WrCS = nan(3, 3, NUM_FRAME);
    RhCS = nan(3, 3, NUM_FRAME);

    for iFrame = 1 : NUM_FRAME
        lTorCS(:, :, iFrame) = SCS(15).Var(iFrame).R; % left, back, up
        uTorCS(:, :, iFrame) = SCS(14).Var(iFrame).R;
        UaCS(:, :, iFrame) = SCS(3).Var(iFrame).R; % out-in, z X x, ua long
        FaCS(:, :, iFrame) = SCS(2).Var(iFrame).R; % rad-ul, z X x, fa long
        HdCS(:, :, iFrame) = SCS(1).Var(iFrame).R; % rad-ul, z X x, hd long
        RaCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R; 

        TrCS(:, :, iFrame) = Unit(5).JCS(2).Var(iFrame).R;
        ShCS(:, :, iFrame) = Unit(1).JCS(1).Var(iFrame).R;
        ElCS(:, :, iFrame) = Unit(1).JCS(2).Var(iFrame).R;
        WrCS(:, :, iFrame) = Unit(1).JCS(3).Var(iFrame).R;
        RhCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R;
    end

    tDeps.Rj0 = TrCS;
    tDeps.Rj1 = ShCS;
    tDeps.Rj2 = ElCS;
    tDeps.Rj3 = WrCS;
    tDeps.Rj4 = RhCS;

    tr = ExperimentDatas(iData).n.troC;
    ri = ExperimentDatas(iData).n.ribC;
    sh = ExperimentDatas(iData).n.shR;
    el = ExperimentDatas(iData).n.elbR;
    wr = ExperimentDatas(iData).n.wrR;
    rh = RacketSegdat.n(22:24, :);
    to = ExperimentDatas(iData).n.Top;

    tDeps.L0l = ri - tr;
    tDeps.L0 = sh - ri;
    tDeps.L1 = el - sh;
    tDeps.L2 = wr - el;
    tDeps.L3 = rh - wr;
    tDeps.L4 = to - rh;

    tDeps.Lg0l = ExperimentDatas(iData).cgdat(15).cg - tr;
    tDeps.Lg0 = ExperimentDatas(iData).cgdat(14).cg - ri;
    tDeps.Lg1 = ExperimentDatas(iData).cgdat(3).cg - sh;
    tDeps.Lg2 = ExperimentDatas(iData).cgdat(2).cg - el;
    tDeps.Lg3 = ExperimentDatas(iData).cgdat(1).cg - wr;
    tDeps.Lg4 = RacketSegdat.cg - rh;

    tDeps.L0d = sh - ExperimentDatas(iData).cgdat(14).cg;

    
    I_0u1 = Constants.I(2, 1);
    I_0u2 = Constants.I(2, 2);
    I_0u3 = Constants.I(2, 3);
    I_11 = Constants.I(3, 1);
    I_12 = Constants.I(3, 2);
    I_13 = Constants.I(3, 3);
    I_21 = Constants.I(4, 1);
    I_22 = Constants.I(4, 2);
    I_23 = Constants.I(4, 3);
    I_31 = Constants.I(5, 1);
    I_32 = Constants.I(5, 2);
    I_33 = Constants.I(5, 3);
    I_41 = Constants.I(6, 1);
    I_42 = Constants.I(6, 2);
    I_43 = Constants.I(6, 3);

    for iFrame = 1 : NUM_FRAME
        tDeps.I_gcs0(:, :, iFrame) = uTorCS(:, :, iFrame) * diag([I_0u1, I_0u2, I_0u3]) * uTorCS(:, :, iFrame).';
        tDeps.I_gcs1(:, :, iFrame) = UaCS(:, :, iFrame) * diag([I_11, I_12, I_13]) * UaCS(:, :, iFrame).';
        tDeps.I_gcs2(:, :, iFrame) = FaCS(:, :, iFrame) * diag([I_21, I_22, I_23]) * FaCS(:, :, iFrame).';
        tDeps.I_gcs3(:, :, iFrame) = HdCS(:, :, iFrame) * diag([I_31, I_32, I_33]) * HdCS(:, :, iFrame).';
        tDeps.I_gcs4(:, :, iFrame) = RaCS(:, :, iFrame) * diag([I_41, I_42, I_43]) * RaCS(:, :, iFrame).';
    end

    duTorCS = GetDiffR(uTorCS);
    dlTorCS = GetDiffR(lTorCS);
    dUaCS = GetDiffR(UaCS);
    dFaCS = GetDiffR(FaCS);
    dHdCS = GetDiffR(HdCS);
    dRaCS = GetDiffR(RaCS);
    
    dTrCS = GetDiffR(TrCS);
    dShCS = GetDiffR(ShCS);
    dElCS = GetDiffR(ElCS);
    dWrCS = GetDiffR(WrCS);
    dRhCS = GetDiffR(RhCS);
    
    om0l = reshape( ...
        dot(dlTorCS(:, 2, :), lTorCS(:, 3, :)).*lTorCS(:, 1, :) ...
         + dot(dlTorCS(:, 3, :), lTorCS(:, 1, :)).*lTorCS(:, 2, :) ...
         + dot(dlTorCS(:, 1, :), lTorCS(:, 2, :)).*lTorCS(:, 3, :), ...
         [3 NUM_FRAME]);

    om0u = reshape( ...
        dot(duTorCS(:, 2, :), uTorCS(:, 3, :)).*uTorCS(:, 1, :) ...
         + dot(duTorCS(:, 3, :), uTorCS(:, 1, :)).*uTorCS(:, 2, :) ...
         + dot(duTorCS(:, 1, :), uTorCS(:, 2, :)).*uTorCS(:, 3, :), ...
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
        dot(dTrCS(:, 2, :), TrCS(:, 3, :)).*TrCS(:, 1, :) ...
         + dot(dTrCS(:, 3, :), TrCS(:, 1, :)).*TrCS(:, 2, :) ...
         + dot(dTrCS(:, 1, :), TrCS(:, 2, :)).*TrCS(:, 3, :), ...
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

    tDeps.om0l = om0l;
    tDeps.om0u = om0u;
    tDeps.om1 = om1;
    tDeps.om2 = om2;
    tDeps.om3 = om3;
    tDeps.om4 = om4;

    tDeps.Om0 = Om0;
    tDeps.Om1 = Om1;
    tDeps.Om2 = Om2;
    tDeps.Om3 = Om3;
    tDeps.Om4 = Om4;

    tDeps.omd0l = dif3(om0l, NUM_FRAME, 1/200);
    

    thd0_gcs = om0u - om0l;
    thd1_gcs = om1 - om0u;
    thd2_gcs = om2 - om1;
    thd3_gcs = om3 - om2;
    thd4_gcs = om4 - om3;

    thd0 = nan(3, NUM_FRAME);
    thd1 = nan(3, NUM_FRAME);
    thd2 = nan(3, NUM_FRAME);
    thd3 = nan(3, NUM_FRAME);
    thd4 = nan(3, NUM_FRAME);

    for iFrame = 1 : NUM_FRAME
        thd0(:, iFrame) = TrCS(:, :, iFrame) \ thd0_gcs(:, iFrame);
        thd1(:, iFrame) = ShCS(:, :, iFrame) \ thd1_gcs(:, iFrame);
        thd2(:, iFrame) = ElCS(:, :, iFrame) \ thd2_gcs(:, iFrame);
        thd3(:, iFrame) = WrCS(:, :, iFrame) \ thd3_gcs(:, iFrame);
        thd4(:, iFrame) = RhCS(:, :, iFrame) \ thd4_gcs(:, iFrame);
    end

    th2d0 = dif3(thd0, NUM_FRAME, 1 / 200);
    th2d1 = dif3(thd1, NUM_FRAME, 1 / 200);
    th2d2 = dif3(thd2, NUM_FRAME, 1 / 200);
    th2d3 = dif3(thd3, NUM_FRAME, 1 / 200);
    th2d4 = dif3(thd4, NUM_FRAME, 1 / 200);

    r_tor = ri;
    v_tor = dif3(r_tor, NUM_FRAME, 1/200);
    a_tor = dif3(v_tor, NUM_FRAME, 1/200);


    %-----------   
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

