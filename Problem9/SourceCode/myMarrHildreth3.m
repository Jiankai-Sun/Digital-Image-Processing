function imgn = myMarrHildreth( img )
%MYMARRHILDRETH 此处显示有关此函数的摘要
%产生LoG算子(Laplacian of Gaussian)
% m=11;
% n=11;
% sigma=1.4;
m=25;
n=25;
sigma=4;
w=zeros(m,n);
h_m=(m-1)/2;
h_n=(n-1)/2;
for i=1:m
    for j=1:n
        y=i-h_m;
        x=j-h_n;
        w(i,j)=(1/(sigma*sigma))*((y*y+x*x)/(sigma*sigma)-2)*exp(-(y*y+x*x)/(2*sigma*sigma)); 
    end
end
w=w/sum(sum(w));    %归一化

imgn=imfilter(img,w,'replicate');

%过零点检测，一个函数最大值大于零，最小值小于零，那么函数中间一定有为零的点
%准确的过零点的值需要插值
[m,n]=size(img);
for i=2:m-1
    for j=2:n-1
        tmp(1)=sum(sum(imgn(i-1:i,j-1:j)));
        tmp(2)=sum(sum(imgn(i-1:i,j:j+1)));
        tmp(3)=sum(sum(imgn(i:i+1,j-1:j)));
        tmp(4)=sum(sum(imgn(i:i+1,j:j+1)));
        Ma=max(tmp);
        Mi=min(tmp);
        if Ma>0 && Mi<0
            imgn(i,j)=255;
        end
    end
end
end

