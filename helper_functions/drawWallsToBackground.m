function drawWallsToBackground(ax, vanishingPoint, twelfPoints, innerRectangle)
%DRAWWALLSTOBACKGROUND Draw lines represent the 5 walls to the background

% Planes
ceiling   = [twelfPoints(:,7) twelfPoints(:,9) twelfPoints(:,10) twelfPoints(:,8) twelfPoints(:,7)];
leftWall  = [twelfPoints(:,1) twelfPoints(:,7) twelfPoints(:,11) twelfPoints(:,5) twelfPoints(:,1)];
rigthWall = [twelfPoints(:,8) twelfPoints(:,12) twelfPoints(:,6) twelfPoints(:,2) twelfPoints(:,8)];
floor     = [twelfPoints(:,1) twelfPoints(:,2) twelfPoints(:,4) twelfPoints(:,3) twelfPoints(:,1)];
rearWall = [innerRectangle innerRectangle(:,1)];

% Planes
hold(ax,"on")
line(ax, ceiling(1,:), ceiling(2,:), "Color", "g", "LineWidth", 3);
line(ax, leftWall(1,:), leftWall(2,:), "Color", "g", "LineWidth", 3);
line(ax, rigthWall(1,:), rigthWall(2,:), "Color", "g", "LineWidth", 3);
line(ax, floor(1,:), floor(2,:), "Color", "g", "LineWidth", 3);
line(ax, rearWall(1,:), rearWall(2,:), "Color", "r", "LineWidth", 3);


scatter(ax, twelfPoints(1,:),twelfPoints(2,:), 60, "green", "filled")
scatter(ax, vanishingPoint(1), vanishingPoint(2),  60, "green", "filled")
names = {"VP","P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12"};

for i = 1:12
    text(ax, [vanishingPoint(1) twelfPoints(1,:)], [vanishingPoint(2) twelfPoints(2,:)], names, ...
        'FontSize', 15,'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right','Color','r');
end


end

