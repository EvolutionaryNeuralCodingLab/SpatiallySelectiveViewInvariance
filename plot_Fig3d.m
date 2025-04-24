%% figure 3D

load('LFP_headmovements')

% subtract baselines
LFP_std = LFP_headmovements.std - LFP_headmovements.std_baseline;
LFP_dev = LFP_headmovements.dev - LFP_headmovements.dev_baseline;
LFP_mov = LFP_headmovements.mov - LFP_headmovements.mov_baseline;

% plot the standard and deviant relative to movement
figure
boxplot([LFP_std'-LFP_mov',LFP_dev'-LFP_mov'])
hold on
swarmchart(ones(length(LFP_mov),1), LFP_std-LFP_mov, 'blue', 'filled', 'XJitterWidth',0.2, 'MarkerFaceAlpha',0.4)
swarmchart(2*ones(length(LFP_mov),1), LFP_dev-LFP_mov, 'red', 'filled', 'XJitterWidth',0.2, 'MarkerFaceAlpha',0.4)
yline(0,'--')
title(append('Vis response-movement response, N=', string(length(LFP_mov))), 'Interpreter','none')
xticklabels({'Standard', 'Deviant'})

% calculate p-values, same as paired ttest(LFP_dev,LFP_mov)
[~,p_dev] = ttest(LFP_dev-LFP_mov);
[~,p_std] = ttest(LFP_std-LFP_mov);
