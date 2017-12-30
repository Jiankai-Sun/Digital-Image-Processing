close all; clc; clear;
% Input
% f1 = imread('../fig/Fig1.jpg');
f1 = imread('../fig/Fig2.jpg');
[height, width] = size(f1);
% Show the input images
figure('Name', 'Fig1');
imshow(f1);
% Question(a): Compute the Histogram
figure('Name', 'Compute the Histogram of Fig1');
imhist(f1);
%% Question(a): Computing the Histogram
% Perform pixel grayscale statistics
s = zeros(1, 256); % each grayscale is 256
for i = 1:height
    for j = 1:width
        s(f1(i,j)+1) = s(f1(i,j)+1)+1;
    end
end

figure('Name', 'Computing the Histogram');
bar(s)
xlim([0 256])
% ylim([0 16000])

%% Question(b): Implement the histogram equalization technique.
% Calculate grayscale distribution density
p = zeros(1, 256);
for i = 1:256
    p(i) = s(i) / (height * width * 1.0);
end

% Calculate the cumulative histogram distribution
c = zeros(1, 256);
c(1) = p(1);
for i = 2:256
    c(i) = c(i - 1) + p(i);
end

% Cumulative histogram distribution is normalized from 0 to 255
c = uint8(255 .* c);

figure('Name', 'Transform Function'), plot(0:255, c), xlim([0,255]);

% Equalization 
for i = 1:height
    for j = 1:width
        f1(i,j) = c(f1(i,j)+1);
    end
end
% Show the image after histogram normalization
figure('Name', 'Histogram Equalization for Fig1');
imshow(f1, []);
% Show the updated histogram
figure('Name', 'Histogram of Fig1 after Histogram Equalization');
% imhist(f1);
% Perform pixel grayscale statistics
s = zeros(1, 256); % each grayscale is 256
for i = 1:height
    for j = 1:width
        s(f1(i,j)+1) = s(f1(i,j)+1)+1;
    end
end

bar(s)
xlim([0 256])
