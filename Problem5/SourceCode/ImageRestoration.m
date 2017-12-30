close all;
clear;
clc;
%% ----------init-----------------------------
f = imread('../fig/book_cover.jpg');
f = mat2gray(f,[0 255]);

figure('Name', 'Original Figure');
imshow(f);

[M,N] = size(f);

P = M;
Q = N;
fc = zeros(M, N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

FFT_fc = fft2(fc, P, Q);
%% ------motion blur------------------
H = zeros(P,Q);
a = 0.1;
b = 0.1;
T = 1;
% Degradation Function
H = motionBlur(H, a, b, T);

HmultiplyFFT = H .* FFT_fc; 
gc1 = ifft2(HmultiplyFFT);

gc1 = gc1(1:1:M,1:1:N);
for x = 1:1:(M)
    for y = 1:1:(N)
        blurred(x,y) = real(gc1(x,y) .* (-1)^(x+y));
    end
end
blurred = blurred * 255;
figure('Name', '(b) Result of blurring using the function with a = b = 0.1 and T = 1');
imshow(blurred, []);

%% -----------noise------------------
a_gaussian = 0;
b_gaussian = sqrt(650);
n_gaussian = a_gaussian + b_gaussian .* randn(M,N);
blurredAndNoise = blurred + n_gaussian;

figure('Name', '(c) Add Gaussian noise of 0 mean and variance of 650 to the blurred image');
imshow(blurredAndNoise, []);
%% --------------inverse_filtering---------------------
F0 = fftshift(fft2(blurredAndNoise));
invFilt = invFilter(F0, H);

figure('Name', '(d) Inverse Filtering');
imshow(invFilt, []);
%% Wiener Filter £¨Self Defined)
K = 0.02;
f_Wiener = wienerFilter(K, H, F0);

figure('Name', '(e) Self defined Wiener Filter');
imshow(f_Wiener, []);

%% Noise 2 b_gaussian = sqrt(65);
a_gaussian = 0;
b_gaussian = sqrt(65);
n_gaussian = a_gaussian + b_gaussian .* randn(M,N);
blurredAndNoise = blurred + n_gaussian;

figure('Name', '(c) Add Gaussian noise of 0 mean and variance of 65 to the blurred image');
imshow(blurredAndNoise, []);
%% --------------inverse_filtering---------------------
F0 = fftshift(fft2(blurredAndNoise));
invFilt = invFilter(F0, H);

figure('Name', '(d) Inverse Filtering');
imshow(invFilt, []);
%% Wiener Filter £¨Self Defined)
K = 0.02;
f_Wiener = wienerFilter(K, H, F0);

figure('Name', '(e) Self defined Wiener Filter');
imshow(f_Wiener, []);

%% Noise 3 b_gaussian = sqrt(0.65);
a_gaussian = 0;
b_gaussian = sqrt(0.65);
n_gaussian = a_gaussian + b_gaussian .* randn(M,N);
blurredAndNoise = blurred + n_gaussian;

figure('Name', '(c) Add Gaussian noise of 0 mean and variance of 0.65 to the blurred image');
imshow(blurredAndNoise, []);
%% --------------inverse_filtering---------------------
F0 = fftshift(fft2(blurredAndNoise));
invFilt = invFilter(F0, H);

figure('Name', '(d) Inverse Filtering');
imshow(invFilt, []);
%% Wiener Filter £¨Self Defined)
K = 0.02;
f_Wiener = wienerFilter(K, H, F0);

figure('Name', '(e) Self defined Wiener Filter');
imshow(f_Wiener, []);


