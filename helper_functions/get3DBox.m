function twelfPoints3D = get3DBox(twelfPoints2D, IR_height, IR_width)
%GET3DBOX - Thsi function condtruct a 3D box from the 12 generated points
%   To do this, the depth of the floor into the picture is assumed. The
%   coordination origin of the box is at the bottom left corner of the rear
%   wall, x right, y up.

twelfPoints3D = zeros(3,12);

%% Assumed depth of the floor
floorDepth = (IR_height+IR_width)/2;

%% Extract x values of the twelf points
x = zeros(1,12);
for i = 1:12
   x(i) = twelfPoints2D(1,i);
end

%% Get the depth of the remaining plane
leftDepth    = (x(5) - x(1)) / (x(3) - x(1)) * floorDepth;     % Depth of the left wall
ceilingDepth = (x(9) - x(7)) / (x(11) - x(7)) * leftDepth;     % Depth of the left wall
rightDepth   = (x(12) - x(8)) / (x(10) - x(8)) * ceilingDepth; % Depth of the left wall


%% Point 1,2,7,8
twelfPoints3D(:,1) = [0; 0; 0];
twelfPoints3D(:,2) = [IR_width; 0; 0];
twelfPoints3D(:,7) = [0; IR_height; 0];
twelfPoints3D(:,8) = [IR_width; IR_height; 0];

%% Get the remaining points
twelfPoints3D(:,[3 4])   = [twelfPoints3D(1:2,[1 2]); floorDepth * ones(1,2)];
twelfPoints3D(:,[5 11])  = [twelfPoints3D(1:2,[1 7]); leftDepth * ones(1,2)];
twelfPoints3D(:,[9 10])  = [twelfPoints3D(1:2,[7 8]); ceilingDepth * ones(1,2)];
twelfPoints3D(:,[12 6])  = [twelfPoints3D(1:2,[8 2]); rightDepth * ones(1,2)];

end