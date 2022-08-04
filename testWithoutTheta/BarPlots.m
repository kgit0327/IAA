clear
clc
close

load IAA_data.mat

addpath('../')

IAADatas = struct('tau', [], 'th2d_', [], 'thd_', []);

for iDataNum = 1 : 3

    IAADatas(iDataNum).tau = CompTau2(ExpDat, iDataNum);
    IAADatas(iDataNum).th2d_ = CompTh2d(ExpDat, iDataNum, IAADatas(iDataNum).tau);
    for iDoF = 1 : 18
        for j = 1 : 20
            for iPeriod = 1 : size(GC2RMdat(iDataNum).GC2RM, 2)
                [GC, RLP, MER, RM] = GetTiming(ExpDat, GC2RMdat, iDataNum, iPeriod);
                IAADatas(iDataNum).thd_(iDoF).GC2RLP(j, iPeriod) = simpson(IAADatas(iDataNum).th2d_(iDoF).tau(j, GC : RLP), 1 / 200);
                IAADatas(iDataNum).thd_(iDoF).RLP2MER(j, iPeriod) = simpson(IAADatas(iDataNum).th2d_(iDoF).tau(j, RLP : MER), 1 / 200);
                IAADatas(iDataNum).thd_(iDoF).MER2RM(j, iPeriod) = simpson(IAADatas(iDataNum).th2d_(iDoF).tau(j, MER : RM), 1 / 200);
            end
        end
    end
end

%%
% load IAA_data.mat
for iDataNum = 1 : 3
    for iDoF = 1 : 18      
        thd(iDoF).mean(:, iDataNum) = mean(IAADatas(iDataNum).thd_(iDoF).MER2RM, 2);
        thd(iDoF).std(:, iDataNum) = std(IAADatas(iDataNum).thd_(iDoF).MER2RM, [], 2);
    end
end

LABEL = categorical({'FB', 'LR', 'UD', 'tEF', 'tLu', 'tLr', 'sAb', 'sEF', 'sIr', 'eFE', 'eAb', 'eEr', 'wPf', 'wAb', 'wIr', 'rAb', 'rEF', 'rIr', 'IN', 'GR'});
LABEL = reordercats(LABEL, {'FB', 'LR', 'UD', 'tEF', 'tLu', 'tLr', 'sAb', 'sEF', 'sIr', 'eFE', 'eAb', 'eEr', 'wPf', 'wAb', 'wIr', 'rAb', 'rEF', 'rIr', 'IN', 'GR'});

t = tiledlayout(6, 3, 'TileSpacing', 'compact');

for iDoF = 1 : 18
    nexttile
    hold on
    bar(LABEL, thd(iDoF).mean, 'FaceColor', 'flat');
%                 for ith2d = 1 : 20
%                     b.CData(ith2d, :) = c(ith2d, :);
%                 end
    
    y = thd(iDoF).mean;
    err = thd(iDoF).std;
    
    ngroups = size(y, 1);
    nbars = size(y, 2);
    % Calculating the width for each bar group
    groupwidth = min(0.8, nbars/(nbars + 1.5));
    for i = 1:nbars
        x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
        errorbar(x, y(:,i), err(:,i), '.');
    end
%             legend('0 bpm', '35 bpm', '50 bpm')
%             set(gca, 'FontSize', 28)
    title(LABEL(1, iDoF))
    hold off
end

dockfig('all')