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

%% Functions
function findIntersection = findIntersection(line1, line2)
    % findIntersection calculates the findIntersection point of two lines
    % defined by points (line1 and line2).
    %
    % Inputs:
    % line1 - 2x4 matrix - two points defining the first line
    % line2 - 2x4 matrix - two points defining the first line
    %
    % Output:
    % findIntersection - 2x1 vector - of the intersection 
    % 
    % If the lines are parallel, the function returns NaN.
    
    % Extract coordinates from line1
    x1 = line1(1); y1 = line1(2);
    x2 = line1(3); y2 = line1(4);
    
    % Extract coordinates from line2
    x3 = line2(1); y3 = line2(2);
    x4 = line2(3); y4 = line2(4);
    
    % Compute the denominators
    denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    
    % Check if the lines are parallel
    if denom == 0
        findIntersection = [NaN, NaN];
        return;
    end
    
    % Compute the numerators
    num_x = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4);
    num_y = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4);
    
    % Compute the findIntersection point
    findIntersection = [num_x / denom; num_y / denom];
end