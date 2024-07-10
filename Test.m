clear
close all 

outer_x = 19;
outer_y = 12;

outerRectagle = [[0; 0] [outer_x; 0] [outer_x; 14] [0; 14]];
innerRectagle = [[5; 6] [10; 6] [10; 9] [5; 9]];
vanishingPoint = [8;8];

twelfPoints = get12Points(vanishingPoint, innerRectagle, outerRectagle);
if ~isnan(twelfPoints) 
    % Coners of outerRectagle
    outer1 = outerRectagle(:,1);
    outer2 = outerRectagle(:,2);
    outer3 = outerRectagle(:,3);
    outer4 = outerRectagle(:,4);
    
    % Coners of outerRectagle
    inner1 = innerRectagle(:,1);
    inner2 = innerRectagle(:,2);
    inner3 = innerRectagle(:,3);
    inner4 = innerRectagle(:,4);
    
    % Lines connecting vanishingPoint and intersection with outerRectagle
    vp3  = [vanishingPoint twelfPoints(:,3)];
    vp4  = [vanishingPoint twelfPoints(:,4)];
    vp5  = [vanishingPoint twelfPoints(:,5)];
    vp6  = [vanishingPoint twelfPoints(:,6)];
    vp9  = [vanishingPoint twelfPoints(:,9)];
    vp10 = [vanishingPoint twelfPoints(:,10)];
    vp11 = [vanishingPoint twelfPoints(:,11)];
    vp12 = [vanishingPoint twelfPoints(:,12)];
    
    % Planes
    ceiling   = [twelfPoints(:,7) twelfPoints(:,9) twelfPoints(:,10) twelfPoints(:,8) twelfPoints(:,7)];
    leftWall  = [twelfPoints(:,1) twelfPoints(:,7) twelfPoints(:,11) twelfPoints(:,5) twelfPoints(:,1)];
    rigthWall = [twelfPoints(:,8) twelfPoints(:,12) twelfPoints(:,6) twelfPoints(:,2) twelfPoints(:,8)];
    floor     = [twelfPoints(:,1) twelfPoints(:,2) twelfPoints(:,4) twelfPoints(:,3) twelfPoints(:,1)];
    rearWall = [innerRectagle innerRectagle(:,1)];
    
    
    % Plot
    figure
    set(gca, 'YDir', 'reverse'); % Reverse Y-axis direction to go downward
    hold on
    
    % Planes
    plot(ceiling(1,:), ceiling(2,:), "Color", "g", "LineWidth", 5);
    plot(leftWall(1,:), leftWall(2,:), "Color", "g", "LineWidth", 5);
    plot(rigthWall(1,:), rigthWall(2,:), "Color", "g", "LineWidth", 5);
    plot(floor(1,:), floor(2,:), "Color", "g", "LineWidth", 5);
    plot(rearWall(1,:), rearWall(2,:), "Color", "r", "LineWidth", 5);
    
    % outerRectagle
    plot([outer1(1,:) outer2(1,:) outer3(1,:) outer4(1,:) outer1(1,:)], ...
         [outer1(2,:) outer2(2,:) outer3(2,:) outer4(2,:) outer1(2,:)], ...
         "Color", "k", "LineWidth", 1)
    
    % innerRectagle
    plot([inner1(1,:) inner2(1,:) inner3(1,:) inner4(1,:) inner1(1,:)], ...
         [inner1(2,:) inner2(2,:) inner3(2,:) inner4(2,:) inner1(2,:)], ...
         "Color", "k", "LineWidth", 1)
    
    % lines connecting vanishing point with outerRectagle corners
    plot([vp3(1,:) vp4(1,:) vp5(1,:) vp6(1,:) vp9(1,:) vp10(1,:) vp11(1,:) vp12(1,:)], ...
         [vp3(2,:) vp4(2,:) vp5(2,:) vp6(2,:) vp9(2,:) vp10(2,:) vp11(2,:) vp12(2,:)], ...
         "Color", "k", "LineWidth", 1)
    
    scatter(twelfPoints(1,:),twelfPoints(2,:), 100, "red", "filled")
    scatter(vanishingPoint(1), vanishingPoint(2),  100, "red", "filled")
    names = {"vP","P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12"};
    
    for i = 1:12
        text([vanishingPoint(1) twelfPoints(1,:)], [vanishingPoint(2) twelfPoints(2,:)], names, ...
             'FontSize', 10,'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    end
end



