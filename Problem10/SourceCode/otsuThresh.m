function [ outputImg ] = otsuThresh( inputImg )
[h, w] = size(inputImg);
if w ~= size(inputImg, 2)
    error('only grayscale image accepted')
end
total = h * w;
inputImg = reshape(inputImg, total, 1);
inputImg = round(inputImg);
% assume gray level is 0, 1, 2, ..., 255
p = zeros(256, 1);
for i = 1:total
    p(inputImg(i) + 1) = p(inputImg(i) + 1) + 1;
end
p = p ./ total;
% sum on each column
tmp = triu(ones(256, 256)) .* repmat(p, 1, 256);
P1 = sum( tmp );
m = sum( tmp .* repmat((1:256)', 1, 256) );
clear tmp
mG = m(256);
sigmaB2 = (mG * P1 - m) .^ 2 ./ P1 ./ (1 - P1);
maxSigmaB2 = max(sigmaB2);
T = mean(find(sigmaB2 == maxSigmaB2));
outputImg = reshape(inputImg, h, w) > T;
end