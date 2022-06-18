function Constants = GetConstants(ExperimentDatas)
    %%
    
    tic
    
    iData = 10;
    
    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
    
    tr = ExperimentDatas(iData).n.troC;
    cl = ExperimentDatas(iData).n.clav;
    sh = ExperimentDatas(iData).n.shR;
    el = ExperimentDatas(iData).n.elbR;
    wr = ExperimentDatas(iData).n.wrR;
    rh = RacketSegdat.n(22:24, :);
    to = ExperimentDatas(iData).n.Top;
 
    L0_ = tr - cl;
    L1_ = el - sh;
    L2_ = wr - el;
    L3_ = rh - wr;
    L4_ = rh - to;
    
    m0_ = mean((ExperimentDatas(iData).segdat(14).mg(3, :) + ExperimentDatas(iData).segdat(15).mg(3, :)) / -9.807);
    m1_ = mean(ExperimentDatas(iData).segdat(3).mg(3, :) / (-9.807));
    m2_ = mean(ExperimentDatas(iData).segdat(2).mg(3, :) / (-9.807));
    m3_ = mean(ExperimentDatas(iData).segdat(1).mg(3, :) / (-9.807));
    m4_ = mean(RacketSegdat.mg(3, 1) / (-9.807));

    l0_ = mean(sqrt(sum(L0_.*L0_)));
    l1_ = mean(sqrt(sum(L1_.*L1_)));
    l2_ = mean(sqrt(sum(L2_.*L2_)));
    l3_ = mean(sqrt(sum(L3_.*L3_)));
    l4_ = mean(sqrt(sum(L4_.*L4_)));
    
    kx = 0.346;
    ky = 0.357;
    kz = 0.167;

    I0x = m0_ * (l0_ * kx) ^ 2;
    I0y = m0_ * (l0_ * ky) ^ 2;
    I0z = m0_ * (l0_ * kz) ^ 2;
    
    %%
    % g1 = 0;
    % g2 = 0;
    % g3 = -9.807;
    % l0 = 0.5298;
    % l1 = 0.2698;
    % l2 = 0.2587;
    % l3 = 0.0781;
    % l4 = 0.6229;
    % m0 = 26.8950;
    % m1 = 1.4850;
    % m2 = 0.8800;
    % m3 = 0.3300;
    % m4 = 0.0915;
    
    I0 = [I0x, I0y, I0z];
    I1 = diag(ExperimentDatas(iData).segdat(3).I_LCS);
    I2 = diag(ExperimentDatas(iData).segdat(2).I_LCS);
    I3 = diag(ExperimentDatas(iData).segdat(1).I_LCS);
    I4 = diag(RacketSegdat.I_LCS);
    
    Constants.g = [0; 0; -9.807];
    Constants.m = [m0_; m1_; m2_; m3_; m4_];
    Constants.I = [I0(1) I0(2) I0(3); ...
                   I1(1) I1(2) I1(3); ...
                   I2(1) I2(2) I2(3); ...
                   I3(1) I3(2) I3(3); ...
                   I4(1) I4(2) I4(3)];
    Constants.l = [l0_; l1_; l2_; l3_; l4_];
end
