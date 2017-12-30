close all;
clear;
clc;
%% ----------init-----------------------------
f = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(f);
[R, C] = size(f);

result = zeros(R, C);  % 构造结果矩阵。每个像素点默认初始化为0（黑色）
delX = 50; % 平移量X
delY = 50; % 平移量Y
tras = [1 0 delX; 0 1 delY; 0 0 1];  % 平移的变换矩阵 

for i = 1:R
    for j = 1:C
        temp = [i; j; 1];
        temp = tras * temp;  % 矩阵乘法
        x = temp(1, 1);
        y = temp(2, 1);
        % 变换后的位置判断是否越界
        if (x <= R) && (y <= C) && (x >= 1) && (y >= 1)
            result(x, y) = f(i,j);
        end
    end
end

figure('Name', 'After Translation');
imshow(result,[]);