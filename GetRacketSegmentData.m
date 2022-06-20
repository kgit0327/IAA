function segdat = GetRacketSegmentData(ExperimentDatas, iData)
    Racket(iData).Position(1:3, :) = ExperimentDatas(iData).n.Top;
    Racket(iData).Position(4:6, :) = ExperimentDatas(iData).n.Bottom;
    Racket(iData).Position(7:9, :) = ExperimentDatas(iData).n.Down;
    Racket(iData).Position(10:12, :) = ExperimentDatas(iData).n.Up;
    Racket(iData).Position(13:15, :) = ExperimentDatas(iData).n.UpOffset;
    Racket(iData).Position(16:18, :) = ExperimentDatas(iData).n.Middle;
    Racket(iData).Position(19:21, :) = ExperimentDatas(iData).n.MiddleOffset;

    
    
    DataLength = size(Racket(iData).Position, 2);
    
    for iFrame = 1:DataLength

        top = Racket(iData).Position(1:3, iFrame);
        bot = Racket(iData).Position(4:6, iFrame);
        dow = Racket(iData).Position(7:9, iFrame);
        up = Racket(iData).Position(10:12, iFrame);



        Zaxis = unitvec(Racket(iData).Position(1:3, iFrame)-Racket(iData).Position(4:6, iFrame));
        Saxis = unitvec(Racket(iData).Position(10:12, iFrame)-Racket(iData).Position(7:9, iFrame));
        Yaxis = unitvec(cross(Zaxis, Saxis));
        Xaxis = unitvec(cross(Yaxis, Zaxis));

        a = Racket(iData).Position(1:3, iFrame)-Racket(iData).Position(4:6, iFrame);
        b = ExperimentDatas(iData).n.handR(:, iFrame)-Racket(iData).Position(4:6, iFrame);
        rh(:, iFrame) = (dot(a, b)/dot(a, a)).*a + bot;
% 
%         rc(:, iFrame) = (Racket(iData).Position(10:12, iFrame)+Racket(iData).Position(7:9, iFrame))/2;
% 
%         Zaxis = unitvec(rh(:, iFrame)-rc(:, iFrame));
%         Saxis = unitvec(Racket(iData).Position(10:12, iFrame)-Racket(iData).Position(7:9, iFrame));
%         Yaxis = unitvec(cross(Zaxis, Saxis));
%         Xaxis = unitvec(cross(Yaxis, Zaxis));
        
        R = [Xaxis, Yaxis, Zaxis];
        Var(iFrame).R = R;
        
        Racket(iData).cg(:, iFrame) = Racket(iData).Position(4:6, iFrame)+0.35*Zaxis;
        
    end
    
    cgV = dif3(Racket(iData).cg, DataLength, 1/200);
    cgA = dif3(cgV, DataLength, 1/200);
    
    for iFrame = 1:DataLength
        CS = Var(iFrame).R;
        lcs.i(:, iFrame) = CS(:, 1);
        lcs.j(:, iFrame) = CS(:, 2);
        lcs.k(:, iFrame) = CS(:, 3);
    end
    
    lcs.id = dif3(lcs.i, DataLength, 1/200);
    lcs.jd = dif3(lcs.j, DataLength, 1/200);
    lcs.kd = dif3(lcs.k, DataLength, 1/200);
    
    I_LCS = [0.004804793, 0, 0; 0, 0.004619344, 0; 0, 0, 0.000172579];
%     I_LCS = [0.01, 0, 0; 0, 0.01, 0; 0, 0, 0.001];
    m = 0.0915;

    I = diag(I_LCS)';
    
    for iFrame = 1:DataLength
        seganV_LCS(:, iFrame) = [dot(lcs.k(:, iFrame), lcs.jd(:, iFrame)); ...
                                 dot(lcs.i(:, iFrame), lcs.kd(:, iFrame)); ...
                                 dot(lcs.j(:, iFrame), lcs.id(:, iFrame))];
        
        R = Var(iFrame).R;
        
        seganV_GCS(:, iFrame) = R*seganV_LCS(:, iFrame);
        
        I_GCS(iFrame).I = R*I_LCS*R';
        
        segdat.I_GCS(iFrame).I = R*I_LCS*R';
        
        L(:, iFrame) = I_GCS(iFrame).I*seganV_GCS(:, iFrame);
        

        Krot(:, iFrame) = (I*(seganV_LCS(:, iFrame).*seganV_LCS(:, iFrame)))/2;
        

        
        V = sqrt(sum(cgV(:, iFrame).*cgV(:, iFrame)));
        Ktra(:, iFrame) = (m*V*V)/2;
        
        U(:, iFrame) = m*9.807*Racket(iData).cg(3, iFrame);
        g = [0; 0; -9.807];
        gg(:, iFrame) = g;
    
        mg(:, iFrame) = m*gg(:, iFrame);
        ma(:, iFrame) = m*cgA(:, iFrame);

        %-------
        zrhR = R(:, 3);
        xrhR = ExperimentDatas(iData).SCS(1).Var(iFrame).R(:,1);
        yrhR = unitvec(cross(zrhR,xrhR));
              
        R_JCS = [xrhR yrhR zrhR];
        
        tmp = (ExperimentDatas(iData).SCS(1).Var(iFrame).R)\unitvec(cross(zrhR,xrhR));
        JAtmp.rhz(iFrame) = atan2(tmp(3),tmp(2));
%         JAtmp.rhz = modifyJA(JAtmp.rhz);
        
        %---JA.sAA--- +AB / -AD
        tmp = (R_JCS)\unitvec(zrhR);
        JAtmp.rhy(iFrame) = -atan2(tmp(1),tmp(3));
%         JAtmp.rhy = modifyJA(JAtmp.rhy);
        
        %---JA.sIER--- +ER / -IR
        tmp = (R)\unitvec(cross(yrhR,zrhR));
        JAtmp.rhx(iFrame) = atan2(tmp(2),tmp(1));
%         JAtmp.rhx = modifyJA(JAtmp.rhx);

        rh_an = [JAtmp.rhz;JAtmp.rhy;JAtmp.rhx];

    end

    seganA_GCS = dif3(seganV_GCS, DataLength, 1/200);                             % 絶対座標系におけるセグメントの角加速度
    
    N = dif3(L, DataLength, 1/200);                                               % 角運動量の微分
     
    E = Krot+Ktra+U;                                                        % エネルギーの総和 
    
    segdat.n = Racket(iData).Position;
    segdat.n(22:24, :) = rh;
    
    segdat.cg           = Racket(iData).cg;             %重心位置
	segdat.cgV          = cgV;                	%重心速度
	segdat.cgA          = cgA;                  %重心加速度
    segdat.seganV_GCS	= seganV_GCS;			%セグメント角速度(GCS)
	segdat.seganA_GCS   = seganA_GCS;			%セグメント角加速度(GCS)
	segdat.seganV_LCS	= seganV_LCS;			%セグメント角速度(LCS)
    segdat.I_LCS        = I_LCS;                %慣性主軸に一致する慣性テンソル
    segdat.I_GCS        = I_GCS;                %慣性主軸に一致しない軸まわりの慣性テンソル
	segdat.L            = L; 					%角運動量
	segdat.N            = N;         			%角運動量の微分
    segdat.mg           = mg;                   %重力
    segdat.ma           = ma;                   %運動方程式の左辺
    segdat.Krot         = Krot;                 %回転のエネルギー
    segdat.Ktra         = Ktra;                 %並進のエネルギー
    segdat.U            = U;                    %位置エネルギー
    segdat.E            = E;                    %全エネルギー 

    segdat.rh_an        = rh_an;
    segdat.Var          = Var;

end