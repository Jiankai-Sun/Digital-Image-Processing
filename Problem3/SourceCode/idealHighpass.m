%% Ideal High Filter
clear; clc; close all;
I = imread('../fig/characters_test_pattern.tif');

figure('Name', 'Origin Image');
imshow(I);

% Generate filter
ff = idealHighpassFilter(I, 10);
% Apply filter
out = imfreqfilt(I, ff);

% Calculate Fast Fourier Transform and display
% temp = fft2(double(I));
% temp = fftshift(temp);
% temp = log(1+abs(temp));
% figure(2);
% subplot(2,2,1);
% imshow(temp, []);
% title('Source');

figure('Name', 'Ideal HPF, freq = 10');
imshow(out);

% Calculate Fast Fourier Transform and display
% temp = fft2(out);
% temp = fftshift(temp);
% temp = log(1+abs(temp));
% figure(2);
% subplot(2,2,2);
% imshow(temp, []);
% title('Ideal HPF, freq = 20');

%%
% Generate filter
ff = idealHighpassFilter(I, 30);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Ideal HPF, freq = 30');
imshow(out);

% Calculate Fast Fourier Transform and display
% temp = fft2(out);
% temp = fftshift(temp);
% temp = log(1+abs(temp));
% figure(2);
% subplot(2,2,3);
% imshow(temp, []);
% title('Ideal HPF, freq = 40');
%%
% Generate filter
ff = idealHighpassFilter(I, 60);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Ideal HPF, freq = 60');
imshow(out);

% Calculate Fast Fourier Transform and display
% temp = fft2(out);
% temp = fftshift(temp);
% temp = log(1+abs(temp));
% figure(2);
% subplot(2,2,4);
% imshow(temp, []);
% title('Ideal HPF, freq = 60');
%%
% Generate filter
ff = idealHighpassFilter(I, 160);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Ideal HPF, freq = 160');
imshow(out);
%%
% Generate filter
ff = idealHighpassFilter(I, 460);
% Apply filter
out = imfreqfilt(I, ff);

figure('Name', 'Ideal HPF, freq = 460');
imshow(out);
