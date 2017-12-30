close all;clear;clc; 
bw= imread('../fig/Fig0929(a).tif'); 
figure('Name','Fig 9.29 Text image of size 918 x 2018 pixels');
imshow(bw);
title('Fig 9.29 Text image of size 918 x 2018 pixels'); 
% Suppose we want to identify characters containing a tall vertical segment. We can do this by opening with a vertical structuring element. Erode first:
% se = strel(ones(51, 1));
%bw2 = imerode(bw, se);
se = ones(51, 1);
bw2 = myErode(bw, se);
figure('Name','(b) Erosion of (a) with a structuring element of size 51x1 pixels.');
imshow(bw2);
% save bw2;
% Do the opening in a single step, self-defined opening function.
% bw3 = imopen(bw, se);
bw3 = myImOpen(bw, se);
figure('Name','(c) Opening of (a) with the same structuring element, shown for reference');
imshow(bw3);
% Use the original text image as our reconstruction mask.
mask=bw;
% characters1=imreconstruct(bw2, mask);
% Self defined reconstruction function
characters2=myReconstruction(bw2, mask);
figure('Name','(d) Result of opening by reconstruction');
imshow(characters2);
t = 'It takes a long time, Please wait ... '
title('(d) Result of opening by reconstruction');
% figure('Name','Difference between MatLab `imreconstruct` and Self-defined reconstruction function');
% imshow(characters2-characters1, []);