%% bilinear interpolation & nearest neighbor
close all;
clear;
clc;
%% ----------init-----------------------------
f = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(f);

Img = double(f);
[h, w] = size(Img);
alpha = pi/4;  % The Angle of rotation counterclockwise

w_new = ceil(w * cos(alpha) + h * sin(alpha));
h_new = ceil(w * sin(alpha) + h * cos(alpha));

u0 = w * sin(alpha);  % translation amount
T = [cos(alpha), sin(alpha); -sin(alpha), cos(alpha)];
Img_new2 = zeros(h_new, w_new);
Img_new1 = zeros(h_new, w_new);
for u = 1: h_new
    for v = 1: w_new
        tem = T * ([u; v] - [u0; 0]);
        x = tem(1);
        y = tem(2);
        if x>=1 && x <= h && y>=1 && y<=w  %若变换出的x和y在原图像范围内
            x_low = floor(x);
            x_up = ceil(x);
            y_low = floor(y);
            y_up = ceil(y);
            if(x - x_low) <= (x_up - x)  %采用最近点法，选取距离最近点的像素赋给新图像
                x = x_low;
            else
                x = x_up;
            end
            
            if(y-y_low) <= (y_up - y)
                y = y_low;
            else
                y = y_up;
            end
            %双线性插值，p1到p4是（x,y）周围的四个点
            p1 = Img(x_low, y_low);
            p2 = Img(x_up, y_low);
            p3 = Img(x_low, y_low);
            p4 = Img(x_up, y_up);
            s = x - x_low;
            t = y - y_low;
            Imgnew1(u,v) = Img(x,y);
            Imgnew2(u,v) = (1-s)*(1-t)*p1 + (1-s)*t*p3 + (1-t)*s*p2 + s*t*p4;
        end
    end
end
figure('Name', 'Rotate with self-defined Nearest Neighbor Interpolation function');
imshow(Imgnew1,[]);
figure('Name', 'Rotate with self-defined Bilinear Interpolation function');
imshow(Imgnew2,[]);
B = imrotate(Img, alpha/pi*180);
figure('Name', 'Rotate with MATLAB function imrotate');
imshow(B, []);
