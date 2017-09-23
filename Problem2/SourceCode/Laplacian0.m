%Version 1: Use function provided by MatLab
clear; clc; close all;
f = imread('../fig/skeleton_orig.tif');
% Convert to double type for later filtering 
f2=im2double(f); 
w=fspecial('laplacian',0);
g1=imfilter(f,w,'replicate');
g=f-g1;
figure('Name', 'Original Image')
imshow(f, []);
figure('Name', 'Laplacian')
imshow(g1, []);
figure('Name', 'After Laplacian')
imshow(g, []);