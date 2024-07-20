function get3DRoom(floor, left, ceiling, right, rear, twelfPoints, ax)
    % This function constructs the 3D room by generating the surface images
    % for all 5 walls

    twelfPoints = twelfPoints';
    
    
    x = twelfPoints(:, 1);
    y = twelfPoints(:, 2);
    z = twelfPoints(:, 3);
    
    % figure;
    surface([x(7), x(8); x(1), x(2)], [y(7), y(8); y(1), y(2)], [z(7), z(8); z(1), z(2)],'FaceColor', 'texturemap', 'CData', rear, 'Parent', ax);
    surface([x(9), x(10); x(7), x(8)], [y(9), y(10); y(7), y(8)], [z(9), z(10); z(7), z(8)],'FaceColor', 'texturemap', 'CData', ceiling, 'Parent', ax);
    surface([x(1), x(2); x(3), x(4)], [y(1), y(2); y(3), y(4)], [z(1), z(2); z(3), z(4)],'FaceColor', 'texturemap', 'CData', floor, 'Parent', ax);
    surface([x(11), x(7); x(5), x(1)], [y(11), y(7); y(5), y(1)], [z(11), z(7); z(5), z(1)],'FaceColor', 'texturemap', 'CData', left, 'Parent', ax);
    surface([x(8), x(12); x(2), x(6)], [y(8), y(12); y(2), y(6)], [z(8), z(12); z(2), z(6)],'FaceColor', 'texturemap', 'CData', right, 'Parent', ax);
    
    axis(ax, 'equal');
    axis(ax, 'vis3d');
    axis(ax, 'off');
    camproj(ax, 'perspective');
    camva(ax, 'auto');
    % camup(ax, [0, -1, 0]);
    % view(ax, [0, -1, 0]);
    
    rotate3d(ax, "on");
    % campos([0, 0, -100])
end
