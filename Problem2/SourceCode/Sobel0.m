%% (d) Sobel gradient of (a).
clear;clc;close all;
f = imread('../fig/skeleton_orig.tif');
figure('Name', 'Original Image')
imshow(f, []);

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
% Average filter provided by MatLab
A = fspecial('average',5);
Y = filter2(A, grad)/255;
figure('Name', 'Average filter provided by MatLab');
imshow(Y, []);
% Self defined average filter
Y2 = avefilt(grad, 5);
figure('Name', 'Self Defined Average Filter');
imshow(Y2, []);

