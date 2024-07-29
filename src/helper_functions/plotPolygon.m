function plotPolygon(vertices, textureImage, ax)
    % Plot a 3D polygon with an image texture
    %
    % vertices: Nx3 matrix of the vertices of the polygon in 3D
    % textureImage: image to be used as texture
    % ax: handle to the axes where the polygon will be plotted
    
    % Check inputs
    if size(vertices, 2) ~= 3
        error('Vertices must be an Nx3 matrix.');
    end
    if nargin < 3
        ax = gca; % Use current axis if not provided
    end

    % Triangulate the polygon (required for the surf function)
    tri = delaunay(vertices(:,1), vertices(:,2));

    % Extract the x, y, z coordinates
    x = vertices(:,1);
    y = vertices(:,2);
    z = vertices(:,3);

    % Calculate the texture coordinates (u, v)
    u = linspace(0, 1, size(textureImage, 2));
    v = linspace(0, 1, size(textureImage, 1));
    [U, V] = meshgrid(u, v);

    % Interpolate the texture coordinates to match the vertices
    Xq = interp1(u, x, U(:));
    Yq = interp1(v, y, V(:));
    Zq = interp1(u, z, U(:));

    % Reshape interpolated coordinates to match the texture size
    Xq = reshape(Xq, size(U));
    Yq = reshape(Yq, size(V));
    Zq = reshape(Zq, size(U));

    % Plot the textured surface
    surf(ax, Xq, Yq, Zq, 'CData', textureImage, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
    
end
