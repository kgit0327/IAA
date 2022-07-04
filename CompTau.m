tic
clear all

load('NPMEAN.mat');

iData = 1;
iPeriod = 1;

Constants = GetConstants(ExperimentDatas, iData);
tDeps = GetTDepend(ExperimentDatas, iData);
RacketSegdat = GetRacketSegmentData(ExperimentDatas, iData);
[GC, ~, ~, RM] = GetTiming(ExperimentDatas, GC2RMFrame, iData, iPeriod);

NUM_FRAME = ExperimentDatas(iData).nFr;

g1 = Constants.g(1);
g2 = Constants.g(2);
g3 = Constants.g(3);

l0 = Constants.l(1);
l1 = Constants.l(2);
l2 = Constants.l(3);
l3 = Constants.l(4);
l4 = Constants.l(5);

m0 = Constants.m(1);
m1 = Constants.m(2);
m2 = Constants.m(3);
m3 = Constants.m(4);
m4 = Constants.m(5);

I_01 = Constants.I(1, 1);
I_02 = Constants.I(1, 2);
I_03 = Constants.I(1, 3);
I_11 = Constants.I(2, 1);
I_12 = Constants.I(2, 2);
I_13 = Constants.I(2, 3);
I_21 = Constants.I(3, 1);
I_22 = Constants.I(3, 2);
I_23 = Constants.I(3, 3);
I_31 = Constants.I(4, 1);
I_32 = Constants.I(4, 2);
I_33 = Constants.I(4, 3);
I_41 = Constants.I(5, 1);
I_42 = Constants.I(5, 2);
I_43 = Constants.I(5, 3);

th0 = tDeps.th0;
th1 = tDeps.th1;
th2 = tDeps.th2;
th3 = tDeps.th3;
th4 = tDeps.th4;

thd0 = tDeps.thd0;
thd1 = tDeps.thd1;
thd2 = tDeps.thd2;
thd3 = tDeps.thd3;
thd4 = tDeps.thd4;

th2d0 = tDeps.th2d0;
th2d1 = tDeps.th2d1;
th2d2 = tDeps.th2d2;
th2d3 = tDeps.th2d3;
th2d4 = tDeps.th2d4;

a_tor = tDeps.a_tor;


Tau = nan(15, NUM_FRAME); % RM - GC + 1);

fprintf('Initialized\n')
toc

tic



parfor iFrame = 1 : NUM_FRAME% RM - GC + 1
    iFrame_ = iFrame; % GC - 1 + iFrame;

    th0_1 = th0(1, iFrame_);
    th0_2 = th0(2, iFrame_);
    th0_3 = th0(3, iFrame_);
    th1_1 = th1(1, iFrame_);
    th1_2 = th1(2, iFrame_);
    th1_3 = th1(3, iFrame_);
    th2_1 = th2(1, iFrame_);
    th2_2 = th2(2, iFrame_);
    th2_3 = th2(3, iFrame_);
    th3_1 = th3(1, iFrame_);
    th3_2 = th3(2, iFrame_);
    th3_3 = th3(3, iFrame_);
    th4_1 = th4(1, iFrame_);
    th4_2 = th4(2, iFrame_);
    th4_3 = th4(3, iFrame_);
    
    thd0_1 = thd0(1, iFrame_);
    thd0_2 = thd0(2, iFrame_);
    thd0_3 = thd0(3, iFrame_);
    thd1_1 = thd1(1, iFrame_);
    thd1_2 = thd1(2, iFrame_);
    thd1_3 = thd1(3, iFrame_);
    thd2_1 = thd2(1, iFrame_);
    thd2_2 = thd2(2, iFrame_);
    thd2_3 = thd2(3, iFrame_);
    thd3_1 = thd3(1, iFrame_);
    thd3_2 = thd3(2, iFrame_);
    thd3_3 = thd3(3, iFrame_);
    thd4_1 = thd4(1, iFrame_);
    thd4_2 = thd4(2, iFrame_);
    thd4_3 = thd4(3, iFrame_);
    
    th2d0_1 = th2d0(1, iFrame_);
    th2d0_2 = th2d0(2, iFrame_);
    th2d0_3 = th2d0(3, iFrame_);
    th2d1_1 = th2d1(1, iFrame_);
    th2d1_2 = th2d1(2, iFrame_);
    th2d1_3 = th2d1(3, iFrame_);
    th2d2_1 = th2d2(1, iFrame_);
    th2d2_2 = th2d2(2, iFrame_);
    th2d2_3 = th2d2(3, iFrame_);
    th2d3_1 = th2d3(1, iFrame_);
    th2d3_2 = th2d3(2, iFrame_);
    th2d3_3 = th2d3(3, iFrame_);
    th2d4_1 = th2d4(1, iFrame_);
    th2d4_2 = th2d4(2, iFrame_);
    th2d4_3 = th2d4(3, iFrame_);
    
    a_tor_1 = a_tor(1, iFrame_);
    a_tor_2 = a_tor(2, iFrame_);
    a_tor_3 = a_tor(3, iFrame_);

    th2d = [th2d0(:, iFrame_); th2d1(:, iFrame_); th2d2(:, iFrame_); th2d3(:, iFrame_); th2d4(:, iFrame_)];

    %%
    GRA = find_GRA(g1,g2,g3,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3);
    INT = find_INT(I_01,I_02,I_03,I_11,I_12,I_13,I_21,I_22,I_23,I_31,I_32,I_33,I_41,I_42,I_43,a_tor_1,a_tor_2,a_tor_3,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3,thd0_1,thd0_2,thd0_3,thd1_1,thd1_2,thd1_3,thd2_1,thd2_2,thd2_3,thd3_1,thd3_2,thd3_3,thd4_1,thd4_2,thd4_3);
    Itheta = find_Itheta(I_01,I_02,I_03,I_11,I_12,I_13,I_21,I_22,I_23,I_31,I_32,I_33,I_41,I_42,I_43,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3);

    Tau_ = Itheta * th2d - INT - GRA;

    Tau(:, iFrame) = Tau_;

    fprintf('Number %d done.\n', iFrame)
    


end
toc