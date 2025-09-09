
%% load variables
load('off_response.mat')

% plot data
xsize = size(off_response.diffs, 2);
xforswarm = [ones(1,xsize); 2*ones(1,xsize); 3*ones(1,xsize); 4*ones(1,xsize)];

figure;
hold on
for i=1:4
swarmchart(xforswarm(i,:)',abs(off_response.diffs(i,:))',25, 'filled', 'XJitterWidth',0.4,'MarkerEdgeAlpha',0.3, 'MarkerFaceAlpha',0.3, 'Marker','o')
end
boxplot(abs(off_response.diffs)')

yline(2, '--')
xticklabels(off_response.conditions)
ylabel('nPC1')
title('Off response')

for i=1:4
p(i) = permutationTest(abs(off_response.diffs(1,:)), abs(off_response.diffs(i,:)), 10000);
end
