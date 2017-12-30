close all;clear;clc; 
img= imread('../fig/polymersomes.tif'); 
figure('Name','Original Image');
imshow(img,[]);
title('Original Image'); 

otsuResult = otsu(img);
figure('Name','Otsu method of thresholding segmentation');
imshow(otsuResult,[]);
title('Otsu method of thresholding segmentation');

globalResult = gbt(img);
figure('Name','Global method of thresholding segmentation');
imshow(globalResult,[]);
title('Global method of thresholding segmentation');