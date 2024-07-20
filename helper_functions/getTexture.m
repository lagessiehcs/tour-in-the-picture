function [floor, left, ceiling, right, rear] = getTexture(Image, twelPoints, out_size)

floor = transformImage(Image, [twelPoints(:, 1)'; twelPoints(:, 2)'; twelPoints(:, 4)'; twelPoints(:, 3)'], out_size);
left = transformImage(Image, [twelPoints(:, 11)'; twelPoints(:, 7)'; twelPoints(:, 1)'; twelPoints(:, 5)'], out_size);
ceiling = transformImage(Image, [twelPoints(:, 9)'; twelPoints(:, 10)'; twelPoints(:, 8)'; twelPoints(:, 7)'], out_size);
right = transformImage(Image, [twelPoints(:, 8)'; twelPoints(:, 12)'; twelPoints(:, 6)'; twelPoints(:, 2)'], out_size);
rear = transformImage(Image, [twelPoints(:, 7)'; twelPoints(:, 8)'; twelPoints(:, 2)'; twelPoints(:, 1)'], out_size);
end


function Iout = transformImage(Image, movingPoints, out_size)

fixedPoints = [0, 0; 1, 0; 1, 1; 0, 1];
tform = fitgeotform2d(movingPoints, fixedPoints, "projective");
RA = imref2d(out_size, [0, 1], [0, 1]);
Iout = imwarp(Image, tform, "OutputView", RA);

end
