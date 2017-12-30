close all;clear;clc; 
I1 = imread('../fig/Fig0931(a).tif'); 
figure('Name', 'Original Image');
imshow(I1);
title('Original Image'); 
%%%%%%%%%%%%%%%% Process the figure 9.32%%%%%%%%%%%%
marker = false(size(I1));
marker(:,end-2:end) = true;
% I2=imreconstruct(marker,I1);
% Self defined reconstruction function
I2=myReconstruction(marker,I1);
figure('Name', 'Fig 9.32 (a) Marker Image')
imshow(I2);
title('Fig 9.32 (a) Marker Image');

% g = imclearborder(I1, ones(3,3));
% Self defined function for border clearing
g = myClearBorder(I1, double(ones(3,3)));
figure('Name','Fig 9.32(b) Image with no objects touching the border');
imshow(g);
title('Fig 9.32(b) Image with no objects touching the border.'); 