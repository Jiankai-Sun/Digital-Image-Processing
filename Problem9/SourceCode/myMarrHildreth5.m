%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% my_edgeMarrHildreth.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edgeMagnitude = myMarrHildreth(image, sigma)

% Determine filter size N = [sigma x 3] x 2 + 1 and the
% size of the image.
N = ceil(sigma * 3)*2 + 1;
[height, width, ~] = size(image);

% Use the laplacian of the gaussian.
log = fspecial('log', N, sigma);
convolved = double(imfilter(image, log));

% Threshold the image
convolved = imbinarize(convolved, 0);

padded = padarray(convolved, [1,1], 1);
edgeMagnitude = zeros(height, width, 1);

% Zero Crossings
for i=1:height
    for j=1:width
        if (padded(i+1, j+1) == 1)
            if(padded(i,j+1) == 0 || padded(i+1, j+2) == 0 ||...
                    padded(i+2, j+1) == 0 || padded(i+1, j) == 0)
                edgeMagnitude(i,j) = 1;
            end
        end
    end
end
end