function foreground3D = getForeground3D(foreground2D, twelfPoints2D, twelfPoints3D, vanishingPoint)

foreground3D = cell(1,numel(foreground2D));
for i = 1 : numel(foreground2D)
    foreGroundPoints2D = foreground2D{i};
    backgroundPlane = findBackgroundForForeGround(foreGroundPoints2D, twelfPoints2D);
    foreGroundPoints2D(2,:) = -foreGroundPoints2D(2,:); % Turn in to the 3D coordinate system

    % Decide for anchor point, inner and outer line of the outer rectangle
    if strcmp(backgroundPlane,"floor")        
        [anchorX, idxMax] = min(foreGroundPoints2D(2,:));
        foreGroundPoints2D(2,:) = foreGroundPoints2D(2,:) - foreGroundPoints2D(2,idxMax); % Offset roi to the wall
        innerLine = twelfPoints3D(:,[1 2]);
        outerLine = twelfPoints3D(:,[3 4]);
        depth = abs(twelfPoints3D(3,3) - twelfPoints3D(3,1));
    elseif  strcmp(backgroundPlane,"ceiling")
        [anchorX, idxMax] = max(foreGroundPoints2D(2,:));
        foreGroundPoints2D(2,:) = foreGroundPoints2D(2,:) - foreGroundPoints2D(2,idxMax); % Offset roi to the wall
        innerLine = twelfPoints3D(:,[7 8]);
        outerLine = twelfPoints3D(:,[9 10]);
        depth = abs(twelfPoints3D(3,9) - twelfPoints3D(3,7));
    elseif  strcmp(backgroundPlane,"left")
        [anchorX, idxMax] = min(foreGroundPoints2D(1,:));
        foreGroundPoints2D(2,:) = foreGroundPoints2D(1,:) - foreGroundPoints2D(1,idxMax); % Offset roi to the wall
        innerLine = twelfPoints3D(:,[1 7]);
        outerLine = twelfPoints3D(:,[5 11]);
        depth = abs(twelfPoints3D(3,5) - twelfPoints3D(3,1));
    elseif  strcmp(backgroundPlane,"right")
        [anchorX, idxMax] = max(foreGroundPoints2D(1,:));
        foreGroundPoints2D(2,:) = foreGroundPoints2D(1,:) - foreGroundPoints2D(1,idxMax); % Offset roi to the wall
        innerLine = twelfPoints3D(:,[2 8]);
        outerLine = twelfPoints3D(:,[6 12]);
        depth = abs(twelfPoints3D(3,6) - twelfPoints3D(3,2));
    end

    vpAnchor = [vanishingPoint foreGroundPoints2D(:,idxMax)];

    vpAnchorInnerLine= findIntersection(vpAnchor, innerLine); 
    vpAnchorOuterLine = findIntersection(vpAnchor, outerLine);

    depthAnchor = get3DLength(vanishingPoint(1), vpAnchorInnerLine(1), ...
        vpAnchorOuterLine(1), anchorX, depth);
    depthAnchor = abs(depthAnchor);

    RoiZ = twelfPoints3D(3,1) + depthAnchor;    

    foreground3D{i} = [foreGroundPoints2D; RoiZ*ones(1, size(foreGroundPoints2D,2))];

end

end



function backgroundPlane = findBackgroundForForeGround(pointsForeground2D,twelfPoints2D)

% Define the 4 planes of the 2D background
planes = struct;
planes.floor   = twelfPoints2D(:,[1,3,4,2]);
planes.ceiling = twelfPoints2D(:,[7,8,10,9]);
planes.left    = twelfPoints2D(:,[1,5,11,7]);
planes.right   = twelfPoints2D(:,[2,6,12,8]);

planeNames = fieldnames(planes);

xq = pointsForeground2D(2,:)';
yq = pointsForeground2D(1,:)';

% Find background: the background that contains the most points of the ROI,
% contins the ROI
numInMax = 0;

for i = 1:numel(planeNames)
    plainName = planeNames{i};
    planeX = planes.(plainName)(1,:)';
    planeY = planes.(plainName)(2,:)';

    [in,~] = inpolygon(xq,yq,planeX,planeY);

    numIn = numel(xq(in));% Number of points inside a plane

    if numIn > numInMax
        numInMax = numIn;
        backgroundPlane = planeNames{i};
    end
end
end