% Input
f1 = imread('../fig/Fig1.jpg');
f2 = imread('../fig/Fig2.jpg');
% Show the input images
figure('Name', 'Fig1');
imshow(f1);
figure('Name', 'Fig2');
imshow(f2);
% Question(a): Compute the Histogram
figure('Name', 'Compute the Histogram of Fig1');
imhist(f1);
figure('Name', 'Compute the Histogram of Fig2');
imhist(f2);
% Question(b): Implement the histogram equalization technique.
histeqF1 = histeq(f1,256);
figure('Name', 'Histogram Equalization for Fig1');
imshow(histeqF1);
figure('Name', 'Histogram of Fig1 after Histogram Equalization');
imhist(histeqF1);
histeqF2 = histeq(f2,256);
figure('Name', 'Histogram Equalization for Fig2');
imshow(histeqF2);
figure('Name', 'Histogram of Fig2 after Histogram Equalization');
imhist(histeqF2);
