%Laplacian, Second-Derivative
clear;clc;close all;
f = imread('../fig/skeleton_orig.tif');
figure('Name', 'Original Image')
imshow(f, []);

I=im2double(f);
[m,n,c]=size(I);
A3=zeros(m,n,c);
%g(x,y)=-[f(x+1,y)+f(x-1,y)+f(x,y+1)+f(x,y-1)]+4f(x,y)
for i=2:m-1
    for j=2:n-1
        A3(i,j,1)=-(I(i+1,j,1)+I(i-1,j,1)+I(i,j+1,1)+I(i,j-1,1)-4*I(i,j,1));
    end
end
result3=I-A3;
% figure('Name', 'Laplacian')
% imshow(A3, []);
figure('Name', 'After Laplacian')
imshow(result3, []);  % Fig (c)

% Generate Sobel horizontal template
hx = [-1 -2 -1; 0 0 0; 1 2 1]; 
% Generate Sobel vertical template
hy = hx';

% Vertical gradient
gradx = filter2(hx, f, 'same');
gradx = abs(gradx);
%figure('Name', 'Vertical gradient');
%imshow(gradx, []);

% Horizontal gradient
grady = filter2(hy, f, 'same');
grady = abs(grady);
% figure('Name', 'Horizontal gradient');
% imshow(grady, []);

% Sobel gradient
grad = gradx+grady;
figure('Name', 'Sobel gradient');
imshow(grad, []);

%% (e) Sobel image smoothed with a 5X5 averaging filter.
% Self defined average filter
Y2 = avefilt(grad, 5);
figure('Name', 'Self Defined Average Filter');
imshow(Y2, []);

Figf = grad .* double(Y2);
figure('Name', 'Fig f');
imshow(Figf, []);

Figg = double(f) + Figf;
figure('Name', 'Fig g');
imshow(Figg, []);

%% Gamma(exponential) Transformation
H = Figg / 255;
n = 1/2;
c = 1;
Figh = 255*c*H.^n;
figure('Name', 'Fig h');
imshow(Figh, []);



