function [ outputImg ] = myMarrHildreth4( inputImg )
%MYMARRHILDRETH 此处显示有关此函数的摘要
[h,w] = size(inputImg);

sigma = round(min(h,w) * 0.005);
n = ceil(sigma*6);
if mod(n, 2) == 0
    n = n + 1;
end
inputImgGaussian = convolutionDouble(inputImg,GaussianFilter(n,n,sigma));
LaplacianKernel = [1,1,1; 1,-8,1; 1,1,1];
inputImgLaplacian = convolutionDouble(inputImgGaussian, LaplacianKernel);

sortOut = sort(reshape(inputImgLaplacian,1,h*w), 'descend');
threshould = sortOut(1,ceil(h*w*0.04));
outputImg = uint8((inputImgLaplacian > threshould) * 255);
end