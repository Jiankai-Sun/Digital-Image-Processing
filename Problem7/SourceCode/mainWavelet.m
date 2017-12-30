close all;clear;clc; 
img= imread('../fig/lenna.tif'); 
figure;imshow(img);title('Original Image'); 
%% Haar
[c, s] = wavefast(img, 3, 'haar');
wavedisplay(c, s, 20);
[~, g8] = wavezero(c, s, 3, 'haar');
figure;imshow(g8);title('Reconstructed image from Haar'); 
figure;imshow((img - g8), []); title('The difference images of Haar');
%% Daubechies
[c, s] = wavefast(img, 3, 'db4');
wavedisplay(c, s, 20);
[~, g8] = wavezero(c, s, 3, 'db4');
figure;imshow(g8);title('Reconstructed image from Daubechies'); 
figure;imshow((img - g8), []); title('The difference images of Daubechies');
%% Symlet
[c, s] = wavefast(img, 3, 'sym4');
wavedisplay(c, s, 20);
[~, g8] = wavezero(c, s, 3, 'sym4');
figure;imshow(g8);title('Reconstructed image from Symlet'); 
figure;imshow((img - g8), []); title('The difference images of Symlet');
%% Cohen-Daubechies-Feauveau
[c, s] = wavefast(img, 3, 'bior6.8');
wavedisplay(c, s, 20);
[~, g8] = wavezero(c, s, 3, 'bior6.8');
figure;imshow(g8);title('Reconstructed image from biorthogonal Cohen-Daubechies-Feauveau'); 
figure;imshow((img - g8), []); title('The difference images of biorthogonal Cohen-Daubechies-Feauveau');
