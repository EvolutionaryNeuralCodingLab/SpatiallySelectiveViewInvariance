
%% load data

load('LFP_control')


%% heatmap
limits = [-500,500];
figure
tiledlayout(1,2, "TileSpacing","compact")
nexttile
imagesc(LFP.oddball([1:9:180,181:200],:), limits)
yline(20.5)
xline(500*20)
xline(2500*20)
ylabel('Trials')
xlabel('Time [ms]')
xticks((500:1000:2500)*20)
xticklabels(string(500:1000:2500))
title('Oddball')
nexttile
imagesc(LFP.control, limits)
yline(20.5)
xline(500*20)
xline(2500*20)
xticks((500:1000:2500)*20)
xticklabels(string(500:1000:2500))
xlabel('Time [ms]')
title('Control')

%% scatterplot
figure
colors = zeros(3,200);
colors(1,181:200) = 2;
colors(3,1:180) = 2;
colors2 = zeros(3,40);
colors2(3,1:20) = 2;
colors2(1,21:40) = 2;

y = ones(1,240);
y(201:end) = 2;
meanNormal_oddball = mean(LFP.pc_oddball(11:180));
meanNormal_random = mean(LFP.pc_control(1:20,1));
x = [LFP.pc_oddball-meanNormal_oddball; LFP.pc_control-meanNormal_random];

swarmchart(x,y', [],[colors, colors2]','filled','MarkerFaceAlpha',0.5 ,YJitter="density")
yticks([1,2])
yticklabels({'Oddball', 'Control'})
xlabel('PC1')
xline(mean(LFP.pc_oddball(181:200))-meanNormal_oddball, '-r', 'Label','OddballMean')
xline(mean(LFP.pc_control (21:40))-meanNormal_random, '-r', 'Label','ControlMean')
legend({'Standard position'})