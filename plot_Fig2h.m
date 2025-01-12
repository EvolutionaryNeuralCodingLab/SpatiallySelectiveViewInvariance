
%% load data
load('angles_example.mat')

headangles = angles_example.headangle;
eyeangles = angles_example.eyeangle;
pc1 = angles_example.pc1;
%% plot head vs eye angle scatterplot
f = figure;
scatter(headangles, eyeangles, 100, (pc1/max(pc1)), 'filled', 'MarkerFaceAlpha', 0.7, 'MarkerEdgeColor','none')
hold on
l = lsline;
scatter(headangles(181:200), eyeangles(181:200), 100, "red") %marks deviant trials

[rho, p] = corr(headangles,eyeangles, 'Rows', 'complete');

xlabel('Head angle [°]')
ylabel('Eye angle [°]')
