clc;clear;close all

f1 = imread('../fig/skeleton_orig.tif');
%% Laplacian
Laplace1 = [0 -1 0; -1 4 -1; 0 -1 0];
LaplaceImage = conv2(f1, Laplace1, 'same');
figure('Name', 'Laplacian 1');
imshow(uint8(LaplaceImage), []);
% Add the Laplacian Image and original image
DataLap = imadd(double(f1), immultiply(LaplaceImage,1));
figure('Name', 'Laplacian 1 Enhanced');
imshow(uint8(DataLap), []);

Laplace2 = [1 1 1; 1 -8 1; 1 1 1];
LaplaceImage = conv2(f1, Laplace2, 'same');
figure('Name', 'Laplacian 2');
imshow(uint8(LaplaceImage), []);
% Add the Laplacian Image and original image
DataLap = imadd(double(f1), immultiply(LaplaceImage,1));
figure('Name', 'Laplacian 2 Enhanced');
imshow(uint8(DataLap), []);

Laplace3 = [0 -1 0; -1 4 -1; 0 -1 0];
LaplaceImage = conv2(f1, Laplace3, 'same');
figure('Name', 'Laplacian 3');
imshow(uint8(LaplaceImage), []);
% Add the Laplacian Image and original image
DataLap = imadd(double(f1), immultiply(LaplaceImage,1));
figure('Name', 'Laplacian 3 Enhanced');
imshow(uint8(DataLap), []);

Laplace4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
LaplaceImage = conv2(f1, Laplace4, 'same');
figure('Name', 'Laplacian 4');
imshow(uint8(LaplaceImage), []);
% Add the Laplacian Image and original image
DataLap = imadd(double(f1), immultiply(LaplaceImage,1));
figure('Name', 'Laplacian 4 Enhanced');
imshow(uint8(DataLap), []);

