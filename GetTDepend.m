function tDeps = GetTDepend(ExperimentDatas, iData)

    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
    
    NUM_FRAME = ExperimentDatas(iData).nFr;
    
    TorCS = nan(3, 3, NUM_FRAME);
    UaCS = nan(3, 3, NUM_FRAME);
    FaCS = nan(3, 3, NUM_FRAME);
    HdCS = nan(3, 3, NUM_FRAME);
    RaCS = nan(3, 3, NUM_FRAME);

    x0 = unitvec(ExperimentDatas(iData).n.clav - ExperimentDatas(iData).n.shR);
    y0 = unitvec(cross((ExperimentDatas(iData).n.clav - ExperimentDatas(iData).n.troC), x0, 1));
    z0 = unitvec(cross(x0, y0, 1));

    TorCS = [reshape(x0, [3, 1, NUM_FRAME]), reshape(y0, [3, 1, NUM_FRAME]), reshape(z0, [3, 1, NUM_FRAME])];

    z1 = unitvec(ExperimentDatas(iData).n.shR - ExperimentDatas(iData).n.elbR);
    z2 = unitvec(ExperimentDatas(iData).n.elbR - ExperimentDatas(iData).n.wrR);
    z3 = unitvec(ExperimentDatas(iData).n.wrR - RacketSegdat.n(22:24, :));
    z4 = unitvec(RacketSegdat.n(22:24, :) - RacketSegdat.n(1:3, :));

    x1 = unitvec(cross(z2, z1));
    y1 = unitvec(cross(z1, x1));

    k3 = unitvec(ExperimentDatas(iData).n.wrRO - ExperimentDatas(iData).n.wrRI);
%     k4 = unitvec(ExperimentDatas(iData).n.Up - ExperimentDatas(iData).n.Bottom);

    y2 = unitvec(cross(z2, k3));
    x2 = unitvec(cross(y2, z2));

    x3 = unitvec(cross(k3, z3));

    y3 = unitvec(cross(z3, x3));

    y4 = unitvec(cross(z4, k4));
    x4 = unitvec(cross(y4, z4));

    UaCS = [reshape(x1, [3, 1, NUM_FRAME]), reshape(y1, [3, 1, NUM_FRAME]), reshape(z1, [3, 1, NUM_FRAME])];
    FaCS = [reshape(x2, [3, 1, NUM_FRAME]), reshape(y2, [3, 1, NUM_FRAME]), reshape(z2, [3, 1, NUM_FRAME])];
    HdCS = [reshape(x3, [3, 1, NUM_FRAME]), reshape(y3, [3, 1, NUM_FRAME]), reshape(z3, [3, 1, NUM_FRAME])];
    RaCS = [reshape(x4, [3, 1, NUM_FRAME]), reshape(y4, [3, 1, NUM_FRAME]), reshape(z4, [3, 1, NUM_FRAME])];

%     for iFrame = 1 : NUM_FRAME
%         TorCS(:, :, iFrame) = ExperimentDatas(iData).SCS(14).Var(iFrame).R;
%         UaCS(:, :, iFrame) = ExperimentDatas(iData).SCS(3).Var(iFrame).R;
%         FaCS(:, :, iFrame) = ExperimentDatas(iData).SCS(2).Var(iFrame).R;
%         HdCS(:, :, iFrame) = ExperimentDatas(iData).SCS(1).Var(iFrame).R;
%         RaCS(:, :, iFrame) = RacketSegdat.Var(iFrame).R;
%     end

    TlowCS = TorCS;
    
    ShCS(:, 1, :) = UaCS(:, 3, :);
    ShCS(:, 2, :) = cross(TorCS(:, 3, :), ShCS(:, 1, :));
    ShCS(:, 3, :) = cross(ShCS(:, 1, :), ShCS(:, 2, :));
    
    ElCS(:, 1, :) = FaCS(:, 3, :);    
    ElCS(:, 2, :) = FaCS(:, 3, :);
    ElCS(:, 1, :) = cross(ElCS(:, 2, :), ShCS(:, 1, :));
    ElCS(:, 3, :) = cross(ElCS(:, 1, :), ElCS(:, 2, :));
    
    WrCS(:, 1, :) = FaCS(:, 3, :);
    WrCS(:, 2, :) = FaCS(:, 3, :);
    WrCS(:, 3, :) = FaCS(:, 2, :);
    WrCS(:, 2, :) = cross(WrCS(:, 3, :), WrCS(:, 1, :));
    
%     RhCS(:, 1, :) = RaCS(:, 3, :);
%     RhCS(:, 2, :) = FaCS(:, 3, :);
%     RhCS(:, 3, :) = HdCS(:, 2, :);
%     RhCS(:, 2, :) = cross(RhCS(:, 3, :), RhCS(:, 1, :));
    RhCS = RaCS;
    
%     om0_ = ExperimentDatas(iData).segdat(14).seganV_GCS;
%     om1_ = ExperimentDatas(iData).segdat(3).seganV_GCS;
%     om2_ = ExperimentDatas(iData).segdat(2).seganV_GCS;
%     om3_ = ExperimentDatas(iData).segdat(1).seganV_GCS;
%     om4_ = RacketSegdat.seganV_GCS;

    th0(2, :) = asin(reshape(TorCS(3, 1, :), [1 NUM_FRAME]));
    th0(1, :) = -asin(reshape(TorCS(3, 2, :), [1 NUM_FRAME]) / cos(th0(2, :)));
    th0(3, :) = -asin(reshape(TorCS(2, 1, :), [1 NUM_FRAME]) / cos(th0(2, :)));
    
    th1(2, :) = asin(reshape(UaCS(3, 1, :), [1 NUM_FRAME]));
    th1(1, :) = -asin(reshape(UaCS(3, 2, :), [1 NUM_FRAME]) / cos(th1(2, :)));
    th1(3, :) = -asin(reshape(UaCS(2, 1, :), [1 NUM_FRAME]) / cos(th1(2, :)));
    
    th2(2, :) = asin(reshape(FaCS(3, 1, :), [1 NUM_FRAME]));
    th2(1, :) = -asin(reshape(FaCS(3, 2, :), [1 NUM_FRAME]) / cos(th2(2, :)));
    th2(3, :) = -asin(reshape(FaCS(2, 1, :), [1 NUM_FRAME]) / cos(th2(2, :)));
    
    th3(2, :) = asin(reshape(HdCS(3, 1, :), [1 NUM_FRAME]));
    th3(1, :) = -asin(reshape(HdCS(3, 2, :), [1 NUM_FRAME]) / cos(th3(2, :)));
    th3(3, :) = -asin(reshape(HdCS(2, 1, :), [1 NUM_FRAME]) / cos(th3(2, :)));
    
    th4(2, :) = asin(reshape(RaCS(3, 1, :), [1 NUM_FRAME]));
    th4(1, :) = -asin(reshape(RaCS(3, 2, :), [1 NUM_FRAME]) / cos(th4(2, :)));
    th4(3, :) = -asin(reshape(RaCS(2, 1, :), [1 NUM_FRAME]) / cos(th4(2, :)));
    
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

