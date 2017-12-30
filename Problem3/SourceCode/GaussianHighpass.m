
clear; clc; close all;
I = imread('../fig/characters_test_pattern.tif');

figure('Name', 'Origin Image');
imshow(I);

% Generate filter
ff = gaussianHighpassfilter(I, 10);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian HPF, freq = 10');
imshow(out);

% Generate filter
ff = gaussianHighpassfilter(I, 30);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian HPF, freq = 30');
imshow(out);% Generate filter

ff = gaussianHighpassfilter(I, 60);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian HPF, freq = 60');
imshow(out);% Generate filter
ff = gaussianHighpassfilter(I, 160);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian HPF, freq = 160');
imshow(out);% Generate filter
ff = gaussianHighpassfilter(I, 460);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian HPF, freq = 460');
imshow(out);% Generate filter
