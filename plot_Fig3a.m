%%
load('example_trace_movement')
ylims = [-500,700];
time_window = 4000;
stim_dur = 2000;
time_before_stim = 1000;
framerate_video = 15;
video_win = framerate_video*time_window/1000;
px_per_mm = 2.375; % extracted from video
% smooth LFPs for better visibility, sample rate = 1000Hz
D = smooth(example_trace.LFP, 5); 
% plot whole session to then extract single episodes for examples -- do not close this window
figure; subplot(2,1,1); plot(D); xline(example_trace.headspeed_times(example_trace.movOnset))
% add shaded areas where stimulus appeared
for i = 1:length(example_trace.std_On)
    patch([example_trace.std_On(i),(example_trace.std_On(i)+stim_dur), (example_trace.std_On(i)+stim_dur), (example_trace.std_On(i))], [ylims(1),ylims(1), ylims(2), ylims(2)], 'blue', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
end
for i = 1:length(example_trace.dev_On)
    patch([example_trace.dev_On(i),(example_trace.dev_On(i)+stim_dur), (example_trace.dev_On(i)+stim_dur), (example_trace.dev_On(i))], [ylims(1),ylims(1), ylims(2), ylims(2)], 'red', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
end

ylim(ylims)
ylabel('Amplitude [\muV]')

%% standard
pickStd = 24; % pick standard stimulus to plot

stdOn = round(example_trace.std_On(pickStd)-time_before_stim);
headangle_stdOn = find(example_trace.headspeed_times>=stdOn, 1);
subplot(2,1,1)
xlim([stdOn,stdOn+time_window])
xticks(stdOn:1000:stdOn+time_window)
xticklabels([])
title('230912_turtle24_3_standard', 'Interpreter','none')
% add head movement
subplot(2,1,2)
plot(example_trace.headspeed(headangle_stdOn:headangle_stdOn+video_win)*framerate_video/px_per_mm); ylim([0,8])
xlim([0,60])
ylim([0,50])
xticks(0:15:60)
xticklabels(string(0:4))
xlabel('Time [s]')
ylabel('Headspeed [mm/s]')

%% deviant
pickDev = 6; % pick deviant stimulus to plot

devOn = round(example_trace.dev_On(pickDev)-time_before_stim);
headangle_devOn = find(example_trace.headspeed_times>=devOn, 1);
subplot(2,1,1)
xlim([devOn,devOn+time_window])
xticks(devOn:1000:devOn+time_window)
xticklabels([])
title('230912_turtle24_3_deviant', 'Interpreter','none')
% add head movement
subplot(2,1,2)
plot(example_trace.headspeed(headangle_devOn:headangle_devOn+video_win)*framerate_video/px_per_mm); ylim([0,8])
xlim([0,60])
ylim([0,50])
xticks(0:15:60)
xticklabels(string(0:4))
xlabel('Time [s]')
ylabel('Headspeed [mm/s]')
%% movement, time_before_stim = 1880 to not confuse by showing the stimulus after, end of movement estimated manually for higher precision
pickMov = 38; % pick movement stimulus to plot

movOn = round(example_trace.headspeed_times(example_trace.movOnset(pickMov))-1880);
headangle_movOn = find(example_trace.headspeed_times>=movOn, 1);
subplot(2,1,1)
xlim([movOn,movOn+time_window])
xticks(movOn:1000:movOn+time_window)
xticklabels([])
patch([example_trace.headspeed_times(example_trace.movOnset(pickMov)),example_trace.headspeed_times(19490), example_trace.headspeed_times(19490), example_trace.headspeed_times(example_trace.movOnset(pickMov))], [ylims(1),ylims(1), ylims(2), ylims(2)], 'green', 'FaceAlpha', 0.1, 'EdgeColor', 'none')
title('230912_turtle24_3_movement', 'Interpreter','none')
% add head movement
subplot(2,1,2)
plot(example_trace.headspeed(headangle_movOn:headangle_movOn+video_win)*framerate_video/px_per_mm); ylim([0,8])
xlim([0,60])
ylim([0,50])
xticks(0:15:60)
xticklabels(string(0:4))
xlabel('Time [s]')
ylabel('Headspeed [mm/s]')