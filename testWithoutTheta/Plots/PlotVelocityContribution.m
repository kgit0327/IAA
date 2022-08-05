clear
close all
clc

addpath('../')
addpath('../../')
load IAA_data.mat

iData = 1;

NUM_FRAME = ExpDat(iData).nFr;

RacketSegdat = GetRacketSegmentData(ExpDat, iData);
tDeps = GetTDepend2(ExpDat, iData);

tr = ExpDat(iData).n.troC;
ri = ExpDat(iData).n.ribC;
sh = ExpDat(iData).n.shR;
el = ExpDat(iData).n.elbR;
wr = ExpDat(iData).n.wrR;
rh = RacketSegdat.n(22:24, :);
to = ExpDat(iData).n.Top;

rg0l = ExpDat(iData).cgdat(15).cg;

om0l = tDeps.om0l;
om0u = tDeps.om0u;
om1 = tDeps.om1;
om2 = tDeps.om2;
om3 = tDeps.om3;
om4 = tDeps.om4;

thd0_gcs = om0u - om0l;
thd1_gcs = om1 - om0u;
thd2_gcs = om2 - om1;
thd3_gcs = om3 - om2;
thd4_gcs = om4 - om3;

Rj0 = tDeps.Rj0;
Rj1 = tDeps.Rj1;
Rj2 = tDeps.Rj2;
Rj3 = tDeps.Rj3;
Rj4 = tDeps.Rj4;

thd0 = tDeps.thd0;
thd1 = tDeps.thd1;
thd2 = tDeps.thd2;
thd3 = tDeps.thd3;
thd4 = tDeps.thd4;

for iFrame = 1 : NUM_FRAME
    thd0_Ex(:, iFrame) = Rj0(:, 1, iFrame) * thd0(1, iFrame);
    thd0_Lu(:, iFrame) = Rj0(:, 2, iFrame) * thd0(2, iFrame);
    thd0_Lr(:, iFrame) = Rj0(:, 3, iFrame) * thd0(3, iFrame);

    thd1_Ab(:, iFrame) = Rj1(:, 1, iFrame) * thd1(1, iFrame);
    thd1_Ex(:, iFrame) = Rj1(:, 2, iFrame) * thd1(2, iFrame);
    thd1_Ir(:, iFrame) = Rj1(:, 3, iFrame) * thd1(3, iFrame);

    thd2_Fr(:, iFrame) = Rj2(:, 1, iFrame) * thd2(1, iFrame);
    thd2_Ab(:, iFrame) = Rj2(:, 2, iFrame) * thd2(2, iFrame);
    thd2_Er(:, iFrame) = Rj2(:, 3, iFrame) * thd2(3, iFrame);

    thd3_Pf(:, iFrame) = Rj3(:, 1, iFrame) * thd3(1, iFrame);
    thd3_Ab(:, iFrame) = Rj3(:, 2, iFrame) * thd3(2, iFrame);
    thd3_Ir(:, iFrame) = Rj3(:, 3, iFrame) * thd3(3, iFrame);

    thd4_Ab(:, iFrame) = Rj4(:, 1, iFrame) * thd4(1, iFrame);
    thd4_Ex(:, iFrame) = Rj4(:, 2, iFrame) * thd4(2, iFrame);
    thd4_Ir(:, iFrame) = Rj4(:, 3, iFrame) * thd4(3, iFrame);
end

Vg0l = dif3(rg0l, NUM_FRAME, 1 / 200);

Vto = dif3(to, NUM_FRAME, 1 / 200);

V0l = cross(om0l, (to - rg0l));
V0u = cross(thd0_gcs, (to - ri));
V1 = cross(thd1_gcs, (to - sh));
V2 = cross(thd2_gcs, (to - el));
V3 = cross(thd3_gcs, (to - wr));
V4 = cross(thd4_gcs, (to - rh));

Vto_ = Vg0l + V0l + V0u + V1 + V2 + V3 + V4;

V0u_Ex = cross(thd0_Ex, (to - ri));
V0u_Lu = cross(thd0_Lu, (to - ri));
V0u_Lr = cross(thd0_Lr, (to - ri));

V1_Ab = cross(thd1_Ab, (to - sh));
V1_Ex = cross(thd1_Ex, (to - sh));
V1_Ir = cross(thd1_Ir, (to - sh));

V2_Fr = cross(thd2_Fr, (to - el));
V2_Ab = cross(thd2_Ab, (to - el));
V2_Er = cross(thd2_Er, (to - el));

V3_Pf = cross(thd3_Pf, (to - wr));
V3_Ab = cross(thd3_Ab, (to - wr));
V3_Ir = cross(thd3_Ir, (to - wr));

V4_Ab = cross(thd4_Ab, (to - rh));
V4_Ex = cross(thd4_Ex, (to - rh));
V4_Ir = cross(thd4_Ir, (to - rh));

[GC, ~, ~, RM] = GetTiming(ExpDat, GC2RMdat, iData, 1);

set(0, 'DefaultLineLineWidth', 3)

LABEL = categorical({'FB', 'LR', 'UD', 'tEF', 'tLu', 'tLr', 'sAb', 'sEF', 'sIr', 'eFE', 'eAb', 'eEr', 'wPf', 'wAb', 'wIr', 'rAb', 'rEF', 'rIr', 'IN', 'GR'});
LABEL = reordercats(LABEL, {'FB', 'LR', 'UD', 'tEF', 'tLu', 'tLr', 'sAb', 'sEF', 'sIr', 'eFE', 'eAb', 'eEr', 'wPf', 'wAb', 'wIr', 'rAb', 'rEF', 'rIr', 'IN', 'GR'});
c = [1, 0.25, 0.1; 1, 1, 0; 0.1, 0.5, 0.1; 0, 0.55, 1; 0.45, 1, 1; 1, 0.45, 0.65; 1, 0.55, 0; 0.7, 0.05, 1; ...
     0.45, 0.1, 0; 1, 0.75, 0.85; 1, 1, 0.6; 0.2, 1, 0.1; 0.7, 1, 1; 1, 0.75, 0.55; 0.55, 1, 0.55; 0.75, 0.7, 1; ...
     0, 0, 0; 0.78, 0.78, 0.79; 0.6, 0.6, 0.2; 0.51, 0.56, 0.61];

figure
hold on


plot((GC - RM) / 200 : 1 / 200 : 0, V0u_Ex(1, GC : RM), 'Color', c(4, :), 'DisplayName', string(LABEL(4)))
plot((GC - RM) / 200 : 1 / 200 : 0, V0u_Lu(1, GC : RM), 'Color', c(5, :), 'DisplayName', string(LABEL(5)))
plot((GC - RM) / 200 : 1 / 200 : 0, V0u_Lr(1, GC : RM), 'Color', c(6, :), 'DisplayName', string(LABEL(6)))

plot((GC - RM) / 200 : 1 / 200 : 0, V1_Ab(1, GC : RM), 'Color', c(7, :), 'DisplayName', string(LABEL(7)))
plot((GC - RM) / 200 : 1 / 200 : 0, V1_Ex(1, GC : RM), 'Color', c(8, :), 'DisplayName', string(LABEL(8)))
plot((GC - RM) / 200 : 1 / 200 : 0, V1_Ir(1, GC : RM), 'Color', c(9, :), 'DisplayName', string(LABEL(9)))

plot((GC - RM) / 200 : 1 / 200 : 0, V2_Fr(1, GC : RM), 'Color', c(10, :), 'DisplayName', string(LABEL(10)))
plot((GC - RM) / 200 : 1 / 200 : 0, V2_Ab(1, GC : RM), 'Color', c(11, :), 'DisplayName', string(LABEL(11)))
plot((GC - RM) / 200 : 1 / 200 : 0, V2_Er(1, GC : RM), 'Color', c(12, :), 'DisplayName', string(LABEL(12)))

plot((GC - RM) / 200 : 1 / 200 : 0, V3_Pf(1, GC : RM), 'Color', c(13, :), 'DisplayName', string(LABEL(13)))
plot((GC - RM) / 200 : 1 / 200 : 0, V3_Ab(1, GC : RM), 'Color', c(14, :), 'DisplayName', string(LABEL(14)))
plot((GC - RM) / 200 : 1 / 200 : 0, V3_Ir(1, GC : RM), 'Color', c(15, :), 'DisplayName', string(LABEL(15)))

plot((GC - RM) / 200 : 1 / 200 : 0, V4_Ab(1, GC : RM), 'Color', c(16, :), 'DisplayName', string(LABEL(16)))
plot((GC - RM) / 200 : 1 / 200 : 0, V4_Ex(1, GC : RM), 'Color', c(17, :), 'DisplayName', string(LABEL(17)))
plot((GC - RM) / 200 : 1 / 200 : 0, V4_Ir(1, GC : RM), 'Color', c(18, :), 'DisplayName', string(LABEL(18)))

plot((GC - RM) / 200 : 1 / 200 : 0, Vg0l(1, GC : RM), 'Color', c(19, :), 'DisplayName', 'Vg0l')
plot((GC - RM) / 200 : 1 / 200 : 0, V0l(1, GC : RM), 'Color', c(20, :), 'DisplayName', 'V0l')

legend('Location', 'best', 'NumColumns', 6)


