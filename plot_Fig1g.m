%% load data
load('ephys_for_heatmap')
%% plot heatmap
% data is downsampled by factor 10 for smaller file size
limits = [-500, 500];

figure
imagesc(sorted_data([1:3:180,181:200],:), limits) % takes every 3rd trial of standard + all deviant trials
xline(500*2, '-k') % stim on
xline((3000-500)*2, '-k') % stim off
yline(60.5) % divide standard/deviant trials
c = colorbar;
c.Position(4) = c.Position(4)/4;
c.Position(3) = c.Position(3)/4;
c.Position(2) = c.Position(2)+c.Position(4)*3;
c.Position(1) = c.Position(1)+c.Position(3)*8.5;

xticks(0:1000:length(sorted_data))
xticklabels(0:0.5:length(sorted_data)/2000)
yticklabels(string([30:30:180, 190,200]))
xlabel('Time in s')
ylabel('Trial Number')