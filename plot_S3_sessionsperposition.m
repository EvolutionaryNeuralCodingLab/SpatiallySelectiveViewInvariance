
%% plot number of significant sessions per stimulus position

load("sessionsperposition.mat")

allstims_sig = sessionsperposition.stimulus_position(sessionsperposition.p_novelty<0.05);
allstims = sessionsperposition.stimulus_position;

x = [...
sum(ismember(allstims_sig, 'TopRight'))
sum(ismember(allstims_sig, 'BotLeft'))
sum(ismember(allstims_sig, 'TopLeft'))
sum(ismember(allstims_sig, 'BotRight'))
sum(ismember(allstims_sig, 'MiddleTopRight'))
sum(ismember(allstims_sig, 'TopLeftBotRight'))
sum(ismember(allstims_sig, 'BotLeftBotRight'))
sum(ismember(allstims_sig, 'MiddleBotRight'))];

xx = [...
sum(ismember(allstims, 'TopRight'))
sum(ismember(allstims, 'BotLeft'))
sum(ismember(allstims, 'TopLeft'))
sum(ismember(allstims, 'BotRight'))
sum(ismember(allstims, 'MiddleTopRight'))
sum(ismember(allstims, 'TopLeftBotRight'))
sum(ismember(allstims, 'BotLeftBotRight'))
sum(ismember(allstims, 'MiddleBotRight'))];

figure
bar(xx)
hold on
bar(x)
labelnames = {'TopRight', 'BotLeft', 'TopLeft', 'BotRight', 'MiddleTopRight', 'TopLeftBotRight', 'BotLeftBotRight', 'MiddleBotRight'};
xticklabels(labelnames)
legend({'Non-significant','Significant'})
ylabel('Number of sessions')
title(append('N=', string(length(allstims)), ', sig=', string(length(allstims_sig))))
