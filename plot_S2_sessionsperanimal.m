
%% plot the significant sessions per animal

% load data
load('sessionsperanimal.mat')
%% plot data

for i = 1:length(sessionsperanimal.recnames)
    forbar(i) = length(sessionsperanimal.recnames{i});
    forbarsig(i) = sum(sessionsperanimal.p_novelty{i}<0.05);
end

figure
bar(forbar)
hold on
bar(forbarsig)
xticklabels(sessionsperanimal.animal)
ylabel('Number of sessions')
title('Sessions per animal')
legend({'No novelty response', 'Novelty response'})