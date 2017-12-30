%% nearest neighbor 
close all;
clear;
clc;
%% ----------init-----------------------------
img = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(img);
H = 1;   %索引pix中第一个元素，即高度
W = 2;   %索引pix中第二个元素，即宽度
angle = 45;
[h, w] = size(img);

theta = angle / 180 * pi;
rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
inv_rot = inv(rot);
pix1 = [1 1 1] * rot;   %变换后图像左上点的坐标
pix2 = [1 w 1] * rot;   %变换后图像右上点的坐标
pix3 = [h 1 1] * rot;   %变换后图像左下点的坐标
pix4 = [h w 1] * rot;   %变换后图像右下点的坐标

height = round(max([abs(pix1(H) - pix4(H)) + 0.5 abs(pix2(H) - pix3(H)) + 0.5])); %变换后图像的高度
width = round(max([abs(pix1(W) - pix4(W)) + 0.5 abs(pix2(W) - pix3(W)) + 0.5]));  %变换后图像的宽度
imgn = zeros(height, width);

delta_y = abs(min([pix1(H) pix2(H) pix3(H) pix4(H)]));  %取得y方向的负轴超出的偏移量
delta_x = abs(min([pix1(W) pix2(W) pix3(W) pix4(W)]));  %取得x方向的负轴超出的偏移量

for i = 1-delta_y : height-delta_y
    for j = 1-delta_x : width - delta_x
        pix = [i j 1] * inv_rot;
        
        float_Y = pix(1) - floor(pix(1));
        float_X = pix(2) - floor(pix(2));
        
        if pix(1) >= 1 && pix(2) >= 1 && pix(1) <= h && pix(2) <= w
            pix_up_left = [floor(pix(1)) floor(pix(2))];  %四个相邻的点
            pix_up_right = [floor(pix(1)) ceil(pix(2))];
            pix_down_left = [ceil(pix(1)) floor(pix(2))];
            pix_down_right = [ceil(pix(1)) ceil(pix(2))];
            
            value_up_left = (1 - float_X) * (1 - float_Y);  %计算临近四个点的权重
            value_up_right = float_X * (1 - float_Y);
            value_down_left = (1 - float_X) * float_Y;
            value_down_right = float_X * float_Y;
            
            imgn(i + delta_y, j + delta_x) = value_up_left * img(pix_up_left(1), pix_up_left(2)) + ...
                value_up_right * img(pix_up_right(1), pix_up_right(2)) + ...
                value_down_left * img(pix_down_left(1), pix_down_left(2)) + ...
                value_down_right * img(pix_down_right(1), pix_down_right(2));
        end            
    end
end
figure('Name', 'Rotate with self-defined function');
imshow(imgn,[]);

