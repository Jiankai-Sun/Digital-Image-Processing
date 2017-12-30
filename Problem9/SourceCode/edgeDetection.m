close all;clear;clc; 
img= imread('../fig/building.tif'); 
figure('Name','Original Image');
imshow(img);
title('Original Image'); 

Roberts = myRoberts(img);
figure('Name', 'Roberts Edge Detector');
imshow(Roberts);
title('Roberts Edge Detector');  

Sobel = mySobel(img);
figure('Name', 'Sobel Edge Detector');
imshow(Sobel);
title('Sobel Edge Detector');

Prewitt = myPrewitt(img);
figure,imshow(Prewitt);
title('Prewitt Edge Detector');

MarrHildreth = myMarrHildreth(img, 4);
% MarrHildreth = myMarrHildreth2(img);
figure('Name','MarrHildreth Edge Detector');
imshow(MarrHildreth);
title('MarrHildreth Edge Detector');

% [m, theta, sector, canny1, canny2, Canny ] = myCanny5(img, 50);
% Canny = myCanny2(img);
% Canny = myCanny3(img);
Canny = myCanny(img);
figure('Name', 'Canny Edge Detector');
imshow(Canny);
title('Canny Edge Detector');