function [paddedImage, topPadding, leftPadding] = padImage(twelfPoints, Image)

    %% Extract the neccessary points for determining the padding area
    Point3 = twelfPoints(:,3);
    Point4 = twelfPoints(:,4);
    Point5 = twelfPoints(:,5);
    Point6 = twelfPoints(:,6);
    Point9 = twelfPoints(:,9);
    Point10 = twelfPoints(:,10);
    Point11 = twelfPoints(:,11);
    Point12 = twelfPoints(:,12);
    
    %% Determine the padding area 
    % Note: the coordinate system is: right handed, x to the right, y
    % downwards
    % Get the helper x and y values for padding
    xLeft = min([Point3(1), Point5(1), Point9(1), Point11(1)]);   % The furthest x coordinate to the left
    xRight = max([Point4(1), Point6(1), Point10(1), Point12(1)]); % The furthest x coordinate to the right
    yTop = min([Point9(2), Point10(2), Point11(2), Point12(2)]);  % The furthest y coordinate to the top
    yBottom = max([Point6(2), Point5(2), Point3(2), Point4(2)]);  % The furthest y coordinate to the bottom
    
    % Determine padding area
    topPadding = ceil(abs(yTop));
    bottomPadding = ceil(abs(yBottom))-size(Image,1);
    leftPadding = ceil(abs(xLeft));
    rightPadding = ceil(abs(xRight))-size(Image,2);

    %% Padding
    paddedImage = padarray(Image,[topPadding,leftPadding],0,'pre');
    paddedImage = padarray(paddedImage,[bottomPadding,rightPadding],0,'post');
end