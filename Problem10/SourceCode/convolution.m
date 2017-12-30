function outputImage = convolution(inputImage, kernel)
kernel = double(kernel);
[h,w] = size(inputImage);
[kh, kw] = size(kernel);
padh = uint32((kh-1)/2);
padw = uint32((kw-1)/2);
paddedInput = double(padarray(double(inputImage),double([padh, padw]), 'replicate'));
outputImage = zeros(h,w,'uint8');

for i=1:h
    for j=1:w
        outputImage(i,j) = uint8(sum(sum(paddedInput(i:i+kh-1, j:j+kw-1).* kernel)));
    end
end
end