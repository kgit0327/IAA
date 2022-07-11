function Constants = GetConstants(ExperimentDatas, iData)
    %%  
    tic

    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);

    m0l_ = mean(ExperimentDatas(iData).segdat(15).mg(3, :) / -9.807);
    m0u_ = mean(ExperimentDatas(iData).segdat(14).mg(3, :) / -9.807);
    m1_ = mean(ExperimentDatas(iData).segdat(3).mg(3, :) / (-9.807));
    m2_ = mean(ExperimentDatas(iData).segdat(2).mg(3, :) / (-9.807));
    m3_ = mean(ExperimentDatas(iData).segdat(1).mg(3, :) / (-9.807));
    m4_ = mean(RacketSegdat.mg(3, 1) / (-9.807));
    
    I0l = diag(ExperimentDatas(iData).segdat(14).I_LCS);
    I0u = diag(ExperimentDatas(iData).segdat(15).I_LCS);
    I1 = diag(ExperimentDatas(iData).segdat(3).I_LCS);
    I2 = diag(ExperimentDatas(iData).segdat(2).I_LCS);
    I3 = diag(ExperimentDatas(iData).segdat(1).I_LCS);
    I4 = diag(RacketSegdat.I_LCS);
    
    Constants.g = [0; 0; -9.807];
    Constants.m = [m0l_; m0u_; m1_; m2_; m3_; m4_];
    Constants.I = [I0l(1) I0l(2) I0l(3); ...
                   I0u(1) I0u(2) I0u(3); ...
                   I1(1) I1(2) I1(3); ...
                   I2(1) I2(2) I2(3); ...
                   I3(1) I3(2) I3(3); ...
                   I4(1) I4(2) I4(3)];
    Constants.g = [0; 0; -9.807];
end
