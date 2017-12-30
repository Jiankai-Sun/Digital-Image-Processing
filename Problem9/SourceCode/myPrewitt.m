function newGrayPic = myPrewitt( sourcePic )
%MYPREWITT 此处显示有关此函数的摘要
grayPic=mat2gray(sourcePic);%实现图像矩阵的归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;%为保留图像的边缘一个像素
% PrewittNum=0;%经Prewitt算子计算得到的每个像素的值
PrewittThreshold=0.5;%设定阈值
for j=2:m-1 %进行边界提取
    for k=2:n-1
        PrewittNum=abs(grayPic(j-1,k+1)-grayPic(j+1,k+1)+grayPic(j-1,k)-grayPic(j+1,k)+grayPic(j-1,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k+1)+grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-grayPic(j,k-1)-grayPic(j+1,k-1));
        if(PrewittNum > PrewittThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
end