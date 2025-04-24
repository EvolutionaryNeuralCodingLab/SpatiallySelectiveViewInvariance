
%% LFPs downsampled by factor 20
load("example_LFP_eyemovement")

% select random 20 trials to visualize same sample size for each condition
rndm_std = randperm(180,20); 
rndm_mov = randperm(29,20); 

limits = [0,500]; % limits for heatmap
% heatmap standard
figure;
imagesc(abs(example_LFP.std(rndm_std,:)), limits)
xline(1000,'m')
xticks(0:500:4000)
xticklabels(string(0:0.5:4))
xlabel('Time [s]')
title('240516_turtle29_5_standard', 'Interpreter','none')
% heatmap deviant
figure;
imagesc(abs(example_LFP.dev), limits)
xline(1000,'m')
xticks(0:500:4000)
xticklabels(string(0:0.5:4))
xlabel('Time [s]')
title('240516_turtle29_5_deviant', 'Interpreter','none')
% heatmap head movement
figure;
imagesc(abs(example_LFP.mov(rndm_mov,:)), limits)
xline(1000,'m')
xticks(0:500:4000)
xticklabels(string(0:0.5:4))
xlabel('Time [s]')
title('240516_turtle29_5_eyemovement', 'Interpreter','none')