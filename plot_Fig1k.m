

%% load data
load('nPC1_data')

%% boxplot+swarmplot

xforswarm = [ones(1,length(nPC1_data)); 2*ones(1,length(nPC1_data)); 3*ones(1,length(nPC1_data)); 4*ones(1,length(nPC1_data))];

figure;
hold on
for i=1:4
    swarmchart(xforswarm(i,:)',abs(nPC1_data(i,:))',25, 'filled', 'XJitterWidth',0.4,'MarkerEdgeAlpha',0.3, 'MarkerFaceAlpha',0.3, 'Marker','o')
end
boxplot(abs(nPC1_data)', 'Symbol','')
yline(2, '--') % significance cutoff - sessions above 2 had significantly different responses to the corresponding condition

xticklabels({'Standard', 'Deviant', 'First10', '1After'})
ylabel('nPC1')

% for i=1:4
%     p_summary_normal(i) = permutationTest(abs(nPC1_data(1,:)), abs(nPC1_data(i,:)), 10000); % p-values for significance between groups
% end