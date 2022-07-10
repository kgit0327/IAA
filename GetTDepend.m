function tDeps = GetTDepend(ExperimentDatas, iData)

    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
    
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
        lTorCS(:, :, iFrame) = SCS(14).Var(iFrame).R; % left, back, up
        uTorCS(:, :, iFrame) = SCS(15).Var(iFrame).R;
        UaCS(:, :, iFrame) = SCS(3).Var(iFrame).R; % out-in, z X x, ua long
        FaCS(:, :, iFrame) = SCS(2).Var(iFrame).R; % rad-ul, z X x, fa long
        HdCS(:, :, iFrame) = SCS(1).Var(iFrame).R; % rad-ul, z X x, hd long
        RaCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R; 

        TrCS(:, :, iFrame) = Unit(5).JCS(2).Var(iFrame).R;
        ShCS(:, :, iFrame) = Unit(1).JCS(3).Var(iFrame).R;
        ElCS(:, :, iFrame) = Unit(1).JCS(2).Var(iFrame).R;
        WrCS(:, :, iFrame) = Unit(1).JCS(1).Var(iFrame).R;
        RhCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R;
    end

    th0(2, :) = asin(reshape(uTorCS(3, 1, :), [1 NUM_FRAME]));
    th0(1, :) = acos(reshape(uTorCS(3, 3, :), [1 NUM_FRAME]) ./ cos(th0(2, :)));
    th0(3, :) = acos(reshape(uTorCS(1, 1, :), [1 NUM_FRAME]) ./ cos(th0(2, :)));
    
    th1(2, :) = asin(reshape(UaCS(3, 1, :), [1 NUM_FRAME]));
    th1(1, :) = acos(reshape(UaCS(3, 3, :), [1 NUM_FRAME]) ./ cos(th1(2, :)));
    th1(3, :) = acos(reshape(UaCS(1, 1, :), [1 NUM_FRAME]) ./ cos(th1(2, :)));
    
    th2(2, :) = asin(reshape(FaCS(3, 1, :), [1 NUM_FRAME]));
    th2(1, :) = acos(reshape(FaCS(3, 3, :), [1 NUM_FRAME]) ./ cos(th2(2, :)));
    th2(3, :) = acos(reshape(FaCS(1, 1, :), [1 NUM_FRAME]) ./ cos(th2(2, :)));
    
    th3(2, :) = asin(reshape(HdCS(3, 1, :), [1 NUM_FRAME]));
    th3(1, :) = acos(reshape(HdCS(3, 3, :), [1 NUM_FRAME]) ./ cos(th3(2, :)));
    th3(3, :) = acos(reshape(HdCS(1, 1, :), [1 NUM_FRAME]) ./ cos(th3(2, :)));
    
    th4(2, :) = asin(reshape(RaCS(3, 1, :), [1 NUM_FRAME]));
    th4(1, :) = acos(reshape(RaCS(3, 3, :), [1 NUM_FRAME]) ./ cos(th4(2, :)));
    th4(3, :) = acos(reshape(RaCS(1, 1, :), [1 NUM_FRAME]) ./ cos(th4(2, :)));



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
    

    thd0 = om0u - om0l;
    thd1 = om1 - om0u;
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

