function newGrayPic = myPrewitt( sourcePic )
%MYPREWITT �˴���ʾ�йش˺�����ժҪ
grayPic=mat2gray(sourcePic);%ʵ��ͼ�����Ĺ�һ������
[m,n]=size(grayPic);
newGrayPic=grayPic;%Ϊ����ͼ��ı�Եһ������
% PrewittNum=0;%��Prewitt���Ӽ���õ���ÿ�����ص�ֵ
PrewittThreshold=0.5;%�趨��ֵ
for j=2:m-1 %���б߽���ȡ
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