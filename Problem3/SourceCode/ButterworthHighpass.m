%% Butterworth Highpass Filter
clear; clc; close all;
f = imread('../fig/characters_test_pattern.tif');
figure('Name','Original Image');
imshow(f);
f = double(f);
% 2-D fast Fourier transform
g = fft2(f);
% Shift zero-frequency component to center of spectrum
g = fftshift(g);
% figure('Name','Fourier Spectrum');
% imshow(log(1+abs(g)),[]);

% Lowpass filter
[M,N] = size(g);
nn = 2;  % 2-order Butterworth highpass filter
m = floor(M/2); n = floor(N/2);
d0 = 10;
for i=1:M
    for j=1:N
        d = sqrt((i-m)^2+(j-n)^2);
        % Calculate the transfer function of low pass filter
        h = 1/(1+(d0/d)^(2*nn));
        result(i,j)=h*g(i,j);
    end
end

% figure('Name','Butterworth Highpass Filter');
% imshow(log(1+abs(result)), []);
result = ifftshift(result);
J2 = ifft2(result);
J3 = uint8(real(J2));
figure('Name', 'Butterworth Highpass Filter, d0 = 10');
imshow(J3);

d0 = 30;
for i=1:M
    for j=1:N
        d = sqrt((i-m)^2+(j-n)^2);
        % Calculate the transfer function of low pass filter
        h = 1/(1+(d0/d)^(2*nn));
        result(i,j)=h*g(i,j);
    end
end

% figure('Name','Butterworth Highpass Filter');
% imshow(log(1+abs(result)), []);
result = ifftshift(result);
J2 = ifft2(result);
J3 = uint8(real(J2));
figure('Name', 'Butterworth Highpass Filter, d0 = 30');
imshow(J3);

d0 = 60;
for i=1:M
    for j=1:N
        d = sqrt((i-m)^2+(j-n)^2);
        % Calculate the transfer function of low pass filter
        h = 1/(1+(d0/d)^(2*nn));
        result(i,j)=h*g(i,j);
    end
end

% figure('Name','Butterworth Highpass Filter');
% imshow(log(1+abs(result)), []);
result = ifftshift(result);
J2 = ifft2(result);
J3 = uint8(real(J2));
figure('Name', 'Butterworth Highpass Filter, d0 = 60');
imshow(J3);

d0 = 160;
for i=1:M
    for j=1:N
        d = sqrt((i-m)^2+(j-n)^2);
        % Calculate the transfer function of low pass filter
        h = 1/(1+(d0/d)^(2*nn));
        result(i,j)=h*g(i,j);
    end
end

% figure('Name','Butterworth Highpass Filter');
% imshow(log(1+abs(result)), []);
result = ifftshift(result);
J2 = ifft2(result);
J3 = uint8(real(J2));
figure('Name', 'Butterworth Highpass Filter, d0 = 160');
imshow(J3);

d0 = 460;
for i=1:M
    for j=1:N
        d = sqrt((i-m)^2+(j-n)^2);
        % Calculate the transfer function of low pass filter
        h = 1/(1+(d0/d)^(2*nn));
        result(i,j)=h*g(i,j);
    end
end

% figure('Name','Butterworth Highpass Filter');
% imshow(log(1+abs(result)), []);
result = ifftshift(result);
J2 = ifft2(result);
J3 = uint8(real(J2));
figure('Name', 'Butterworth Highpass Filter, d0 = 460');
imshow(J3);





