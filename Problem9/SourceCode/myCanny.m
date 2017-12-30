function outputImg = myCanny(inputImg)
[h,w] = size(inputImg);
% gaussian blur
sigma = round(min(h,w) * 0.005);
ksize = ceil(sigma*6);
if mod(ksize, 2) == 0
    ksize = ksize + 1;
end
inputImgGaussian = convolutionDouble(inputImg,GaussianFilter(ksize,ksize,sigma));
% sobel
SobelKernelX = [-1,0,1; -2,0,2; -1,0,1];
SobelKernelY = [-1,-2,-1; 0,0,0; 1,2,1];
Gx = convolutionDouble(inputImgGaussian, SobelKernelX);
Gy = convolutionDouble(inputImgGaussian, SobelKernelY);
inputImgSobel = sqrt(Gx.^2 + Gy.^2);
alpha = atan(Gy ./ Gx);
alpha = round(alpha ./ (pi / 4) + 3);
alpha(alpha == 5) = 1;
%nonmaxima suppression
d1Mask = alpha == 1;
d2Mask = alpha == 2;
d3Mask = alpha == 3;
d4Mask = alpha == 4;
paddedMinputImgSobel = padarray(inputImgSobel, [1, 1], 'replicate');
%vertical
d1Comp = and(inputImgSobel >= paddedMinputImgSobel(1:h, 2:w+1), inputImgSobel >= paddedMinputImgSobel(3:h+2,2:w+1));
%-pi/4
d2Comp = and(inputImgSobel >= paddedMinputImgSobel(3:h+2, 1:w), inputImgSobel >= paddedMinputImgSobel(1:h, 3:w+2));
%horizon
d3Comp = and(inputImgSobel >= paddedMinputImgSobel(2:h+1, 1:w), inputImgSobel >= paddedMinputImgSobel(2:h+1, 3:w+2));
%pi/4
d4Comp = and(inputImgSobel >= paddedMinputImgSobel(1:h, 1:w), inputImgSobel >= paddedMinputImgSobel(3:h+2, 3:w+2));
gN = inputImgSobel .* (and(d1Mask, d1Comp) + and(d2Mask, d2Comp) + and(d3Mask, d3Comp) + and(d4Mask, d4Comp));

sortedOut = sort(reshape( gN, 1, h * w), 'descend');
threshH = sortedOut(1, ceil(h * w * 0.02));
threshL = 1 * threshH;
N = 100;
set(0,'RecursionLimit',N);
for i=1:h
    for j=1:w
      if gN(i,j)>threshH &&gN(i,j)~=255
            gN(i,j)=255;
            gN=connect(gN,i,j,threshL);
      end
    end
end
outputImg = uint8(gN);
end

function [nedge] = connect(nedge,y,x,low)
    neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];
    [m, n]=size(nedge);
    for k=1:8
        yy=y+neighbour(k,1);
        xx=x+neighbour(k,2);
        if yy>=1 &&yy<=m &&xx>=1 && xx<=n  
            if nedge(yy,xx)>=low && nedge(yy,xx)~=255
                nedge(yy,xx)=255;
                nedge=connect(nedge,yy,xx,low);
            end
        end        
    end 
end