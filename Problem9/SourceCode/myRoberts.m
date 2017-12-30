function newGrayPic = myRoberts( sourcePic )
%MYROBERTS 
grayPic=mat2gray(sourcePic); %ʵ��ͼ�����Ĺ�һ������
[m,n]=size(grayPic);
newGrayPic=grayPic;%Ϊ����ͼ��ı�Եһ������
% robertsNum=0; %��roberts���Ӽ���õ���ÿ�����ص�ֵ
robertThreshold=0.2; %�趨��ֵ
for j=1:m-1 %���б߽���ȡ
    for k=1:n-1
        robertsNum = abs(grayPic(j,k)-grayPic(j+1,k+1)) + abs(grayPic(j+1,k)-grayPic(j,k+1));
        if(robertsNum > robertThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
end

