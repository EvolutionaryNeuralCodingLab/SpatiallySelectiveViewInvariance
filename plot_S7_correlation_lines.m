
%% plot correlation lines _forpaper

load('correlation_lines.mat')

% make correlation lines the same length
xdiff = (forcorrlines.x(:,2)-forcorrlines.x(:,1));
newy = forcorrlines.y-forcorrlines.y(:,1);
newy = newy.*(200./xdiff); % normalizes correltaion lines to 0-200 eye angle
newx = [ones(length(forcorrlines.x),1), 200*ones(length(forcorrlines.x),1)];

% plot lines
figure
for i = 1:length(newx)
    if forcorrlines.pcorr(i)<0.05
        line(newx(i,:),newy(i,:), 'Color', 'black')
    else
        line(newx(i,:),newy(i,:), 'Color', 'black', 'LineStyle', '--')
    end
end

line([0,25],[0,-25], 'Color', 'red')
ylim([-25,25])
xlim([0,50])
title('Linear correlation lines during stim')
ylabel('relative Eye angle')
xlabel('relative Head angle')
