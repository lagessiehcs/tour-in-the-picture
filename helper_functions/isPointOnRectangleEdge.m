function is_on_edge = isPointOnRectangleEdge(point, rect_top_left, rect_bottom_right, tolerance)
    % Extract coordinates for readability
    px = point(1);
    py = point(2);
    x1 = rect_top_left(1);
    y1 = rect_top_left(2);
    x2 = rect_bottom_right(1);
    y2 = rect_bottom_right(2);

    % Default tolerance if not provided
    if nargin < 4
        tolerance = 1e-9;
    end

    % Check if the point is on any of the rectangle's edges within the tolerance
    on_left_edge   = (abs(px - x1) <= tolerance) && (py >= y1 - tolerance) && (py <= y2 + tolerance);
    on_right_edge  = (abs(px - x2) <= tolerance) && (py >= y1 - tolerance) && (py <= y2 + tolerance);
    on_bottom_edge = (abs(py - y1) <= tolerance) && (px >= x1 - tolerance) && (px <= x2 + tolerance);
    on_top_edge    = (abs(py - y2) <= tolerance) && (px >= x1 - tolerance) && (px <= x2 + tolerance);

    % Determine if the point is on any of the edges
    is_on_edge = on_left_edge || on_right_edge || on_bottom_edge || on_top_edge;
end