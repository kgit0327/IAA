clear
close all
clc

load IAA_data.mat

addpath('../')
set(0, 'DefaultLineLineWidth', 3)

for iDataNum = 1 : 3
    for iDoF = 1 : 18      
        thd(iDoF).mean(:, iDataNum) = mean(IAADatas(iDataNum).thd_(iDoF).MER2RM, 2);
        thd(iDoF).std(:, iDataNum) = std(IAADatas(iDataNum).thd_(iDoF).MER2RM, [], 2);
    end
end

for iDoF = 1 : 18
    SUM = sum(abs(thd(iDoF).mean), 2);
    [~, v(:, iDoF)] = maxk(SUM, 5);
end

LABEL = categorical({'FB', 'LR', 'UD', 'tEF', 'tLu', 'tLr', 'sAb', 'sEF', 'sIr', 'eFE', 'eAb', 'eEr', 'wPf', 'wAb', 'wIr', 'rAb', 'rEF', 'rIr', 'IN', 'GR'});
LABEL = reordercats(LABEL, {'FB', 'LR', 'UD', 'tEF', 'tLu', 'tLr', 'sAb', 'sEF', 'sIr', 'eFE', 'eAb', 'eEr', 'wPf', 'wAb', 'wIr', 'rAb', 'rEF', 'rIr', 'IN', 'GR'});
c = [1, 0.25, 0.1; 1, 1, 0; 0.1, 0.5, 0.1; 0, 0.55, 1; 0.45, 1, 1; 1, 0.45, 0.65; 1, 0.55, 0; 0.7, 0.05, 1; ...
     0.45, 0.1, 0; 1, 0.75, 0.85; 1, 1, 0.6; 0.2, 1, 0.1; 0.7, 1, 1; 1, 0.75, 0.55; 0.55, 1, 0.55; 0.75, 0.7, 1; ...
     0, 0, 0; 0.78, 0.78, 0.79; 0.6, 0.6, 0.2; 0.51, 0.56, 0.61];

PlotTogether(1, v(:, 1), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(2, v(:, 2), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(3, v(:, 3), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(4, v(:, 4), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(5, v(:, 5), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(6, v(:, 6), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(7, v(:, 7), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(8, v(:, 8), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(9, v(:, 9), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(10, v(:, 10), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(11, v(:, 11), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(12, v(:, 12), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(13, v(:, 13), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(14, v(:, 14), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(15, v(:, 15), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(16, v(:, 16), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(17, v(:, 17), LABEL, c, IAADatas, ExpDat, GC2RMdat)
PlotTogether(18, v(:, 18), LABEL, c, IAADatas, ExpDat, GC2RMdat)

dockfig('all')
function PlotTogether(a, v, LABEL, c, IAADatas, ExpDat, GC2RMdat)

    [GC0, ~, MER0, RM0] = GetTiming(ExpDat, GC2RMdat, 1, 2);
    [GC35, ~, MER35, RM35] = GetTiming(ExpDat, GC2RMdat, 2, 2);
    [GC50, ~, MER50, RM50] = GetTiming(ExpDat, GC2RMdat, 3, 2);

    figure
    hold on
    for i = v'
        plot((GC0 - RM0) / 200 : 1 / 200 : 0, IAADatas(1).th2d_(a).tau(i, GC0 : RM0), 'Color', c(i, :), 'DisplayName', append('0 bpm  ', string(LABEL(i))))  
        plot((GC35 - RM35) / 200 : 1 / 200 : 0, IAADatas(2).th2d_(a).tau(i, GC35 : RM35), 'Color', c(i, :), 'LineStyle', '--', 'DisplayName', append('35 bpm ', string(LABEL(i))))
        plot((GC50 - RM50) / 200 : 1 / 200 : 0, IAADatas(3).th2d_(a).tau(i, GC50 : RM50), 'Color', c(i, :), 'LineStyle', ':', 'DisplayName', append('50 bpm ', string(LABEL(i))))
    end

    legend(Location="northoutside", Orientation="vertical", NumColumns=5)
    title(string(LABEL(a)))
    hold off
end