clear all;
close all;
I=imread('../fig/skeleton_orig.tif');
%������˹�񻯺�Ľ����ԭͼ���
figure;                              
[J1 J2]=laplacian(I);
imshow(I);
figure;
imshow(J1);
figure;
imshow(J2);
%sobel���Ӵ���
J3=sobel(I);                       
figure;
imshow(J3);
%��5 5���ľ�ֵ�˲���
J4=meanfilter(J3,5,5);               
figure;
imshow(J4);
%��ͼ������γɵ���Ĥͼ��
J2=double(J2);                      
J4=double(J4);
J5=J2.*J4;
J5=J5-min(J5(:));                     
J5=255.*(J5./max(J5(:)));
J5=uint8(J5);
figure;
imshow(J5);
%��ͼ������γɵ���Ĥͼ��
I=double(I);                      
J5=double(J5);
J6=J5+I;
J6=J6-min(J6(:));                     
J6=255.*(J6./max(J6(:)));
J6=uint8(J6);
figure;
imshow(J6);
%ʹ�����ɱ任 r=0.5 c=1
J7=double(J6);                   
J7=J7.^0.5;
J7=J7-min(J7(:));                     
J7=255.*(J7./max(J7(:)));
J7=uint8(J7);
figure
imshow(J7)
