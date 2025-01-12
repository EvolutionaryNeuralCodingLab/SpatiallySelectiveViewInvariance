
%% load data
load('viewangles_nPC1.mat')
%% plot boxplot+swarmplot
fns = fieldnames(viewangles_nPC1);
plot_fields = 1:4;
xforswarm = ones(length(viewangles_nPC1.recnames), 1);

figure;
hold on
for i=plot_fields
    swarmchart((i-(plot_fields(1)-1))*xforswarm',abs(viewangles_nPC1.(fns{i}))',25,'k', 'filled', 'XJitterWidth',0.4,'MarkerEdgeAlpha',0.3, 'MarkerFaceAlpha',0.3, 'Marker','o')
end

forboxplot = struct2cell(viewangles_nPC1);
forboxplot = cell2mat(forboxplot(plot_fields)');
boxplot(abs(forboxplot))
yline(2, '--')

xticklabels({'Std vs Dev', 'LeftvsRight_std', 'LeftvsRight_dev', 'FirstTimeView'})
ylabel('nPC1')