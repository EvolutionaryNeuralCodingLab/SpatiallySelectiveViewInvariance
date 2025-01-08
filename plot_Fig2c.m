%% load variables
load("example_trace.mat")

% plot LFP
figure
tiledlayout(2,1,"TileSpacing","compact")
nexttile
plot(example_trace.LFP, 'k')
limss = ylim;
limss = limss*1.2; % zoom out a little

% shaded area where stimulus was shown
for i = 1:length(example_trace.stimpos.std)
    patch([example_trace.stimpos.std(i),example_trace.stimpos.std(i)+400, example_trace.stimpos.std(i)+400, example_trace.stimpos.std(i)], [limss(1),limss(1), limss(2), limss(2)], 'blue', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
end
for i = 1:length(example_trace.stimpos.dev)
    patch([example_trace.stimpos.dev(i),example_trace.stimpos.dev(i)+400, example_trace.stimpos.dev(i)+400, example_trace.stimpos.dev(i)], [limss(1),limss(1), limss(2), limss(2)], 'red', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
end

ylim(limss)
xlim([0,length(example_trace.LFP)])
ylabel('Voltage [muV]')
xticks(0:3000:length(example_trace.LFP ))
xticklabels('')

% plot head angles
nexttile
plot(example_trace.headangles)
limss = ylim;
limss = limss*1.2; % zoom out a little

% shaded areas
for i = 1:length(example_trace.stimpos_video.std)
    patch([example_trace.stimpos_video.std(i),example_trace.stimpos_video.std(i)+2*example_trace.framerate, example_trace.stimpos_video.std(i)+2*example_trace.framerate, example_trace.stimpos_video.std(i)], [limss(1),limss(1), limss(2), limss(2)], 'blue', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
end
for i = 1:length(example_trace.stimpos_video.dev)
    patch([example_trace.stimpos_video.dev(i),example_trace.stimpos_video.dev(i)+2*example_trace.framerate, example_trace.stimpos_video.dev(i)+2*example_trace.framerate, example_trace.stimpos_video.dev(i)], [limss(1),limss(1), limss(2), limss(2)], 'red', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
end

ylim(limss)
xlim([0,length(example_trace.headangles)])
xticks(0:example_trace.framerate*15:length(example_trace.headangles))
xticklabels(string(0:15:length(example_trace.headangles)/example_trace.framerate))
ylabel('Headangle [°]')
xlabel('Time [s]')