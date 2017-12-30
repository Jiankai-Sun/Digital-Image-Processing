function [J I]=laplacian(I)
[height,width]=size(I);
J=zeros(height,width);
M = padarray(I,[1 1],'replicate');   %填充图像‘replicate’
M=double(M);                         %laplacian操作
for i=2:height+1
    for j=2:width+1
        J(i-1,j-1)=8*M(i,j)-M(i-1,j-1)-M(i-1,j)-M(i-1,j+1)-M(i,j-1)-M(i,j+1)-M(i+1,j-1)-M(i+1,j)-M(i+1,j+1);
        I(i-1,j-1)=J(i-1,j-1)+M(i,j);
    end
end
J=J-min(J(:));                      %拉普拉斯锐化后的结果
J=255.*(J./max(J(:)));
I=uint8(I);
J=uint8(J);
    