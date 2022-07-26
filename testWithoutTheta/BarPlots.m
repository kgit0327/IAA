addpath('../')

load('ExpData.mat')

DataNum = [10, 1, 9];

Datas = struct('tau', [], 'th2d_', [], 'thd_', []);

for iDataNum = 1 : 3
    iData = DataNum(iDataNum);

    Datas(iDataNum).tau = CompTau2(ExperimentDatas, iData);
    Datas(iDataNum).th2d_ = CompTh2d(ExperimentDatas, iData, Datas(iDataNum).tau);
    
    %%
    for iDoF = 1 : 18
        for j = 1 : 20
            for iPeriod = 1 : size(GC2RMFrame(iData).GC2RM, 2)
                [GC, MER, RLP, RM] = GetTiming(ExperimentDatas, GC2RMFrame, iData, iPeriod);
                Datas(iDataNum).thd_(iDoF).tau(j, iPeriod) = simpson(Datas(iDataNum).th2d_(iDoF).tau(j, RLP : RM), 1 / 200);
            end
        end
    end
    
    c = [1, 0.25, 0.1; 1, 1, 0; 0.1, 0.5, 0.1; 0, 0.55, 1; 0.45, 1, 1; 1, 0.45, 0.65; 1, 0.55, 0; 0.7, 0.05, 1; ...
         0.45, 0.1, 0; 1, 0.75, 0.85; 1, 1, 0.6; 0.2, 1, 0.1; 0.7, 1, 1; 1, 0.75, 0.55; 0.55, 1, 0.55; 0.75, 0.7, 1; ...
         0, 0, 0; 0.78, 0.78, 0.79; 0.6, 0.6, 0.2; 0.51, 0.56, 0.61];
    
    for iDoF = 1 : 18      
        thd(iDoF).mean(:, iDataNum) = mean(Datas(iDataNum).thd_(iDoF).tau, 2);
        thd(iDoF).std(:, iDataNum) = std(Datas(iDataNum).thd_(iDoF).tau, [], 2);
    end
end

%%
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