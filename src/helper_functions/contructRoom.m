function contructRoom(textureForeground, textureBackground, foreground3D, twelfPoints3D, ax)
% This function constructs the 3D room by generating the surface images
% for all 5 walls

twelfPoints3D = twelfPoints3D';
twelfPoints3DX = twelfPoints3D(:, 1);
twelfPoints3DY = twelfPoints3D(:, 2);
twelfPoints3DZ = twelfPoints3D(:, 3);

surface([twelfPoints3DX(7), twelfPoints3DX(8); twelfPoints3DX(1), twelfPoints3DX(2)], ...
    [twelfPoints3DY(7), twelfPoints3DY(8); twelfPoints3DY(1), twelfPoints3DY(2)], ...
    [twelfPoints3DZ(7), twelfPoints3DZ(8); twelfPoints3DZ(1), twelfPoints3DZ(2)], ...
    'FaceColor', 'texturemap', 'CData', textureBackground.Rear, 'EdgeColor', 'none', 'Parent', ax);

surface([twelfPoints3DX(9), twelfPoints3DX(10); twelfPoints3DX(7), twelfPoints3DX(8)], ...
    [twelfPoints3DY(9), twelfPoints3DY(10); twelfPoints3DY(7), twelfPoints3DY(8)], ...
    [twelfPoints3DZ(9), twelfPoints3DZ(10); twelfPoints3DZ(7), twelfPoints3DZ(8)], ...
    'FaceColor', 'texturemap', 'CData', textureBackground.Ceiling, 'EdgeColor', 'none', 'Parent', ax);

surface([twelfPoints3DX(1), twelfPoints3DX(2); twelfPoints3DX(3), twelfPoints3DX(4)], ...
    [twelfPoints3DY(1), twelfPoints3DY(2); twelfPoints3DY(3), twelfPoints3DY(4)], ...
    [twelfPoints3DZ(1), twelfPoints3DZ(2); twelfPoints3DZ(3), twelfPoints3DZ(4)], ...
    'FaceColor', 'texturemap', 'CData', textureBackground.Floor, 'EdgeColor', 'none', 'Parent', ax);

surface([twelfPoints3DX(11), twelfPoints3DX(7); twelfPoints3DX(5), twelfPoints3DX(1)], ...
    [twelfPoints3DY(11), twelfPoints3DY(7); twelfPoints3DY(5), twelfPoints3DY(1)], ...
    [twelfPoints3DZ(11), twelfPoints3DZ(7); twelfPoints3DZ(5), twelfPoints3DZ(1)], ...
    'FaceColor', 'texturemap', 'CData', textureBackground.Left, 'EdgeColor', 'none', 'Parent', ax);

surface([twelfPoints3DX(8), twelfPoints3DX(12); twelfPoints3DX(2), twelfPoints3DX(6)], ...
    [twelfPoints3DY(8), twelfPoints3DY(12); twelfPoints3DY(2), twelfPoints3DY(6)], ...
    [twelfPoints3DZ(8), twelfPoints3DZ(12); twelfPoints3DZ(2), twelfPoints3DZ(6)], ...
    'FaceColor', 'texturemap', 'CData', textureBackground.Right, 'EdgeColor', 'none', 'Parent', ax);

% TODO
% for i = 1:numel(foreground3D)
% 
%     foreGroundPoints3D = foreground3D{i}';
%     plotPolygon(foreGroundPoints3D, textureForeground{i}, ax)
% end

axis(ax, 'equal');
axis(ax, 'vis3d');
axis(ax, 'off');


% view([0, 1, 0]);
% set(ax, 'YDir', 'normal');
% view(ax, 135, 45);

rotate3d(ax, "on");
% campos([0, 0, -100])
end


