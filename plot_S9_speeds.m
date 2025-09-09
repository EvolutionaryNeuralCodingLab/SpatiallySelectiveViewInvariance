%% Fig S8 - speeds

%% load data
load('Speeds.mat')

%% headspeed boxplot
meanspeedcm_after_norm = mean(speeds.head.speedincm_poststim(1:180,:));
meanspeedcm_after_nov = mean(speeds.head.speedincm_poststim(181:200,:));
meanspeedcm_diff_novnorm = meanspeedcm_after_nov-meanspeedcm_after_norm;
[~,p] = ttest(meanspeedcm_diff_novnorm); % paired t-test
forx_swarm = [ones(length(meanspeedcm_after_norm),1), 2*ones(length(meanspeedcm_after_norm),1),3*ones(length(meanspeedcm_after_norm),1)];

figure
boxplot([meanspeedcm_diff_novnorm', meanspeedcm_after_nov', meanspeedcm_after_norm'], 'Orientation', 'horizontal')
hold on
swarmchart([meanspeedcm_diff_novnorm', meanspeedcm_after_nov', meanspeedcm_after_norm'], forx_swarm, 'filled', 'XJitter','none', 'YJitter','density', 'YJitterWidth',0.2, 'MarkerFaceAlpha',0.2)

xline(0)
yticklabels({'Diff','Deviant', 'Standard'})
xlabel('Head speed [cm/s]')
xlim([-0.5,7])
title(append('N=', string(length(meanspeedcm_diff_novnorm)), ', p=', string(round(p,3))))

%% headspeed example
angle = speeds.head.example.angle;
pc = speeds.head.example.pc;

figure
scatter(angle, pc, 50, 'blue', 'filled', 'o', 'MarkerFaceAlpha',0.2)
hold on
scatter(angle(length(angle)-19:length(angle)),pc(length(pc)-19:length(pc)), 50, 'red', 'filled', 'o', 'MarkerFaceAlpha', 0.2)

xlabel('Head speed [cm/s]')
ylabel('PC1')
legend({'Standard', 'Deviant'})


%% eyespeed boxplot

meanspeed_after_norm = mean(speeds.eye.eyespeed_poststim(1:180,:));
meanspeed_after_nov = mean(speeds.eye.eyespeed_poststim(181:200,:));
meanspeed_diff_novnorm = meanspeed_after_nov-meanspeed_after_norm;
[~,p] = ttest(meanspeed_diff_novnorm); %paired t-test
forx_swarm = [ones(length(meanspeed_after_norm),1), 2*ones(length(meanspeed_after_norm),1),3*ones(length(meanspeed_after_norm),1)]; % position for swarmchart

figure
boxplot([meanspeed_diff_novnorm', meanspeed_after_nov', meanspeed_after_norm'], 'Orientation', 'horizontal')
hold on
swarmchart([meanspeed_diff_novnorm', meanspeed_after_nov', meanspeed_after_norm'], forx_swarm, 'filled', 'XJitter','none', 'YJitter','density', 'YJitterWidth',0.2, 'MarkerFaceAlpha',0.2)
xline(0)

yticklabels({'Diff','Deviant', 'Standard'})
xlabel('Eyespeed [px/frame]')
xlim([-0.2,1.4])
title(append('N=', string(length(meanspeed_diff_novnorm)), ', p=', string(round(p,3))))


%% eyespeed example

angle = speeds.eye.example.angle;
pc = speeds.eye.example.pc;

f = figure;
scatter(angle, pc, 50, 'blue', 'filled', 'o', 'MarkerFaceAlpha',0.2)
hold on
scatter(angle(length(angle)-19:length(angle)),pc(length(pc)-19:length(pc)), 50, 'red', 'filled', 'o', 'MarkerFaceAlpha', 0.2)

xlabel('Eye speed [px/frame]')
ylabel('PC1')
legend({'Standard', 'Deviant'})
