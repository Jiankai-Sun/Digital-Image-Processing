function [J I]=laplacian(I)
[height,width]=size(I);
J=zeros(height,width);
M = padarray(I,[1 1],'replicate');   %���ͼ��replicate��
M=double(M);                         %laplacian����
for i=2:height+1
    for j=2:width+1
        J(i-1,j-1)=8*M(i,j)-M(i-1,j-1)-M(i-1,j)-M(i-1,j+1)-M(i,j-1)-M(i,j+1)-M(i+1,j-1)-M(i+1,j)-M(i+1,j+1);
        I(i-1,j-1)=J(i-1,j-1)+M(i,j);
    end
end
J=J-min(J(:));                      %������˹�񻯺�Ľ��
J=255.*(J./max(J(:)));
I=uint8(I);
J=uint8(J);
    