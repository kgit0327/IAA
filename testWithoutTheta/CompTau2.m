function Tau = CompTau2(iData)
tic
addpath('../')

load('NPMEAN.mat');

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

a_tor = tDeps.a_tor;

L0l = tDeps.L0l;
L0 = tDeps.L0;
L0d = tDeps.L0d;
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

om0l = tDeps.om0l;
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

Tau = nan(18, NUM_FRAME);

fprintf('Initialized\n')
toc

tic
for iFrame = 1 : NUM_FRAME
    iFrame_ = iFrame;
    
    L0l1 = L0l(1, iFrame_);
    L0l2 = L0l(2, iFrame_);
    L0l3 = L0l(3, iFrame_);

    L01 = L0(1, iFrame_);
    L02 = L0(2, iFrame_);
    L03 = L0(3, iFrame_);
    
    L0d1 = L0d(1, iFrame_);
    L0d2 = L0d(2, iFrame_);
    L0d3 = L0d(3, iFrame_);
    
    L11 = L1(1, iFrame_);
    L12 = L1(2, iFrame_);
    L13 = L1(3, iFrame_);
    
    L21 = L2(1, iFrame_);
    L22 = L2(2, iFrame_);
    L23 = L2(3, iFrame_);
    
    L31 = L3(1, iFrame_);
    L32 = L3(2, iFrame_);
    L33 = L3(3, iFrame_);

    Lg01 = Lg0(1, iFrame_);
    Lg02 = Lg0(2, iFrame_);
    Lg03 = Lg0(3, iFrame_);
    
    Lg11 = Lg1(1, iFrame_);
    Lg12 = Lg1(2, iFrame_);
    Lg13 = Lg1(3, iFrame_);
    
    Lg21 = Lg2(1, iFrame_);
    Lg22 = Lg2(2, iFrame_);
    Lg23 = Lg2(3, iFrame_);
    
    Lg31 = Lg3(1, iFrame_);
    Lg32 = Lg3(2, iFrame_);
    Lg33 = Lg3(3, iFrame_);
    
    Lg41 = Lg4(1, iFrame_);
    Lg42 = Lg4(2, iFrame_);
    Lg43 = Lg4(3, iFrame_);

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

    om0l_1 = om0l(1, iFrame_);
    om0l_2 = om0l(2, iFrame_);
    om0l_3 = om0l(3, iFrame_);

    om0u_1 = om0u(1, iFrame_);
    om0u_2 = om0u(2, iFrame_);
    om0u_3 = om0u(3, iFrame_);
    
    om1_1 = om1(1, iFrame_);
    om1_2 = om1(2, iFrame_);
    om1_3 = om1(3, iFrame_);
    
    om2_1 = om2(1, iFrame_);
    om2_2 = om2(2, iFrame_);
    om2_3 = om2(3, iFrame_);
    
    om3_1 = om3(1, iFrame_);
    om3_2 = om3(2, iFrame_);
    om3_3 = om3(3, iFrame_);
    
    om4_1 = om4(1, iFrame_);
    om4_2 = om4(2, iFrame_);
    om4_3 = om4(3, iFrame_);

    omd0l_1 = omd0l(1, iFrame_);
    omd0l_2 = omd0l(2, iFrame_);
    omd0l_3 = omd0l(3, iFrame_);

    Om0_1 = Om0(1, iFrame_);
    Om0_2 = Om0(2, iFrame_);
    Om0_3 = Om0(3, iFrame_);
    
    Om1_1 = Om1(1, iFrame_);
    Om1_2 = Om1(2, iFrame_);
    Om1_3 = Om1(3, iFrame_);
    
    Om2_1 = Om2(1, iFrame_);
    Om2_2 = Om2(2, iFrame_);
    Om2_3 = Om2(3, iFrame_);
    
    Om3_1 = Om3(1, iFrame_);
    Om3_2 = Om3(2, iFrame_);
    Om3_3 = Om3(3, iFrame_);
    
    Om4_1 = Om4(1, iFrame_);
    Om4_2 = Om4(2, iFrame_);
    Om4_3 = Om4(3, iFrame_);

    I_gcs01_1 = I_gcs0(1, 1, iFrame_);
    I_gcs01_2 = I_gcs0(1, 2, iFrame_);
    I_gcs01_3 = I_gcs0(1, 3, iFrame_);
    I_gcs02_1 = I_gcs0(2, 1, iFrame_);
    I_gcs02_2 = I_gcs0(2, 2, iFrame_);
    I_gcs02_3 = I_gcs0(2, 3, iFrame_);
    I_gcs03_1 = I_gcs0(3, 1, iFrame_);
    I_gcs03_2 = I_gcs0(3, 2, iFrame_);
    I_gcs03_3 = I_gcs0(3, 3, iFrame_);

    I_gcs11_1 = I_gcs1(1, 1, iFrame_);
    I_gcs11_2 = I_gcs1(1, 2, iFrame_);
    I_gcs11_3 = I_gcs1(1, 3, iFrame_);
    I_gcs12_1 = I_gcs1(2, 1, iFrame_);
    I_gcs12_2 = I_gcs1(2, 2, iFrame_);
    I_gcs12_3 = I_gcs1(2, 3, iFrame_);
    I_gcs13_1 = I_gcs1(3, 1, iFrame_);
    I_gcs13_2 = I_gcs1(3, 2, iFrame_);
    I_gcs13_3 = I_gcs1(3, 3, iFrame_);

    I_gcs21_1 = I_gcs2(1, 1, iFrame_);
    I_gcs21_2 = I_gcs2(1, 2, iFrame_);
    I_gcs21_3 = I_gcs2(1, 3, iFrame_);
    I_gcs22_1 = I_gcs2(2, 1, iFrame_);
    I_gcs22_2 = I_gcs2(2, 2, iFrame_);
    I_gcs22_3 = I_gcs2(2, 3, iFrame_);
    I_gcs23_1 = I_gcs2(3, 1, iFrame_);
    I_gcs23_2 = I_gcs2(3, 2, iFrame_);
    I_gcs23_3 = I_gcs2(3, 3, iFrame_);

    I_gcs31_1 = I_gcs3(1, 1, iFrame_);
    I_gcs31_2 = I_gcs3(1, 2, iFrame_);
    I_gcs31_3 = I_gcs3(1, 3, iFrame_);
    I_gcs32_1 = I_gcs3(2, 1, iFrame_);
    I_gcs32_2 = I_gcs3(2, 2, iFrame_);
    I_gcs32_3 = I_gcs3(2, 3, iFrame_);
    I_gcs33_1 = I_gcs3(3, 1, iFrame_);
    I_gcs33_2 = I_gcs3(3, 2, iFrame_);
    I_gcs33_3 = I_gcs3(3, 3, iFrame_);

    I_gcs41_1 = I_gcs4(1, 1, iFrame_);
    I_gcs41_2 = I_gcs4(1, 2, iFrame_);
    I_gcs41_3 = I_gcs4(1, 3, iFrame_);
    I_gcs42_1 = I_gcs4(2, 1, iFrame_);
    I_gcs42_2 = I_gcs4(2, 2, iFrame_);
    I_gcs42_3 = I_gcs4(2, 3, iFrame_);
    I_gcs43_1 = I_gcs4(3, 1, iFrame_);
    I_gcs43_2 = I_gcs4(3, 2, iFrame_);
    I_gcs43_3 = I_gcs4(3, 3, iFrame_);

    Rj01_1 = Rj0(1, 1, iFrame_);
    Rj01_2 = Rj0(1, 2, iFrame_);
    Rj01_3 = Rj0(1, 3, iFrame_);
    Rj02_1 = Rj0(2, 1, iFrame_);
    Rj02_2 = Rj0(2, 2, iFrame_);
    Rj02_3 = Rj0(2, 3, iFrame_);
    Rj03_1 = Rj0(3, 1, iFrame_);
    Rj03_2 = Rj0(3, 2, iFrame_);
    Rj03_3 = Rj0(3, 3, iFrame_);

    Rj11_1 = Rj1(1, 1, iFrame_);
    Rj11_2 = Rj1(1, 2, iFrame_);
    Rj11_3 = Rj1(1, 3, iFrame_);
    Rj12_1 = Rj1(2, 1, iFrame_);
    Rj12_2 = Rj1(2, 2, iFrame_);
    Rj12_3 = Rj1(2, 3, iFrame_);
    Rj13_1 = Rj1(3, 1, iFrame_);
    Rj13_2 = Rj1(3, 2, iFrame_);
    Rj13_3 = Rj1(3, 3, iFrame_);

    Rj21_1 = Rj2(1, 1, iFrame_);
    Rj21_2 = Rj2(1, 2, iFrame_);
    Rj21_3 = Rj2(1, 3, iFrame_);
    Rj22_1 = Rj2(2, 1, iFrame_);
    Rj22_2 = Rj2(2, 2, iFrame_);
    Rj22_3 = Rj2(2, 3, iFrame_);
    Rj23_1 = Rj2(3, 1, iFrame_);
    Rj23_2 = Rj2(3, 2, iFrame_);
    Rj23_3 = Rj2(3, 3, iFrame_);

    Rj31_1 = Rj3(1, 1, iFrame_);
    Rj31_2 = Rj3(1, 2, iFrame_);
    Rj31_3 = Rj3(1, 3, iFrame_);
    Rj32_1 = Rj3(2, 1, iFrame_);
    Rj32_2 = Rj3(2, 2, iFrame_);
    Rj32_3 = Rj3(2, 3, iFrame_);
    Rj33_1 = Rj3(3, 1, iFrame_);
    Rj33_2 = Rj3(3, 2, iFrame_);
    Rj33_3 = Rj3(3, 3, iFrame_);

    Rj41_1 = Rj4(1, 1, iFrame_);
    Rj41_2 = Rj4(1, 2, iFrame_);
    Rj41_3 = Rj4(1, 3, iFrame_);
    Rj42_1 = Rj4(2, 1, iFrame_);
    Rj42_2 = Rj4(2, 2, iFrame_);
    Rj42_3 = Rj4(2, 3, iFrame_);
    Rj43_1 = Rj4(3, 1, iFrame_);
    Rj43_2 = Rj4(3, 2, iFrame_);
    Rj43_3 = Rj4(3, 3, iFrame_);
    

    %%
    GRA = find_GRA2(L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,g1,g2,g3,m1,m2,m3,m4,m0u);
    INT = find_INT2(I_gcs01_1,I_gcs01_2,I_gcs01_3,I_gcs02_1,I_gcs02_2,I_gcs02_3,I_gcs03_1,I_gcs03_2,I_gcs03_3,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,L0l1,L0l2,L0l3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,Om0_1,Om0_2,Om0_3,Om1_1,Om1_2,Om1_3,Om2_1,Om2_2,Om2_3,Om3_1,Om3_2,Om3_3,Om4_1,Om4_2,Om4_3,Rj01_1,Rj01_2,Rj01_3,Rj02_1,Rj02_2,Rj02_3,Rj03_1,Rj03_2,Rj03_3,Rj11_1,Rj11_2,Rj11_3,Rj12_1,Rj12_2,Rj12_3,Rj13_1,Rj13_2,Rj13_3,Rj21_1,Rj21_2,Rj21_3,Rj22_1,Rj22_2,Rj22_3,Rj23_1,Rj23_2,Rj23_3,Rj31_1,Rj31_2,Rj31_3,Rj32_1,Rj32_2,Rj32_3,Rj33_1,Rj33_2,Rj33_3,Rj41_1,Rj41_2,Rj41_3,Rj42_1,Rj42_2,Rj42_3,Rj43_1,Rj43_2,Rj43_3,m1,m2,m3,m4,m0u,om1_1,om1_2,om1_3,om2_1,om2_2,om2_3,om3_1,om3_2,om3_3,om4_1,om4_2,om4_3,om0l_1,om0l_2,om0l_3,om0u_1,om0u_2,om0u_3,omd0l_1,omd0l_2,omd0l_3,thd0_1,thd0_2,thd0_3,thd1_1,thd1_2,thd1_3,thd2_1,thd2_2,thd2_3,thd3_1,thd3_2,thd3_3,thd4_1,thd4_2,thd4_3);
    Itheta = find_Itheta2(I_gcs01_1,I_gcs01_2,I_gcs01_3,I_gcs02_1,I_gcs02_2,I_gcs02_3,I_gcs03_1,I_gcs03_2,I_gcs03_3,I_gcs11_1,I_gcs11_2,I_gcs11_3,I_gcs12_1,I_gcs12_2,I_gcs12_3,I_gcs13_1,I_gcs13_2,I_gcs13_3,I_gcs21_1,I_gcs21_2,I_gcs21_3,I_gcs22_1,I_gcs22_2,I_gcs22_3,I_gcs23_1,I_gcs23_2,I_gcs23_3,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,Rj01_1,Rj01_2,Rj01_3,Rj02_1,Rj02_2,Rj02_3,Rj03_1,Rj03_2,Rj03_3,Rj11_1,Rj11_2,Rj11_3,Rj12_1,Rj12_2,Rj12_3,Rj13_1,Rj13_2,Rj13_3,Rj21_1,Rj21_2,Rj21_3,Rj22_1,Rj22_2,Rj22_3,Rj23_1,Rj23_2,Rj23_3,Rj31_1,Rj31_2,Rj31_3,Rj32_1,Rj32_2,Rj32_3,Rj33_1,Rj33_2,Rj33_3,Rj41_1,Rj41_2,Rj41_3,Rj42_1,Rj42_2,Rj42_3,Rj43_1,Rj43_2,Rj43_3,m1,m2,m3,m4,m0u);

    th2d = [a_tor(:, iFrame_); th2d0(:, iFrame_); th2d1(:, iFrame_); th2d2(:, iFrame_); th2d3(:, iFrame_); th2d4(:, iFrame_)];

    Tau_ = Itheta * th2d - INT - GRA;

    Tau(:, iFrame) = Tau_;

    fprintf('Number %d done.\n', iFrame)
    


end
toc
end