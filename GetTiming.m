function [GC, RLP, MER, RM] = GetTiming(ExperimentDatas, GC2RMFrame, iData, iPeriod)
    if iData < 11
        GC = GC2RMFrame(iData).GC2RM(1, iPeriod);
        RM = GC2RMFrame(iData).GC2RM(2, iPeriod);
    
        top = ExperimentDatas(iData).n.Top;
        
        sh_ex = -ExperimentDatas(iData).Unit(1).JA(3, :);
    
        [~, RLP] = findpeaks(-top(3, GC : RM), "MinPeakHeight", -1.5);
        RLP = RLP + GC - 1;

        [~, MER] = max(sh_ex(1, RLP : RM));
        MER = MER + RLP - 1;
    
        
    
        
    else
        GC = GC2RMFrame(iData).GC2RM(1, iPeriod);
    
        top = ExperimentDatas(iData).n.Top;
        
        sh_ex = ExperimentDatas(iData).Unit(1).JA(3, :);
    
        [~, MER] = max(sh_ex(1, GC2RMFrame(iData).GC2RM(1, iPeriod):GC2RMFrame(iData).GC2RM(2, iPeriod)));
        MER = MER+GC2RMFrame(iData).GC2RM(1, iPeriod)-1;
    
        [~, RLP] = min(top(1, MER:GC2RMFrame(iData).GC2RM(2, iPeriod)), [], 2);
        RLP = RLP+MER-1;
    
        RM = GC2RMFrame(iData).GC2RM(2, iPeriod);
    end
    


end