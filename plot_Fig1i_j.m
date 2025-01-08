
%% load data
load('pca_output')
score = pca_output.score;
explained = pca_output.explained;
%% scatterplot PC1 vs PC2
figure
scatter(score(end-19:end,1),score(end-19:end,2), 50, 'ro', 'filled', 'MarkerFaceAlpha',0.6)
hold on
scatter(score(11:(length(score)-20),1),score(11:(length(score)-20),2), 50,'bo', 'filled', 'MarkerFaceAlpha', 0.6)
scatter(score(1:10,1),score(1:10,2), 50,'bo', 'filled', 'MarkerFaceAlpha', 0.6, 'CData',[0 1 0]) % plots first 10 trials with all green
xline(mean(score(end-19:end,1)), '--r')
xline(mean(score(11:(length(score)-20),1)), '--b')
xline(mean(score(1:10,1)), '--g')

legend({'novel', 'normal', 'first10'}, 'Interpreter','none', 'FontSize',6)
xlabel(append('PCA1, ', string(round(explained(1),1)), '% explained'))
ylabel(append('PCA2, ', string(round(explained(2),1)), '% explained'))

%% histogram permutation test

shift_means = mean(score(11:180)); % because the mean of the standard is defined as 0

[p_std_dev, ~, ~, randomdiffs] = permutationTest(score(181:200), score(11:180), 10000, 'plotresult', 1); % plots histogram
xline(mean(score(181:200))-shift_means, '--r')
xline(0, '--b')
xline(mean(score(1:10))-shift_means, '--g')

yticklabels(string((0:500:1500)/10000))
ylabel('Probability')
legend('off')

% nPC1 = (mean(scoreTest(181:200))-mean(scoreTest(11:180)))/std(randomdiffs); %calculates nPC1 values for Fig. 1k