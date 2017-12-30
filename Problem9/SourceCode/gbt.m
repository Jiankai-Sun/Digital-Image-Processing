function J=gbt(I)
% input x is a vector. output T is an estimated threshold that groups x
% into 2 clusters using the algorithm of basic global thresholding
% procesures:
% 1)	Randomly select an initial estimate for T.
% 2)	Segment the signal using T, which will yield two groups, G1 consisting of all  points with values<=T and G2 consisting of points with value>T.
% 3)	Compute the average distance between points of G1 and T, and points of G2 and T. 
% 4)	Compute a new threshold value T=(M1+M2)/2
% 5)	Repeat steps 2 through 4 until the change of T is smaller enough. 

T=0.5*(double(min(I(:)))+double(max(I(:))));%设置初始阈值为最大灰度和最小灰度值和的一半
done=false;
while ~done
    g=I>=T;%分成两组像素，灰度值大于或者等于T的和灰度值小于T的
    Tnext=0.5*(mean(I(g))+mean(I(~g)));%新阈值两个范围内像素平均值和的一半
    done=abs(T-Tnext)<0.5; %0.5是自己指定的参数
    T=Tnext;
end
%以下程序就是根据上面确定的阈值进行图像二值分割
J=I;
K= J>=T;
J(K)=255;
K= J<T;
J(K)=0;