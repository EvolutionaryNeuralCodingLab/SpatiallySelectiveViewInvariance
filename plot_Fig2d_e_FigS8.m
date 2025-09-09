
%% load data
load("headangles_example.mat")

%% change this between view angle (Fig. S7) and head angle (Fig 2. d+e)
pc1 = example_Fig2.pc1;
% headangles = example_Fig2.headangles;
headangles = example_Fig2.viewangles;


%% to calculate firstangleviewing
d = pdist(headangles(1:180));
Dista = squareform(d);
Dista = tril(Dista);
Dista(Dista==0) = NaN;
ind = Dista<5; %finds first trials with no less than 5 degree distance
n = find(isnan(Dista(:,1)));
nn = find(sum(ind,2)==0);
firsttrialangles = nn(~ismember(nn, n));

%% make scatterplot head angles vs pca1
f = figure;
scatter(headangles(1:180),pc1(1:180), 50, 'blue', 'filled', 'o', 'MarkerFaceAlpha',0.4)
hold on
scatter(headangles(181:200),pc1(181:200), 50, 'red', 'filled', 'o', 'MarkerFaceAlpha', 0.4)
scatter(headangles(firsttrialangles),pc1(firsttrialangles), 50, 'green', 'filled', 'o', 'MarkerFaceAlpha',0.4)
yline(mean(pc1(firsttrialangles,1), 'omitmissing'), 'g--')
yline(mean(pc1(1:180,1), 'omitmissing'), 'b--')
yline(mean(pc1(181:end,1), 'omitmissing'), 'r--')

xlim(centerxaxis(xlim))
xlabel('Head angle from left to right [°]')
ylabel('PC1')
legend({'Standard', 'Deviant', 'Firstview'})

%% boxplot
% defines cutoff beween left and right angles
firstangleforbox = pc1(firsttrialangles(firsttrialangles<181)); % only first views that are not deviants
cutoff_left = mean(headangles(1:180))-15;
cutoff_right = mean(headangles(1:180))+15;
cutoff_left_nov = mean(headangles(181:200))-15;
cutoff_right_nov = mean(headangles(181:200))+15;
left = pc1(headangles(1:180) < cutoff_left);
right = pc1(headangles(1:180) > cutoff_right);
novcutindleft = headangles < cutoff_left_nov;
novcutindleft(1:180) = 0;
novcutindright = headangles > cutoff_right_nov;
novcutindright(1:180) = 0;
nov_left = pc1(novcutindleft);
nov_right = pc1(novcutindright);

% puts NaNs to make vectors the same length for the boxplot
sizeforbox = length(left);
left(end+1:sizeforbox,1) = NaN;
right(end+1:sizeforbox,1) = NaN;
nov_left(end+1:sizeforbox,1) = NaN;
nov_right(end+1:sizeforbox,1) = NaN;
firstangleforbox(end+1:sizeforbox,1) = NaN;

% creates variable for boxplot
forbox = [left, right, nov_left, nov_right, firstangleforbox];
xforswarm = ones(length(forbox),size(forbox,2));
xforswarm = xforswarm.*(1:size(forbox,2));

% plot boxplot+swarmplot
figure
boxplot(forbox)
hold on
swarmchart(xforswarm, forbox, [], 'k', 'filled', 'o','XJitterWidth',0.4, 'MarkerFaceAlpha',0.3)

xticklabels({'Left standard', 'Right standard', 'Left deviant', 'Right deviant', 'Firstangleview'})
ylabel('PC1')
