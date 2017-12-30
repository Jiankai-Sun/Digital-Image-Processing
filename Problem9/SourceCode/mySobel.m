function newGrayPic = mySobel( sourcePic )
%MYSOBEL �˴���ʾ�йش˺�����ժҪ
grayPic=mat2gray(sourcePic);%ʵ��ͼ�����Ĺ�һ������
[m,n]=size(grayPic);
newGrayPic=grayPic;%Ϊ����ͼ��ı�Եһ������
% sobelNum=0;%��sobel���Ӽ���õ���ÿ�����ص�ֵ
sobelThreshold=0.8;%�趨��ֵ
for j=2:m-1 %���б߽���ȡ
    for k=2:n-1
        sobelNum=abs(grayPic(j-1,k+1)+2*grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-2*grayPic(j,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k-1)+2*grayPic(j-1,k)+grayPic(j-1,k+1)-grayPic(j+1,k-1)-2*grayPic(j+1,k)-grayPic(j+1,k+1));
        if(sobelNum > sobelThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
end

