function FN = GetFN(ExperimentDatas, iData)
    n = ExperimentDatas(iData).n;
    segdat = ExperimentDatas(iData).segdat;
    nFr = ExperimentDatas(iData).nFr;
    FP = ExperimentDatas(iData).FP;
    
    RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
    
 for iFr=1:nFr
     
     GRF_L(:,iFr) = FP(1).grf(:,iFr);
     COP_L(:,iFr) = FP(1).cop(:,iFr);
     GRF_R(:,iFr) = FP(2).grf(:,iFr);
     COP_R(:,iFr) = FP(2).cop(:,iFr);
     FM_L(:,iFr) = FP(1).FM(:,iFr);
     FM_R(:,iFr) = FP(2).FM(:,iFr);


    %---------
    %Racket
    %---------
    cg = RacketSegdat.cg(:, iFr);
    mg = RacketSegdat.mg(:, iFr);
    ma = RacketSegdat.ma(:, iFr);
    Ncg = RacketSegdat.N(:, iFr);
    distF = [0; 0; 0];
    distN = [0; 0; 0];
    rcgD = RacketSegdat.n(1:3, iFr)-cg;
    rcgP = RacketSegdat.n(22:24, iFr)-cg;
    
    [FN(5, 3).F(:, iFr), FN(5, 3).N(:, iFr)] = getFN(Ncg, mg, ma, distF, distN, rcgD, rcgP);


     %--------------------------------
     %group1
     %--------------------------------
     
     %handR→wrR

     cg = segdat(1).cg(:,iFr);
     mg = segdat(1).mg(:,iFr);
     ma = segdat(1).ma(:,iFr);
     Ncg = segdat(1).N(:,iFr);
     distF = -FN(5, 3).F(:, iFr);
     distN = -FN(5, 3).N(:, iFr);
     rcgD = RacketSegdat.n(22:24, iFr) - cg;
     rcgP = n.wrR(:,iFr)-cg;
     
     [FN(1,3).F(:,iFr),FN(1,3).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
     
     %farmR→elbR
     
     cg = segdat(2).cg(:,iFr);
     mg = segdat(2).mg(:,iFr);
     ma = segdat(2).ma(:,iFr);
     Ncg = segdat(2).N(:,iFr);
     distF = -FN(1,3).F(:,iFr);
     distN = -FN(1,3).N(:,iFr);
     rcgD = n.wrR(:,iFr)-cg;
     rcgP = n.elbR(:,iFr)-cg;
     
     [FN(1,2).F(:,iFr),FN(1,2).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
          
     %uarmR→shR

     cg = segdat(3).cg(:,iFr);
     mg = segdat(3).mg(:,iFr);
     ma = segdat(3).ma(:,iFr);
     Ncg = segdat(3).N(:,iFr);
     distF = -FN(1,2).F(:,iFr);
     distN = -FN(1,2).N(:,iFr);
     rcgD = n.elbR(:,iFr)-cg;
     rcgP = n.shR(:,iFr)-cg;
     
     [FN(1,1).F(:,iFr),FN(1,1).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
      
     %--------------------------------
     %group2
     %--------------------------------
     
     %handL→wrL

     cg = segdat(4).cg(:,iFr);
     mg = segdat(4).mg(:,iFr);
     ma = segdat(4).ma(:,iFr);
     Ncg = segdat(4).N(:,iFr);
     distF = [0 0 0]';
     distN = [0 0 0]';
     rcgD = n.handL(:,iFr)-cg;
     rcgP = n.wrL(:,iFr)-cg;
     
     [FN(2,3).F(:,iFr),FN(2,3).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
    
     %farmL→elb

     cg = segdat(5).cg(:,iFr);
     mg = segdat(5).mg(:,iFr);
     ma = segdat(5).ma(:,iFr);
     Ncg = segdat(5).N(:,iFr);
     distF = -FN(2,3).F(:,iFr);
     distN = -FN(2,3).N(:,iFr);
     rcgD = n.wrL(:,iFr)-cg;
     rcgP = n.elbL(:,iFr)-cg;
     
     [FN(2,2).F(:,iFr),FN(2,2).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
    
     %uarmL→shL

     cg = segdat(6).cg(:,iFr);
     mg = segdat(6).mg(:,iFr);
     ma = segdat(6).ma(:,iFr);
     Ncg = segdat(6).N(:,iFr);
     distF = -FN(2,2).F(:,iFr);
     distN = -FN(2,2).N(:,iFr);
     rcgD = n.elbL(:,iFr)-cg;
     rcgP = n.shL(:,iFr)-cg;
     
     [FN(2,1).F(:,iFr),FN(2,1).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
    
     %--------------------------------
     %group3
     %--------------------------------
     
     %footR→ankleR

     cg = segdat(7).cg(:,iFr);
     mg = segdat(7).mg(:,iFr);
     ma = segdat(7).ma(:,iFr);
     Ncg = segdat(7).N(:,iFr);
     distF = GRF_R(:,iFr);
     distN = FM_R(:,iFr);
     rcgD = COP_R(:,iFr)-cg;
     rcgP = n.anR(:,iFr)-cg;
     
     [FN(3,3).F(:,iFr),FN(3,3).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
     
     %shankR→kneeR
 
     cg = segdat(8).cg(:,iFr);
     mg = segdat(8).mg(:,iFr);
     ma = segdat(8).ma(:,iFr);
     Ncg = segdat(8).N(:,iFr);
     distF = -FN(3,3).F(:,iFr);
     distN = -FN(3,3).N(:,iFr);
     rcgD = n.anR(:,iFr)-cg;
     rcgP = n.knR(:,iFr)-cg;
     
     [FN(3,2).F(:,iFr),FN(3,2).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
     
     %thighR→hipR
      
     cg = segdat(9).cg(:,iFr);
     mg = segdat(9).mg(:,iFr);
     ma = segdat(9).ma(:,iFr);
     Ncg = segdat(9).N(:,iFr);
     distF = -FN(3,2).F(:,iFr);
     distN = -FN(3,2).N(:,iFr);
     rcgD = n.knR(:,iFr)-cg;
     rcgP = n.hipR(:,iFr)-cg;
     
     [FN(3,1).F(:,iFr),FN(3,1).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
            
     %--------------------------------
     %group4
     %--------------------------------

     %footL→ankleL
 
     cg = segdat(10).cg(:,iFr);
     mg = segdat(10).mg(:,iFr);
     ma = segdat(10).ma(:,iFr);
     Ncg = segdat(10).N(:,iFr);
     distF = GRF_L(:,iFr);
     distN = FM_L(:,iFr);
     rcgD=COP_L(:,iFr)-cg;
     rcgP=n.anL(:,iFr)-cg;
     
     [FN(4,3).F(:,iFr),FN(4,3).N(:,iFr)]=getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
     
     %shankL→kneeL
 
     cg = segdat(11).cg(:,iFr);
     mg = segdat(11).mg(:,iFr);
     ma = segdat(11).ma(:,iFr);
     Ncg = segdat(11).N(:,iFr);
     distF = -FN(4,3).F(:,iFr);
     distN = -FN(4,3).N(:,iFr);
     rcgD = n.anL(:,iFr)-cg;
     rcgP = n.knL(:,iFr)-cg;
     
     [FN(4,2).F(:,iFr),FN(4,2).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
     
     %thighL→hipL
 
     cg = segdat(12).cg(:,iFr);
     mg = segdat(12).mg(:,iFr);
     ma = segdat(12).ma(:,iFr);
     Ncg = segdat(12).N(:,iFr);
     distF = -FN(4,2).F(:,iFr);
     distN = -FN(4,2).N(:,iFr);
     rcgD = n.knL(:,iFr)-cg;
     rcgP = n.hipL(:,iFr)-cg;
     
     [FN(4,1).F(:,iFr),FN(4,1).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
      
     %--------------------------------
     %group5
     %-------------------------------- 
    
     %Head→Neck
     
     cg = segdat(13).cg(:,iFr);
     mg = segdat(13).mg(:,iFr);
     ma = segdat(13).ma(:,iFr);
     Ncg = segdat(13).N(:,iFr);
     distF = [0;0;0];
     distN = [0;0;0];
     rcgD = n.head(:,iFr)-cg;
     rcgP = n.c(:,iFr)-cg;
     
     [FN(5,1).F(:,iFr),FN(5,1).N(:,iFr)] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP);
      
    %corp→ribC  corpus sterni(胸骨体)
    
    cg = segdat(14).cg(:,iFr);
    mg = segdat(14).mg(:,iFr);
    ma = segdat(14).ma(:,iFr);
    Ncg = segdat(14).N(:,iFr);
    
    distF = -FN(5,1).F(:,iFr);
    distN = -FN(5,1).N(:,iFr);
    distFR = -FN(1,1).F(:,iFr);
    distNR = -FN(1,1).N(:,iFr);
    distFL = -FN(2,1).F(:,iFr);
    distNL = -FN(2,1).N(:,iFr);
    
    FN(5,2).F(:,iFr) = ma-mg-distFR-distFL-distF;
    
    rnec = n.c(:,iFr)-cg;
    rsR = n.shR(:,iFr)-cg;
    rsL = n.shL(:,iFr)-cg;
    rupt = n.ribC(:,iFr)-cg;
    
    FN(5,2).N(:,iFr)=Ncg-cross(rsL,distFL)-cross(rsR,distFR)...
                    -cross(rupt,FN(5,2).F(:,iFr))-cross(rnec,distF)...
                    -distNR-distNL-distN;
                
                
 %FN     1                         2                           3          
 %1  (shRのF,N)                (elRのF,N)                 (wrRのF,N)
 %2  (shLのF,M)                (elbLのF,M)                (wrLのF,M)
 %3  (hipRのF,N)               (knRのF,N)                 (anRのF,N)
 %4  (hipLのF,M)               (knLのF,M)                 (anLのF,M)
 %5  (neckのF,N)               (ribCのF,N)
 
 end
     
end

function [F,N] = getFN(Ncg,mg,ma,distF,distN,rcgD,rcgP)

	F = ma-mg-distF;
	N = Ncg-distN-cross(rcgP,F)-cross(rcgD,distF);

end

