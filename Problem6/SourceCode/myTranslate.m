close all;
clear;
clc;
%% ----------init-----------------------------
f = imread('../fig/ray_trace_bottle.tif');

figure('Name', 'Original Figure');
imshow(f);
[R, C] = size(f);

result = zeros(R, C);  % ����������ÿ�����ص�Ĭ�ϳ�ʼ��Ϊ0����ɫ��
delX = 50; % ƽ����X
delY = 50; % ƽ����Y
tras = [1 0 delX; 0 1 delY; 0 0 1];  % ƽ�Ƶı任���� 

for i = 1:R
    for j = 1:C
        temp = [i; j; 1];
        temp = tras * temp;  % ����˷�
        x = temp(1, 1);
        y = temp(2, 1);
        % �任���λ���ж��Ƿ�Խ��
        if (x <= R) && (y <= C) && (x >= 1) && (y >= 1)
            result(x, y) = f(i,j);
        end
    end
end

figure('Name', 'After Translation');
imshow(result,[]);