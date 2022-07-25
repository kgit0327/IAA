addpath('../')
iData = 10;

load('ExpData.mat')

RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);

Constants = GetConstants2(ExperimentDatas, iData);
tDeps = GetTDepend2(ExperimentDatas, iData);

NUM_FRAME = ExperimentDatas(iData).nFr;

g1 = Constants.g(1);
g2 = Constants.g(2);
g3 = Constants.g(3);

m0u = Constants.m(2);
m1 = Constants.m(3);
m2 = Constants.m(4);
m3 = Constants.m(5);
m4 = Constants.m(6);

a0 = tDeps.a_tor;

L0 = tDeps.L0;
L1 = tDeps.L1;
L2 = tDeps.L2;
L3 = tDeps.L3;

Lg0 = tDeps.Lg0;
Lg1 = tDeps.Lg1;
Lg2 = tDeps.Lg2;
Lg3 = tDeps.Lg3;
Lg4 = tDeps.Lg4;

thd0 = tDeps.thd0;
thd1 = tDeps.thd1;
thd2 = tDeps.thd2;
thd3 = tDeps.thd3;
thd4 = tDeps.thd4;

om0u = tDeps.om0u;
om1 = tDeps.om1;
om2 = tDeps.om2;
om3 = tDeps.om3;
om4 = tDeps.om4;

omd0l = tDeps.omd0l;

Om0 = tDeps.Om0;
Om1 = tDeps.Om1;
Om2 = tDeps.Om2;
Om3 = tDeps.Om3;
Om4 = tDeps.Om4;

I_gcs0 = tDeps.I_gcs0;
I_gcs1 = tDeps.I_gcs1;
I_gcs2 = tDeps.I_gcs2;
I_gcs3 = tDeps.I_gcs3;
I_gcs4 = tDeps.I_gcs4;

th2d0 = tDeps.th2d0;
th2d1 = tDeps.th2d1;
th2d2 = tDeps.th2d2;
th2d3 = tDeps.th2d3;
th2d4 = tDeps.th2d4;

Rj0 = tDeps.Rj0;
Rj1 = tDeps.Rj1;
Rj2 = tDeps.Rj2;
Rj3 = tDeps.Rj3;
Rj4 = tDeps.Rj4;

for iFrame = 1 : NUM_FRAME
    thd0_g(:, iFrame) = Rj0(:, :, iFrame) * thd0(:, iFrame);
    thd1_g(:, iFrame) = Rj1(:, :, iFrame) * thd1(:, iFrame);
    thd2_g(:, iFrame) = Rj2(:, :, iFrame) * thd2(:, iFrame);
    thd3_g(:, iFrame) = Rj3(:, :, iFrame) * thd3(:, iFrame);
    thd4_g(:, iFrame) = Rj4(:, :, iFrame) * thd4(:, iFrame);

    th2d0_g(:, iFrame) = Rj0(:, :, iFrame) * th2d0(:, iFrame);
    th2d1_g(:, iFrame) = Rj1(:, :, iFrame) * th2d1(:, iFrame);
    th2d2_g(:, iFrame) = Rj2(:, :, iFrame) * th2d2(:, iFrame);
    th2d3_g(:, iFrame) = Rj3(:, :, iFrame) * th2d3(:, iFrame);
    th2d4_g(:, iFrame) = Rj4(:, :, iFrame) * th2d4(:, iFrame);
end

A0 = cross(Om0, thd0_g);
A1 = cross(Om1, thd1_g);
A2 = cross(Om2, thd2_g);
A3 = cross(Om3, thd3_g);
A4 = cross(Om4, thd4_g);

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
% omd0l = diff(om0l, t);
omd0 = omd0l  + th2d0_g + A0;
omd1  = omd0  + th2d1_g + A1;
omd2  = omd1  + th2d2_g + A2;
omd3  = omd2  + th2d3_g + A3;
omd4  = omd3  + th2d4_g + A4;

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

%%
tr = ExperimentDatas(iData).n.troC;
ri = ExperimentDatas(iData).n.ribC;
sh = ExperimentDatas(iData).n.shR;
el = ExperimentDatas(iData).n.elbR;
wr = ExperimentDatas(iData).n.wrR;
rh = RacketSegdat.n(22:24, :);

a0_ = dif3(dif3(ri, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
a1_ = dif3(dif3(sh, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
a2_ = dif3(dif3(el, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
a3_ = dif3(dif3(wr, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
a4_ = dif3(dif3(rh, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);

ag0_ = dif3(dif3(ExperimentDatas(iData).cgdat(14).cg, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
ag1_ = dif3(dif3(ExperimentDatas(iData).cgdat(3).cg, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
ag2_ = dif3(dif3(ExperimentDatas(iData).cgdat(2).cg, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
ag3_ = dif3(dif3(ExperimentDatas(iData).cgdat(1).cg, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);
ag4_ = dif3(dif3(RacketSegdat.cg, NUM_FRAME, 1 / 200), NUM_FRAME, 1 / 200);

om0u_ = ExperimentDatas(iData).segdat(14).seganV_GCS;
om1_ = ExperimentDatas(iData).segdat(3).seganV_GCS;
om2_ = ExperimentDatas(iData).segdat(2).seganV_GCS;
om3_ = ExperimentDatas(iData).segdat(1).seganV_GCS;
om4_ = RacketSegdat.seganV_GCS;

omd0_ = dif3(om0u_, NUM_FRAME, 1 / 200);
omd1_ = dif3(om1_, NUM_FRAME, 1 / 200);
omd2_ = dif3(om2_, NUM_FRAME, 1 / 200);
omd3_ = dif3(om3_, NUM_FRAME, 1 / 200);
omd4_ = dif3(om4_, NUM_FRAME, 1 / 200);

th0_ = ExperimentDatas(iData).Unit(5).JA(4 : 6, :);
th1_ = ExperimentDatas(iData).Unit(1).JA(1 : 3, :);


[GC, MER, RLP, RM] = GetTiming(ExperimentDatas, GC2RMFrame, iData, 2);

dummy = nan(3, NUM_FRAME);

PlotComp(a1, a1_, GC, RM)

function PlotComp(Data1, Data2, GC, RM)
    figure
    hold on
    plot((GC - RM) / 200 : 1 / 200 : 0, Data1(1, GC : RM), 'Color', 'r', 'LineWidth', 3)
    plot((GC - RM) / 200 : 1 / 200 : 0, Data1(2, GC : RM), 'Color', [0, 128 /255, 0], 'LineWidth', 3)
    plot((GC - RM) / 200 : 1 / 200 : 0, Data1(3, GC : RM), 'Color', 'b', 'LineWidth', 3)
    
    plot((GC - RM) / 200 : 1 / 200 : 0, Data2(1, GC : RM), 'Color', 'r', 'LineWidth', 3, 'LineStyle', '--')
    plot((GC - RM) / 200 : 1 / 200 : 0, Data2(2, GC : RM), 'Color', [0, 128 /255, 0], 'LineWidth', 3, 'LineStyle', '--')
    plot((GC - RM) / 200 : 1 / 200 : 0, Data2(3, GC : RM), 'Color', 'b', 'LineWidth', 3, 'LineStyle', '--')
end