%Laplacian, Second-Derivative
clear;clc;close all;
f = imread('../fig/skeleton_orig.tif');
figure('Name', 'Original Image')
imshow(f, []);

I=im2double(f);
[m,n,c]=size(I);
A1=zeros(m,n,c);
A2=zeros(m,n,c);
A3=zeros(m,n,c);
A4=zeros(m,n,c);
%g(x,y)=[f(x+1,y)+f(x-1,y)+f(x,y+1)+f(x,y-1)]-4f(x,y)
for i=2:m-1
    for j=2:n-1
        A1(i,j,1)=I(i+1,j,1)+I(i-1,j,1)+I(i,j+1,1)+I(i,j-1,1)-4*I(i,j,1);
    end
end
result1=I-A1;
figure('Name', 'Laplacian')
imshow(A1, []);
figure('Name', 'After Laplacian')
imshow(result1, []);

%g(x,y)=[f(x-1,y-1)+f(x,y+1)+f(x+1,y+1)+f(x-1,y)+f(x+1,y)+f(x-1,y-1)+f(x,y-1)+f(x+1,y-1)]-8f(x,y)
for i=2:m-1
    for j=2:n-1
        A2(i,j,1)=I(i-1,j-1,1)+I(i,j+1,1)+I(i+1,j+1,1)+I(i-1,j,1)+I(i+1,j,1)+I(i-1,j-1,1)+I(i,j-1,1)+I(i+1,j-1,1)-8*I(i,j,1);
    end
end
result2=I-A2;
figure('Name', 'Laplacian')
imshow(A2, []);
figure('Name', 'After Laplacian')
imshow(result2, []);

%g(x,y)=-[f(x+1,y)+f(x-1,y)+f(x,y+1)+f(x,y-1)]+4f(x,y)
for i=2:m-1
    for j=2:n-1
        A3(i,j,1)=-(I(i+1,j,1)+I(i-1,j,1)+I(i,j+1,1)+I(i,j-1,1)-4*I(i,j,1));
    end
end
result3=I-A3;
figure('Name', 'Laplacian')
imshow(A3, []);
figure('Name', 'After Laplacian')
imshow(result3, []);

%g(x,y)=-([f(x-1,y-1)+f(x,y+1)+f(x+1,y+1)+f(x-1,y)+f(x+1,y)+f(x-1,y-1)+f(x,y-1)+f(x+1,y-1)]-8f(x,y))
for i=2:m-1
    for j=2:n-1
        A4(i,j,1)=-(I(i-1,j-1,1)+I(i,j+1,1)+I(i+1,j+1,1)+I(i-1,j,1)+I(i+1,j,1)+I(i-1,j-1,1)+I(i,j-1,1)+I(i+1,j-1,1)-8*I(i,j,1));
    end
end
result4=I-A4;
figure('Name', 'Laplacian')
imshow(A4, []);
figure('Name', 'After Laplacian')
imshow(result4, []);