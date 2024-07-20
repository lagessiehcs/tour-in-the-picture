function point3D = perspectiveProjection(point2D, bottomLeftCornerInnerRectangle, options)
%PERSPECTIVEPROJECTION - Mapping of pixel coordinates onto world coordinates
%   The mathematics of this part can be found in the slides of the lecture
%   2.4 - Perspective Projection with a Calibrated Camera of the course
%   Computer Vision (TUM)

arguments
    point2D   (2,1) {mustBeNumeric} % point in 2D
    bottomLeftCornerInnerRectangle (2,1) {mustBeNumeric} % bottom left corner of the inner rectangle
    options.f (1,1) {mustBeNumeric} = 1 % Focal point
    options.z (1,1) {mustBeNumeric} = 5 % z coordinate of the point in real world

end

%% Perspective projection matrix
% Focal length matrix
f = options.f;
Kf = diag([f, f, 1]);

%% Sensor parameter matrix
% This matrix transforms the image coordinates into the
% pixel coordinate.
% In our case, since we already know the pixel coordinates (right handed,
% x right, y down), we can assume that the two coordinate are identical and
% set this matrix to be the identical matrix.

% Translation from pixel coordinates to image coordinates along x and y axis
ox = 200;
oy = 200;

sx = 1;     % Linear tranlation factor along x axis
sy = 1;     % Linear tranlation factor along y axis
stheta = 0; % Shear factor along y

Ks = [
    sx stheta ox
    0   sy   oy
    0    0    1
    ];

%% Calibration matrix (intrinsic camera parameters)
K = Ks*Kf;

%% Transformation of the homogeneous coordinates through euclidian motion of the camera
% Since we have assumed the camera and the pixel coordinates are identical,
% this matrix will transform directly from word to pixel cooerdinates.

R = rot('z', pi) * rot('y', pi); % Rotation matrix
T = [bottomLeftCornerInnerRectangle; 0]; % Translation vector

H = [
    R      T
    zeros(1,3) 1
    ];

%% Get point in world coordinates
point3D_pixel = options.z + K \ [point2D; 1]; % 3D point in the pixel coordinates

point3D_hom = H \ [point3D_pixel; 1]; % Homogenous vector of the 3D point
point3D = point3D_hom(1:3);

end

function R = rot(axis, angle)
arguments
    axis  (1,1) string {mustBeMember(axis, ["x", "y", "z"])}
    angle (1,1) {mustBeNumeric}
end
c = cos(angle);
s = sin(angle);
switch axis
    case 'x'
        R = [
            1  0  0
            0  c -s
            0  s  c
            ];
    case 'y'
        R = [
            c  0  s
            0  1  0
            -s  0  c
            ];
    case 'z'
        R = [
            c -s  0
            s  c  0
            0  0  1
            ];
end
end
