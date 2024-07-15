function twelfPoints = get12Points(vanishingPoint, innerRectagle, outerRectagle)
% Calculate 12 vertexes in the 2D image
% (Coordinate system right-handed x:right y:downward z:in the plane)
%
% Input:
% vanishingPoint - 2x1 vector - Vanishing point position
% innerRectagle  - 2x4 matrix - Four corners of the inner rectangle  
%                               (clockwise from top left)
% outerRectagle  - 2x4 matrix - Four corners of the outer rectangle
%                               (clockwise from top left)
%
% Output:
% twelfPoints - 2x12 matrix - 12 points for 3D modeling


%% Check if the vanishingPoint is inside the innerRectagle
[in, on] = inpolygon(vanishingPoint(1), vanishingPoint(2), innerRectagle(1,:), innerRectagle(2,:));

if ~in || on
    disp("vanishingPoint must lie inside innerRectagle!")
    twelfPoints = nan;
    return
else

    %% Contruct lines 
    % Lines connecting vanishingPoint and 4 conners of innerRectagle
    vp1 = [vanishingPoint innerRectagle(:,1)];
    vp2 = [vanishingPoint innerRectagle(:,2)];
    vp3 = [vanishingPoint innerRectagle(:,3)];
    vp4 = [vanishingPoint innerRectagle(:,4)];
    
    % Edges of outerRectagle
    topEdge    = [outerRectagle(:,1) outerRectagle(:,2)];
    rightEdge  = [outerRectagle(:,2) outerRectagle(:,3)];
    bottomEdge = [outerRectagle(:,3) outerRectagle(:,4)];
    leftEdge   = [outerRectagle(:,4) outerRectagle(:,1)];
    
    
    
    %% Point1, Point2, Point7, Point8
    Point1 = innerRectagle(:,4);
    Point2 = innerRectagle(:,3);
    Point7 = innerRectagle(:,1);
    Point8 = innerRectagle(:,2);
    
    %% Point3 - Point6, Point9 - Point12
    Point3  = findIntersection(vp4, bottomEdge);
    Point4  = findIntersection(vp3, bottomEdge);
    Point5  = findIntersection(vp4, leftEdge);
    Point6  = findIntersection(vp3, rightEdge);
    Point9  = findIntersection(vp1, topEdge);
    Point10 = findIntersection(vp2, topEdge);
    Point11 = findIntersection(vp1, leftEdge);
    Point12 = findIntersection(vp2, rightEdge);
    
    twelfPoints = [Point1 Point2 Point3 Point4  Point5  Point6 ...
                   Point7 Point8 Point9 Point10 Point11 Point12];
    
end
end