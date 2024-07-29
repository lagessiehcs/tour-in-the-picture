function BD_length3D = get3DLength(Ax, Bx, Cx, Dx, BC_length3C)
%GET3DLENGTH(Ax, Bx, Cx, Dx, BC_length3C) - Get the 3D length of a line segment BC given the 3D length of BC.
%   If A, B, C, D are collinear and A is the vanishing point of that line,
%   the cross ratio (A,B;C,D) = (AC*BD) / (BC*AD) of the 2D projection of
%   these points will give you the ratio BD/BC in 3D. Given the length of 
%   BC in 3D, the 3D length of BD can be easily obtained.
%
%   The function calculates the cross-ratio using only the x-coordinates of the 
%   points instead of calculating the lengths of the segments.
%
%   Input Arguments:
%     Ax, Bx, Cx, Dx - x-coordinates of the points A, B, C, D respectively
%     BC_length3C - The length of BC in 3D
%
%   Output Arguments:
%     BD_length3D - The length of BD in 3D
%
%   Example usage:
%     Ax = 1;
%     Bx = 2;
%     Cx = 4;
%     Dx = 6;
%     BC_length3C = 5;
%     BD_length3D = get3DLength(Ax, Bx, Cx, Dx, BC_length3C);

arguments
    Ax          (1,1) {mustBeNumeric}
    Bx          (1,1) {mustBeNumeric}
    Cx          (1,1) {mustBeNumeric}
    Dx          (1,1) {mustBeNumeric}
    BC_length3C (1,1) {mustBeNumeric}
end

% Compute the cross-ratio using the x-coordinates
cross_ratio = ((Cx - Ax) * (Dx - Bx)) / ((Cx - Bx) * (Dx - Ax));

% Compute the length of BD in 3D
BD_length3D = cross_ratio * BC_length3C;

end