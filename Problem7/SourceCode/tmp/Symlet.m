%% Investigate image compression based on wavelets.
% Symlet

close all;clear;clc; 
img= imread('../fig/lenna.tif'); 
figure(1);imshow(img);title('原始图像'); 
%I1=rgb2gray(I);figure(1);imshow(I1);title('原始图像');%变成灰度图像，并显示 
doubleImg=im2double(img);%变换前的原始数据


figure;
imshow(reconstructed);title('The Reconstructed Image'); 
imwrite(reconstructed,'ReconstructedImage.jpg');

figure;
imshow(abs(reconstructed-doubleImg),[]);title('The Difference Image');