% nearest neighbor
close all;
clear;
clc;
%% ----------init-----------------------------
img = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(img);
% parameters
m = 2;
n = 1;

[h, w] = size(img);
imgn = zeros(floor(h * m), floor(w * n));
rot = [m 0 0; 0 n 0; 0 0 1];  % Transform Matrix
for i = 1 : h*m
    for j = 1 : w*n
        pix = [i j 1] / rot;
        imgn(i,j) = img(round(pix(1)), round(pix(2)));
    end
end
      
figure('Name', 'Scale with self-defined function');
imshow(imgn, []);