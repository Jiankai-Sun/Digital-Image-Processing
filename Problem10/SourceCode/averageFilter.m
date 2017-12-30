function outputImg = averageFilter(inputImg, kh, kw)
kernel = ones(kh, kw) ./ (kh*kw);
outputImg = uint8(convolution(inputImg,kernel));
end