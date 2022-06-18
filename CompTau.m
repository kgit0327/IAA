iData = 10;

Constants = GetConstants(ExperimentDatas);

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

TorCS = ExperimentDatas(iData).SCS(14).Var;
UaCS = ExperimentDatas(iData).SCS(3).Var;
FaCS = ExperimentDatas(iData).SCS(2).Var;
HdCS = ExperimentDatas(iData).SCS(1).Var;
RaCS = Racketsegdat.Var;



om0 = ExperimentDatas(iData).segdat(14).seganV_GCS;
om1 = ExperimentDatas(iData).segdat(3).seganV_GCS;
om2 = ExperimentDatas(iData).segdat(2).seganV_GCS;
om3 = ExperimentDatas(iData).segdat(1).seganV_GCS;
om4 = Racketsegdat.seganV_GCS;

thd0 = om0;
thd1 = om1 - om0;
thd2 = om2 - om1;
thd3 = om3 - om2;
thd4 = om4 - om3;


NUM_FRAME = size(TorCS, 2);

th0 = nan(3, NUM_FRAME);
th1 = nan(3, NUM_FRAME);
th2 = nan(3, NUM_FRAME);
th3 = nan(3, NUM_FRAME);
th4 = nan(3, NUM_FRAME);

for iFrame = 1 : NUM_FRAME
    th0(2, iFrame) = asin(TorCS(iFrame).R(3, 1));
    th0(1, iFrame) = -asin(TorCS(iFrame).R(3, 2) / cos(th0(2, iFrame)));
    th0(3, iFrame) = -asin(TorCS(iFrame).R(2, 1) / cos(th0(2, iFrame)));

    th1(2, iFrame) = asin(TorCS(iFrame).R(3, 1));
    th1(1, iFrame) = -asin(TorCS(iFrame).R(3, 2) / cos(th1(2, iFrame)));
    th1(3, iFrame) = -asin(TorCS(iFrame).R(2, 1) / cos(th1(2, iFrame)));

    th2(2, iFrame) = asin(TorCS(iFrame).R(3, 1));
    th2(1, iFrame) = -asin(TorCS(iFrame).R(3, 2) / cos(th2(2, iFrame)));
    th2(3, iFrame) = -asin(TorCS(iFrame).R(2, 1) / cos(th2(2, iFrame)));

    th3(2, iFrame) = asin(TorCS(iFrame).R(3, 1));
    th3(1, iFrame) = -asin(TorCS(iFrame).R(3, 2) / cos(th3(2, iFrame)));
    th3(3, iFrame) = -asin(TorCS(iFrame).R(2, 1) / cos(th3(2, iFrame)));

    th4(2, iFrame) = asin(TorCS(iFrame).R(3, 1));
    th4(1, iFrame) = -asin(TorCS(iFrame).R(3, 2) / cos(th4(2, iFrame)));
    th4(3, iFrame) = -asin(TorCS(iFrame).R(2, 1) / cos(th4(2, iFrame)));

    th0_1 = th0(1, iFrame);
    th0_2 = th0(2, iFrame);
    th0_3 = th0(3, iFrame);
    th1_1 = th1(1, iFrame);
    th1_2 = th1(2, iFrame);
    th1_3 = th1(3, iFrame);
    th2_1 = th2(1, iFrame);
    th2_2 = th2(2, iFrame);
    th2_3 = th2(3, iFrame);
    th3_1 = th3(1, iFrame);
    th3_2 = th3(2, iFrame);
    th3_3 = th3(3, iFrame);
    th4_1 = th4(1, iFrame);
    th4_2 = th4(2, iFrame);
    th4_3 = th4(3, iFrame);




    GRA = find_GRA(l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3);
    INT = find_INT(I_01,I_02,I_03,I_11,I_12,I_13,I_21,I_22,I_23,I_31,I_32,I_33,I_41,I_42,I_43,a_tor_1,a_tor_2,a_tor_3,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3,thd0_1,thd0_2,thd0_3,thd1_1,thd1_2,thd1_3,thd2_1,thd2_2,thd2_3,thd3_1,thd3_2,thd3_3,thd4_1,thd4_2,thd4_3);
    Ihteta = find_Itheta(I_01,I_02,I_03,I_11,I_12,I_13,I_21,I_22,I_23,I_31,I_32,I_33,I_41,I_42,I_43,l0,l1,l2,l3,l4,m0,m1,m2,m3,m4,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3);
    
    Tau = Itheta * th2d - INT - GRA;

end