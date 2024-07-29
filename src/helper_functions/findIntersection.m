function intersection = findIntersection(line1, line2)
    % Calculates the intersection point of two lines, each
    % defined by two points.
    %
    % Inputs:
    % line1 - 2x2 matrix - two points defining the first line
    % line2 - 2x2 matrix - two points defining the first line
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
        intersection = [NaN, NaN];
        return;
    end
    
    % Compute the numerators
    num_x = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4);
    num_y = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4);
    
    % Compute the intersection point
    intersection = [num_x / denom; num_y / denom];
end