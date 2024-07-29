function textureBackground = getTextureBackground(Image, twelPoints, out_size)

textureBackground.Floor = transformImage(Image, [twelPoints(:, 1)'; twelPoints(:, 2)'; twelPoints(:, 4)'; twelPoints(:, 3)'], out_size);
textureBackground.Left = transformImage(Image, [twelPoints(:, 11)'; twelPoints(:, 7)'; twelPoints(:, 1)'; twelPoints(:, 5)'], out_size);
textureBackground.Ceiling = transformImage(Image, [twelPoints(:, 9)'; twelPoints(:, 10)'; twelPoints(:, 8)'; twelPoints(:, 7)'], out_size);
textureBackground.Right = transformImage(Image, [twelPoints(:, 8)'; twelPoints(:, 12)'; twelPoints(:, 6)'; twelPoints(:, 2)'], out_size);
textureBackground.Rear = transformImage(Image, [twelPoints(:, 7)'; twelPoints(:, 8)'; twelPoints(:, 2)'; twelPoints(:, 1)'], out_size);
end


function texture = transformImage(Image, movingPoints, out_size)

fixedPoints = [0, 0; 1, 0; 1, 1; 0, 1];
tform = fitgeotform2d(movingPoints, fixedPoints, "projective");
RA = imref2d(out_size, [0, 1], [0, 1]);
texture = imwarp(Image, tform, "OutputView", RA);

end
