close all;clear;clc;
img= imread('../fig/noisy_stroke.tif'); 
figure('Name','Original Image');
imshow(img);
title('Original Image');
%average blur
imgBlurred = averageFilter(img, 9, 9);
imwrite(imgBlurred,'../result/boundaryFollowing/AfterBlurred.jpg');
%otsu thresh
imgThreshed = otsuThresh(imgBlurred);
imwrite(imgThreshed,'../result/boundaryFollowing/AfterThreshed.jpg');
[M, N] = size(imgThreshed);
%follow boundary
B = followBoundary(imgThreshed);
d=cellfun('length',B);
[max_d,k]=max(d);
b=B{k};
[height, width]=size(imgThreshed);
imgFollowBoundary=bound2im(b,height,width,min(b(:,1)),min(b(:,2)));
imwrite(imgFollowBoundary,'../result/boundaryFollowing/BoundaryFollowing.jpg');
%subsmaple
% [s su]=bsubsamp(b,50);
[s,subPtList] = subsample(b,50);
imgSubsampled = bound2im(s,height,width,min(s(:,1)),min(s(:,2)));
imwrite(imgSubsampled,'../result/boundaryFollowing/AfterSubsample.jpg');
%chain list
chainCodeList = chainCode(subPtList);
% chainCodeList.fcc
chainCodeList.mm
% chainCodeList.diff
chainCodeList.diffmm
%connect points
cn = connectpoly(s(:,1), s(:,2));
imgconnected = bound2im(cn,M,N);
imwrite(imgconnected,'../result/boundaryFollowing/AfterConnected.jpg');