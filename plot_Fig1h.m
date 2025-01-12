
%% load data
load('spikes')

%% choose unit to plot, sig_units mark units that had a significant response to visual onset (zeta-test)

unit_to_plot = 84; % unit 84 as example in the paper

spiketime_plot = spikes.spiketime(spikes.cluster == unit_to_plot); 
onStim_sorted = spikes.onStim_sorted; % already sorted with deviants in the end
time_before_stim = 500; % time before stim onset to plot in ms
time_window = 3000;
%% plot the rasterplot

for i=1:length(onStim_sorted) % goes through the single trials of the stimulation
    start_time = onStim_sorted(i)-time_before_stim; %start time for the rasterplot and histogram
    rast_tim = spiketime_plot((start_time < spiketime_plot) &  (spiketime_plot < start_time+time_window)); %finds all the spikes within the time window of each trial
    for_raster{i} = rast_tim'-start_time; %sets each trial start time to 0
end


for_raster_reduced = for_raster([1:2:180,181:200]); % taking every second standard trial, all deviant trials

figure
plotSpikeRaster(for_raster_reduced', 'PlotType', 'vertline');
yline(90.5,'--m') %divides standard and deviant
ylabel('Trial Number')
yticks([0:20:80,90,100,110])
yticklabels(string([0:40:160,180,190,200]))
xlabel('Time [ms]')
xline(500)
xline(2500)
