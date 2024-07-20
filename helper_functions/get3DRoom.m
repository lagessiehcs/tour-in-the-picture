function get3DRoom(floor, left, ceiling, right, rear, p, gui_ax)
    % This function renders the room using matlabs figure system.
    % It generates the surfaces for all 5 walls and puts the figure into the
    % right mode to rotate the room.
    % 
    % Inputs:
    %   ID: texture of the floor of the room
    %   IL: texture of the left wall of the room
    %   IT: texture of the ceiling of the room
    %   IR: texture of the right wall of the room
    %   IB: texture of the back wall of the room
    %   p: the 12 3d points of the room
    %   gui_ax: The ax element of the figure, passed from the gui
    
    % Perform rotation of the points to make it easier to view.
    % ax = -pi/2;
    % Rx = [1 0 0; 0 cos(ax) -sin(ax); 0 sin(ax) cos(ax)];
    % 
    % p = Rx*p;
    % 
    p = p';
    
    
    x = p(:, 1);
    y = p(:, 2);
    z = p(:, 3);
    
    % figure;
    surface([x(7), x(8); x(1), x(2)], [y(7), y(8); y(1), y(2)], [z(7), z(8); z(1), z(2)],'FaceColor', 'texturemap', 'CData', rear, 'Parent', gui_ax);
    surface([x(9), x(10); x(7), x(8)], [y(9), y(10); y(7), y(8)], [z(9), z(10); z(7), z(8)],'FaceColor', 'texturemap', 'CData', ceiling, 'Parent', gui_ax);
    surface([x(1), x(2); x(3), x(4)], [y(1), y(2); y(3), y(4)], [z(1), z(2); z(3), z(4)],'FaceColor', 'texturemap', 'CData', floor, 'Parent', gui_ax);
    surface([x(11), x(7); x(5), x(1)], [y(11), y(7); y(5), y(1)], [z(11), z(7); z(5), z(1)],'FaceColor', 'texturemap', 'CData', left, 'Parent', gui_ax);
    surface([x(8), x(12); x(2), x(6)], [y(8), y(12); y(2), y(6)], [z(8), z(12); z(2), z(6)],'FaceColor', 'texturemap', 'CData', right, 'Parent', gui_ax);
    
    axis(gui_ax, 'equal');
    axis(gui_ax, 'vis3d');
    axis(gui_ax, 'off');
    camproj(gui_ax, 'perspective');
    camva(gui_ax, 'auto');
    % camup(gui_ax, [0, -1, 0]);
    % view(gui_ax, [0, -1, 0]);
    
    rotate3d(gui_ax, "on");
    % campos([0, 0, -100])
end
