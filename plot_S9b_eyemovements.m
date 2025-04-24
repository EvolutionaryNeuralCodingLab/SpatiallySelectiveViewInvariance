
%%
load("LFP_example_eyemovement.mat")

%% boxplot
figure;
boxplot([LFP.mov-LFP.mov_baseline, [LFP.std-LFP.std_baseline;NaN(20,1)],[LFP.dev-LFP.dev_baseline;NaN(180,1)]])
hold on
swarmchart([ones(200,1); 2*ones(200,1); 3*ones(200,1)], [LFP.mov-LFP.mov_baseline; [LFP.std-LFP.std_baseline;NaN(20,1)];[LFP.dev-LFP.dev_baseline;NaN(180,1)]], 25,'filled', 'XJitterWidth',0.4, 'MarkerFaceAlpha',0.4)
xticklabels({'Movement', 'Standard', 'Deviant'})
title('240516_turtle29_5', 'Interpreter','none')
% calculate p-values
p_std = permutationTest(LFP.mov(~isnan(LFP.mov))-LFP.mov_baseline(~isnan(LFP.mov)), LFP.std-LFP.std_baseline, 10000);
p_dev = permutationTest(LFP.mov(~isnan(LFP.mov))-LFP.mov_baseline(~isnan(LFP.mov)), LFP.dev-LFP.dev_baseline, 10000);
