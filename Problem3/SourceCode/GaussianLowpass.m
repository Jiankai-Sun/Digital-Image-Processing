
clear; clc; close all;
I = imread('../fig/characters_test_pattern.tif');

figure('Name', 'Origin Image');
imshow(I);

% Generate filter
ff = gaussianLowpassfilter(I, 10);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian LPF, freq = 10');
imshow(out);

% Generate filter
ff = gaussianLowpassfilter(I, 30);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian LPF, freq = 30');
imshow(out);% Generate filter

ff = gaussianLowpassfilter(I, 60);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian LPF, freq = 60');
imshow(out);% Generate filter
ff = gaussianLowpassfilter(I, 160);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian LPF, freq = 160');
imshow(out);% Generate filter
ff = gaussianLowpassfilter(I, 460);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Gaussian LPF, freq = 460');
imshow(out);% Generate filter
