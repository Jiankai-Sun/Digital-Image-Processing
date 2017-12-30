% bilinear interpolation
close all;
clear;
clc;
%% ----------init-----------------------------
img = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(img);
% parameters
m = 2;
n = 4;

[h, w] = size(img);
imgn = zeros(floor(h * m), floor(w * n));
rot = [m 0 0; 0 n 0; 0 0 1];  % Transform Matrix
for i = 1 : h*m
    for j = 1 : w*n
        pix = [i j 1] / rot;
        float_Y = pix(1) - floor(pix(1));
        float_X = pix(2) - floor(pix(2));
        %边界处理
        if pix(1) < 1
            pix(1) = 1;
        end
        
        if pix(1) > h
            pix(1) = h;
        end
        
        if pix(2) < 1
            pix(2) = 1;
        end
        
        if pix(2) > w
            pix(2) = w;
        end
        
        pix_up_left = [floor(pix(1)) floor(pix(2))];  %四个相邻的点
        pix_up_right = [floor(pix(1)) ceil(pix(2))];
        pix_down_left = [ceil(pix(1)) floor(pix(2))];
        pix_down_right = [ceil(pix(1)) ceil(pix(2))];
        
        value_up_left = (1 - float_X) * (1 - float_Y);  %计算临近四个点的权重
        value_up_right = float_X * (1 - float_Y);
        value_down_left = (1 - float_X) * float_Y;
        value_down_right = float_X * float_Y;
        %按权重进行双线性插值 bilinear interpolation
        imgn(i, j) = value_up_left * img(pix_up_left(1), pix_up_left(2)) + ...
            value_up_right * img(pix_up_right(1), pix_up_right(2)) + ...
            value_down_left * img(pix_down_left(1), pix_down_left(2)) + ...
            value_down_right * img(pix_down_right(1), pix_down_right(2));
    end
end
      
figure('Name', 'Scale with self-defined function');
imshow(imgn, []);
