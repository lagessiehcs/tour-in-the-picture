function textureForeground = getTextureForeground(Image, foreground2D, out_size) % TODO
textureForeground = cell(numel(foreground2D),1);
for i = 1:numel(foreground2D)
    pointsForeground2D = foreground2D{i};
    textureForeground{i} = transformImage(Image, [pointsForeground2D(:, 1)'; pointsForeground2D(:, 2)'; pointsForeground2D(:, 4)'; pointsForeground2D(:, 3)'], out_size);
end

end


function texture = transformImage(Image, movingPoints, out_size)

fixedPoints = [0, 0; 1, 0; 1, 1; 0, 1];
tform = fitgeotform2d(movingPoints, fixedPoints, "projective");
RA = imref2d(out_size, [0, 1], [0, 1]);
texture = imwarp(Image, tform, "OutputView", RA);

end
