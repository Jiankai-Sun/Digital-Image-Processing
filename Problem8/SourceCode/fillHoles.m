close all;clear;clc; 
II1 = imread('../fig/Fig0931(a).tif'); 
figure(1);imshow(II1);title('Fig 9.31(a) Text image of size 918 x 2018 pixels'); 
%%%%%%%%%% Process the figure 9.31 %%%%%%%%%%%%%%%%%%%
II2=~II1;
figure('Name', 'Complement of (a) for use as a mask image');
imshow(II2);
title('Complement of (a) for use as a mask image');

II3=imreconstruct(II1,II2);
% II3=myReconstruction(II1,II2);
figure('Name','Fig 9.31(c) Marker Image');
imshow(II3);
title('Fig 9.31(c) Marker Image');
% Self defined function for hole filling
% g = myHoleFill(II1, 'holes');
g = myHoleFill(II1);
figure('Name', 'Result of hole-filling using Eq. (9.5-29)');
imshow(g);
title('Result of hole-filling using Eq. (9.5-29)'); 