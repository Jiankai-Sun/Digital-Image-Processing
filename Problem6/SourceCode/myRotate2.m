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
[v, u] = size(img);

theta = angle / 180 * pi;
rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
inv_rot = inv(rot);
pix1 = [1 1 1] * rot;   %变换后图像左上点的坐标
pix2 = [1 u 1] * rot;   %变换后图像右上点的坐标
pix3 = [v 1 1] * rot;   %变换后图像左下点的坐标
pix4 = [v u 1] * rot;   %变换后图像右下点的坐标

height = round(max([abs(pix1(H) - pix4(H)) + 0.5 abs(pix2(H) - pix3(H)) + 0.5])); %变换后图像的高度
width = round(max([abs(pix1(W) - pix4(W)) + 0.5 abs(pix2(W) - pix3(W)) + 0.5]));  %变换后图像的宽度
imgn = zeros(height, width);

delta_y = abs(min([pix1(H) pix2(H) pix3(H) pix4(H)]));  %取得y方向的负轴超出的偏移量
delta_x = abs(min([pix1(W) pix2(W) pix3(W) pix4(W)]));  %取得x方向的负轴超出的偏移量

for y = 1-delta_y : height-delta_y
    for x = 1-delta_x : width - delta_x
        pix = [y x 1] * inv_rot;
        
        if pix(H) >= 0.5 && pix(W) >= 0.5 && pix(H) <= v && pix(W) <= u
            imgn(y+delta_y, x+delta_x) = img(round(pix(H)), round(pix(W)));
        end
    end
end
figure('Name', 'Rotate with self-defined function');
imshow(imgn,[]);

                
            

