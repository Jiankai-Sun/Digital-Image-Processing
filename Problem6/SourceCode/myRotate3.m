%% nearest neighbor 
close all;
clear;
clc;
%% ----------init-----------------------------
img = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(img);
H = 1;   %����pix�е�һ��Ԫ�أ����߶�
W = 2;   %����pix�еڶ���Ԫ�أ������
angle = 45;
[h, w] = size(img);

theta = angle / 180 * pi;
rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
inv_rot = inv(rot);
pix1 = [1 1 1] * rot;   %�任��ͼ�����ϵ������
pix2 = [1 w 1] * rot;   %�任��ͼ�����ϵ������
pix3 = [h 1 1] * rot;   %�任��ͼ�����µ������
pix4 = [h w 1] * rot;   %�任��ͼ�����µ������

height = round(max([abs(pix1(H) - pix4(H)) + 0.5 abs(pix2(H) - pix3(H)) + 0.5])); %�任��ͼ��ĸ߶�
width = round(max([abs(pix1(W) - pix4(W)) + 0.5 abs(pix2(W) - pix3(W)) + 0.5]));  %�任��ͼ��Ŀ��
imgn = zeros(height, width);

delta_y = abs(min([pix1(H) pix2(H) pix3(H) pix4(H)]));  %ȡ��y����ĸ��ᳬ����ƫ����
delta_x = abs(min([pix1(W) pix2(W) pix3(W) pix4(W)]));  %ȡ��x����ĸ��ᳬ����ƫ����

for i = 1-delta_y : height-delta_y
    for j = 1-delta_x : width - delta_x
        pix = [i j 1] * inv_rot;
        
        float_Y = pix(1) - floor(pix(1));
        float_X = pix(2) - floor(pix(2));
        
        if pix(1) >= 1 && pix(2) >= 1 && pix(1) <= h && pix(2) <= w
            pix_up_left = [floor(pix(1)) floor(pix(2))];  %�ĸ����ڵĵ�
            pix_up_right = [floor(pix(1)) ceil(pix(2))];
            pix_down_left = [ceil(pix(1)) floor(pix(2))];
            pix_down_right = [ceil(pix(1)) ceil(pix(2))];
            
            value_up_left = (1 - float_X) * (1 - float_Y);  %�����ٽ��ĸ����Ȩ��
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

