iData = 1;
iPeriod = 1;

[GC, MER, RLP, RM] = GetTiming(ExperimentDatas, GC2RMFrame, iData, iPeriod);

RJT = Tau(GC : RM);
Constants = GetConstants(ExperimentDatas, iData);
r_tor = ExperimentDatas(iData).n.ribC;

tDeps = GetTDepend(ExperimentDatas, iData);

th0 = tDeps.th0(:, GC);
th1 = tDeps.th1(:, GC);
th2 = tDeps.th2(:, GC);
th3 = tDeps.th3(:, GC);
th4 = tDeps.th4(:, GC);

thd0 = tDeps.thd0(:, GC);
thd1 = tDeps.thd1(:, GC);
thd2 = tDeps.thd2(:, GC);
thd3 = tDeps.thd3(:, GC);
thd4 = tDeps.thd4(:, GC);

INIT = [th0.', thd0.', th1.', thd1.', th2.', thd2.', th3.', thd3.', th4.', thd4.'];




[t, q] = ode45(@(t, q) OdeFunc(t, q, RJT, r_tor, Constants), [GC RM], INIT);