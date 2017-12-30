%% Generate noise
clear; clc; close all;
f = imread('../fig/Fig0503.tif');
figure('Name','Original Image');
imshow(f);
title('Original Image');

[M, N] = size(f);
% Uniform Noise
uniformNoise = imnoise2('uniform', M, N, 0, 200);
applyUniformNoise = double(f)+uniformNoise; % Add noise and convert to uint 8
figure('Name','Self-defined Uniform Noise');
imshow(applyUniformNoise, []);
title('Self-defined Uniform Noise');

% Gaussian Noise
gaussianNoise = imnoise2('gaussian', M, N, 0, 20);
applyGaussianNoise = double(f) + gaussianNoise; % Add noise
figure('Name','Self-defined Gaussian Noise');
imshow(applyGaussianNoise, []);
title('Self-defined Gaussian Noise');
% y2 = imnoise(f, 'gaussian', 0, 0.01); % Add noise with MatLab ToolBox
% figure('Name','MatLab ToolBox Gaussian Noise');
% imshow(y2);

% Rayleigh Noise
rayleighNoise = imnoise2('rayleigh', M, N, 0, 1000);
applyRayleighNoise = double(f)+rayleighNoise; % Add noise and convert to uint 8
figure('Name','Self-defined Rayleigh Noise');
imshow(applyRayleighNoise, []);
title('Self-defined Rayleigh Noise');

% Erlang (Gamma) Noise
erlangNoise = imnoise2('erlang', M, N, 0.05, 4);
applyErlangNoise = double(f)+erlangNoise; % Add noise and convert to uint 8
figure('Name','Self-defined Erlang Noise');
imshow(applyErlangNoise, []);
title('Self-defined Erlang(Gamma) Noise');

% Exponential Noise
exponentialNoise = imnoise2('exponential', M, N, 0.05);
applyExponentialNoise = double(f)+exponentialNoise; % Add noise and convert to uint 8
figure('Name','Self-defined Exponential Noise');
imshow(applyExponentialNoise, []);
title('Self-defined Exponential Noise');

% Salt & Pepper Noise
saltAndPepperNoise = imnoise2('salt & pepper', M, N, 0.1, 0);
gp = f;
gp(saltAndPepperNoise == 0) = 225;
figure('Name', 'Salt noise = 0.1');
imshow(gp, []);
title('Salt noise = 0.1');

% Image corrupted by pepper noise with a probability of 0.1
pepperNoise = imnoise2('salt & pepper', M, N, 0, 0.1);
applyPepperNoise = f;
applyPepperNoise(pepperNoise == 1) = 0;
figure('Name', 'Fig 5.8 (a) Image corrupted by pepper noise with a probability of 0.1');
imshow(applyPepperNoise, []);
title('Fig 5.8 (a) Image corrupted by pepper noise with a probability of 0.1');

% Lognormal Noise
% lognormalNoise = imnoise2('lognormal', M, N, 0, 3);
% applyLognormalNoise = double(f)+lognormalNoise; % Add noise and convert to uint 8
% figure('Name','Self-defined Lognormal Noise');
% imshow(applyLognormalNoise, []);


