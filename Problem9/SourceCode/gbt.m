function J=gbt(I)
% input x is a vector. output T is an estimated threshold that groups x
% into 2 clusters using the algorithm of basic global thresholding
% procesures:
% 1)	Randomly select an initial estimate for T.
% 2)	Segment the signal using T, which will yield two groups, G1 consisting of all  points with values<=T and G2 consisting of points with value>T.
% 3)	Compute the average distance between points of G1 and T, and points of G2 and T. 
% 4)	Compute a new threshold value T=(M1+M2)/2
% 5)	Repeat steps 2 through 4 until the change of T is smaller enough. 

T=0.5*(double(min(I(:)))+double(max(I(:))));%���ó�ʼ��ֵΪ���ҶȺ���С�Ҷ�ֵ�͵�һ��
done=false;
while ~done
    g=I>=T;%�ֳ��������أ��Ҷ�ֵ���ڻ��ߵ���T�ĺͻҶ�ֵС��T��
    Tnext=0.5*(mean(I(g))+mean(I(~g)));%����ֵ������Χ������ƽ��ֵ�͵�һ��
    done=abs(T-Tnext)<0.5; %0.5���Լ�ָ���Ĳ���
    T=Tnext;
end
%���³�����Ǹ�������ȷ������ֵ����ͼ���ֵ�ָ�
J=I;
K= J>=T;
J(K)=255;
K= J<T;
J(K)=0;