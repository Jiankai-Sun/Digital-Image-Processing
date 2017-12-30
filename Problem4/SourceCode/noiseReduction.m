%% Noise Reduction
clear; clc; close all;
f = imread('../fig/Circuit.tif');
figure('Name','Fig 5.7 (a) Original Image');
imshow(f);
title('Fig 5.7 (a) Original Image');

[M, N] = size(f);

% Investigate the different mean filters
% Gaussian Noise of 0 mean and variance of 400
gaussianNoise = imnoise2('gaussian', M, N, 0, 20);
applyGaussianNoise = double(f) + gaussianNoise; % Add noise
figure('Name','Fig 5.7 (b) Gaussian Noise of 0 mean and variance of 400');
imshow(applyGaussianNoise, []);
title('Fig 5.7 (b) Gaussian Noise of 0 mean and variance of 400');
% Arithmetic mean filter
ameanResult1 = spfilt(applyGaussianNoise, 'amean1', 3, 3);
figure('Name','Fig 5.7 (c1) Result of filtering with an arithmetic mean filter of size 3 x 3');
imshow(ameanResult1, []);
title('Fig 5.7 (c1) Result of filtering with an arithmetic mean filter of size 3 x 3');
% Self-defined arithmetic mean filter
ameanResult2 = spfilt(applyGaussianNoise, 'amean2', 3, 3);
figure('Name','Fig 5.7 (c2) Result of filtering with an self-defined arithmetic mean filter of size 3 x 3');
imshow(ameanResult2, []);
title('Fig 5.7 (c2) Result of filtering with an self-defined arithmetic mean filter of size 3 x 3');
% Result of filtering with a geometric mean filter of the same size
gmeanResult = spfilt(applyGaussianNoise, 'gmean', 3, 3);
figure('Name','Fig 5.7 (d) Result of filtering with a geometric mean filter of size 3 x 3');
imshow(gmeanResult, []);
title('Fig 5.7 (d) Result of filtering with a geometric mean filter of size 3 x 3');
% Image corrupted by pepper noise with a probability of 0.1
pepperNoise = imnoise2('salt & pepper', M, N, 0, 0.1);
applyPepperNoise = f;
applyPepperNoise(pepperNoise == 1) = 0;
figure('Name', 'Fig 5.8 (a) Image corrupted by pepper noise with a probability of 0.1');
imshow(applyPepperNoise, []);
title('Fig 5.8 (a) Image corrupted by pepper noise with a probability of 0.1');
% Image corrupted by salt noise with a probability of 0.1
saltNoise = imnoise2('salt & pepper', M, N, 0.1, 0);
applySaltNoise = f;
applySaltNoise(saltNoise == 0) = 225;
figure('Name', 'Fig 5.8 (b) Image corrupted by salt noise with a probability of 0.1');
imshow(applySaltNoise, []);
title('Fig 5.8 (b) Image corrupted by salt noise with a probability of 0.1');
% Result of filtering (a) with a 3 x 3 contraharmonic filter of order 1.5
chmeanPepperNoise = spfilt(applyPepperNoise, 'chmean', 3, 3, 1.5);
figure('Name','Fig 5.8 (c) Result of filtering (a) with a 3 x 3 contraharmonic filter of order 1.5');
imshow(chmeanPepperNoise, []);
title('Fig 5.8 (c) Result of filtering (a) with a 3 x 3 contraharmonic filter of order 1.5');
% Result of filtering (b) with Q = -1.5
chmeanSaltNoise = spfilt(applySaltNoise, 'chmean', 3, 3, -1.5);
figure('Name','Fig 5.8 (d) Result of filtering (b) with Q = -1.5');
imshow(chmeanSaltNoise, []);
title('Fig 5.8 (d) Result of filtering (b) with Q = -1.5');
% Result of filtering Fig. 5.8(a) with a contraharmonic filter of size 3 x
% 3 and Q = -1.5
chmeanPepperNoise = spfilt(applyPepperNoise, 'chmean', 3, 3, -1.5);
figure('Name','Fig 5.9 (a) Result of filtering Fig. 5.8(a) with a contraharmonic filter of size 3 x % 3 and Q = -1.5');
imshow(chmeanPepperNoise, []);
title('Fig 5.9 (a) Result of filtering Fig. 5.8(a) with a contraharmonic filter of size 3 x % 3 and Q = -1.5');
% Result of filtering Fig. 5.8(b) with a contraharmonic filter of size 3 x
% 3 and Q = 1.5
chmeanPepperNoise = spfilt(applySaltNoise, 'chmean', 3, 3, 1.5);
figure('Name','Fig 5.9 (b) Result of filtering Fig. 5.8(b) with a contraharmonic filter of size 3 x % 3 and Q = 1.5');
imshow(chmeanPepperNoise, []);
title('Fig 5.9 (b) Result of filtering Fig. 5.8(b) with a contraharmonic filter of size 3 x % 3 and Q = 1.5');

%% Order Statistics
% Image corrupted by salt-and-pepper noise with probabilities Pa = Pb = 0.1
saltPepperNoise = imnoise2('salt & pepper', M, N, 0.1, 0.1);
applySaltPepperNoise = f;
applySaltPepperNoise(saltPepperNoise == 0) = 225;
applySaltPepperNoise(saltPepperNoise == 1) = 0;
figure('Name', 'Fig 5.10 (a) Image corrupted by salt-and-noise with probabilities of Pa = Pb = 0.1');
imshow(applySaltPepperNoise, []);
title('Fig 5.10 (a) Image corrupted by salt-and-noise with probabilities of Pa = Pb = 0.1');

% Result of one pass with a median filter fo size 3 x 3
medianFilter1 = spfilt(applySaltPepperNoise, 'median1', 3, 3);
figure('Name','Fig 5.10 (b) Result of one pass with a median filter fo size 3 x 3');
imshow(medianFilter1, []);
title('Fig 5.10 (b) Result of one pass with a median filter fo size 3 x 3');

% Result of processing (b) with this filter
medianFilter2 = spfilt(medianFilter1, 'median1', 3, 3);
figure('Name','Fig 5.10 (c) Result of processing (b) with this filter');
imshow(medianFilter2, []);
title('Fig 5.10 (c) Result of processing (b) with this filter');
% Result of one pass with a median filter fo size 3 x 3
medianFilter3 = spfilt(medianFilter2, 'median1', 3, 3);
figure('Name','Fig 5.10 (d) Result of processing (c) with this filter');
imshow(medianFilter3, []);
title('Fig 5.10 (d) Result of processing (c) with this filter');
% Result of filtering Fig. 5.8 (a) with a max filter of size 3 x 3
maxFilter = spfilt(applyPepperNoise, 'max', 3, 3);
figure('Name','Fig 5.11 (a) Result of filtering Fig. 5.8 (a) with a max filter of size 3 x 3');
imshow(maxFilter, []);
title('Fig 5.11 (a) Result of filtering Fig. 5.8 (a) with a max filter of size 3 x 3');
% Result of filtering Fig. 5.8 (b) with a min filter of size 3 x 3
minFilter = spfilt(applySaltNoise, 'min', 3, 3);
figure('Name','Fig 5.11 (b) Result of filtering Fig. 5.8 (b) with a min filter of size 3 x 3');
imshow(minFilter, []);
title('Fig 5.11 (b) Result of filtering Fig. 5.8 (b) with a min filter of size 3 x 3');

% Image corrupted by additive uniform noise
uniformNoise = imnoise2('uniform', M, N, 0, sqrt(800));
applyUniformNoise = double(f) + uniformNoise;
figure('Name', 'Fig. 5.12 (a) Image corrupted by additive uniform noise');
imshow(applyUniformNoise, []);
title('Fig. 5.12 (a) Image corrupted by additive uniform noise');
% Image additionally corrupted by additive salt-and-pepper noise
applySaltAndPepperUniformNoise = applyUniformNoise;
applySaltAndPepperUniformNoise(saltPepperNoise == 0) = 225;
applySaltAndPepperUniformNoise(saltPepperNoise == 1) = 0;
figure('Name', 'Fig. 5.12 (b) Image additionally corrupted by additive salt-and-pepper noise');
imshow(applySaltAndPepperUniformNoise, []);
title('Fig. 5.12 (b) Image additionally corrupted by additive salt-and-pepper noise');

% Image (b) filtered with a 5 x 5 arithmetic mean filter
ameanResult3 = spfilt(applySaltAndPepperUniformNoise, 'amean2', 5, 5);
figure('Name','Fig. 5.12 (c) Image (b) filtered with a 5 x 5 arithmetic mean filter');
imshow(ameanResult3, []);
title('Fig. 5.12 (c) Image (b) filtered with a 5 x 5 arithmetic mean filter');
% Image (b) filtered with a 5 x 5 geometric mean filter
gmeanResult2 = spfilt(applySaltAndPepperUniformNoise, 'gmean', 5, 5);
figure('Name','Fig. 5.12 (d) Image (b) filtered with a 5 x 5 geometric mean filter');
imshow(gmeanResult2, []);
title('Fig. 5.12 (d) Image (b) filtered with a 5 x 5 geometric mean filter');
% Image (b) filtered with a 5 x 5 median filter
medianResult = spfilt(applySaltAndPepperUniformNoise, 'median1', 5, 5);
figure('Name','Fig. 5.12 (e) Image (b) filtered with a 5 x 5 median filter');
imshow(medianResult, []);
title('Fig. 5.12 (e) Image (b) filtered with a 5 x 5 median filter');
% Image (b) filtered with a 5 x 5 alpha-trimmed mean filter with d = 5
atrimmedResult = spfilt(applySaltAndPepperUniformNoise, 'atrimmed', 5, 5, 5);
figure('Name','Fig. 5.12 (f) Image (b) filtered with a 5 x 5 alpha-trimmed mean filter with d = 5');
imshow(atrimmedResult, []);
title('Fig. 5.12 (f) Image (b) filtered with a 5 x 5 alpha-trimmed mean filter with d = 5');
%% Fig 5.13
gaussianNoise2 = imnoise2('gaussian', M, N, 0, sqrt(1000));
applyGaussianNoise2 = double(f) + gaussianNoise2;
figure('Name','Fig. 5.13 (a) Image corrupted by additive Gaussian noise of zero mean and variance 1000');
imshow(applyGaussianNoise2, []);
title('Fig. 5.13 (a) Image corrupted by additive Gaussian noise of zero mean and variance 1000');
% Fig 5.13 (b) Result of arithmetric mean filtering
ameanResult4 = spfilt(applyGaussianNoise2, 'amean1', 7, 7);
figure('Name','Fig 5.13 (b) Result of arithmetric mean filtering');
imshow(ameanResult4, []);
title('Fig 5.13 (b) Result of arithmetric mean filtering');
% Fig 5.13 (c) Result of geometric mean filtering
gmeanResult3 = spfilt(applyGaussianNoise2, 'gmean', 7, 7);
figure('Name','Fig 5.13 (c) Result of geometric mean filtering');
imshow(gmeanResult3, []);
title('Fig 5.13 (c) Result of geometric mean filtering');
% Fig 5.13 (d) Result of adaptive noise reduction filtering
adaptiveNoiseReductionFilterResult = adaptiveNoiseReductionFilter(applyGaussianNoise2, [7 7]);
figure('Name','Fig 5.13 (d) Result of adaptive noise reduction filtering');
imshow(adaptiveNoiseReductionFilterResult, []);
title('Fig 5.13 (d) Result of adaptive noise reduction filtering');

%% Fig 5.14
% Fig 5.14 (a) Image corrupted by salt-and-pepper noise with probabilites
% Pa = Pb = 0.25
saltPepperNoise2 = imnoise2('salt & pepper', M, N, 0.25, 0.25);
applySaltPepperNoise2 = f;
applySaltPepperNoise2(saltPepperNoise2 == 0) = 225;
applySaltPepperNoise2(saltPepperNoise2 == 1) = 0;
figure('Name', 'Fig 5.14 (a) Image corrupted by salt-and-pepper noise with probabilites');
imshow(applySaltPepperNoise2, []);
title('Fig 5.14 (a) Image corrupted by salt-and-pepper noise with probabilites');
% Fig 5.14 (b) Result of filtering with a 7 x 7 median filter
medianFilter4 = spfilt(applySaltPepperNoise2, 'median1', 7, 7);
figure('Name','Fig 5.14 (b) Result of filtering with a 7 x 7 median filter');
imshow(medianFilter4, []);
title('Fig 5.14 (b) Result of filtering with a 7 x 7 median filter');
% Fig 5.14 (c) Result of adaptive median filtering with Smax = 7
adpResult = adpmedian(applySaltPepperNoise2, 7);
figure('Name','Fig 5.14 (c) Result of adaptive median filtering with Smax = 7');
imshow(adpResult, []);
title('Fig 5.14 (c) Result of adaptive median filtering with Smax = 7');