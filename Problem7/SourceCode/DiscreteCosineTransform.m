%程序功能：模拟DCT编码解码过程，生成带“块效应”的图像  
%步骤：灰度图像→DCT→量化→反量化→IDCT 

close all;clear;clc; 
img= imread('../fig/lenna.tif'); 
figure(1);imshow(img);title('Original Image'); 
%I1=rgb2gray(I);figure(1);imshow(I1);title('原始图像');%变成灰度图像，并显示 
doubleImg=im2double(img);%变换前的原始数据
 
C= dctmtx(8);%生成标准DCT变化中的矩阵（8×8）
% DCT变换公式: 正变换:Y=CPC';逆变换:P=C'YC; 
% 光亮度量化表 
a1=[16 11 10 16 24  40  51  61; 
    12 12 14 19 26  58  60  55; 
    14 13 16 24 40  57  69  56; 
    14 17 22 29 51  87  80  62; 
    18 22 37 56 68  109 103 77; 
    24 35 55 64 81  104 113 92; 
    49 64 78 87 103 121 120 101; 
    72 92 95 98 112 100 103 99 ]; 
 
%分块做DCT变换（8×8） 
for i=1:8:512 
    for j=1:8:512 
        P=doubleImg(i:i+7,j:j+7); 
        K=C*P*C'; 
        afterDCT(i:i+7,j:j+7)=K; 
        K=K./a1;%量化 
        K(abs(K)<0.03)=0; 
        qualified(i:i+7,j:j+7)=K; 
    end 
end 
figure;imshow(afterDCT);title('DCT变换后的频域图像');%显示DCT变换后的频域图像 
 
%分块做DCT反变换（8×8） 
for i=1:8:512 
    for j=1:8:512 
        P=qualified(i:i+7,j:j+7).*a1;%反量化 
        K=C'*P*C; 
        reconstructed(i:i+7,j:j+7)=K; 
    end 
end 
figure;
imshow(reconstructed);title('The Reconstructed Image'); 
imwrite(reconstructed,'ReconstructedImage.jpg');

figure;
imshow(abs(reconstructed-doubleImg),[]);title('The Difference Image');