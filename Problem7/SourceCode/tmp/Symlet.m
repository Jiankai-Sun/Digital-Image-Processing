%% Investigate image compression based on wavelets.
% Symlet

close all;clear;clc; 
img= imread('../fig/lenna.tif'); 
figure(1);imshow(img);title('ԭʼͼ��'); 
%I1=rgb2gray(I);figure(1);imshow(I1);title('ԭʼͼ��');%��ɻҶ�ͼ�񣬲���ʾ 
doubleImg=im2double(img);%�任ǰ��ԭʼ����


figure;
imshow(reconstructed);title('The Reconstructed Image'); 
imwrite(reconstructed,'ReconstructedImage.jpg');

figure;
imshow(abs(reconstructed-doubleImg),[]);title('The Difference Image');