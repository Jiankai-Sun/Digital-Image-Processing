 function J=meanfilter(I,m,n)
[height width]=size(I);
J=zeros(height,width);
M = padarray(I,[(m-1)/2 (n-1)/2],'replicate');   %Ìî³äÍ¼Ïñ¡®replicate¡¯
M=double(M);                  
mean=0;
for i = 3:height+2
        for j = 3:width+2
            for p=i-(m-1)/2+1:i+(m-1)/2-1
                for q=j-(n-1)/2+1:j+(n-1)/2-1
                    mean=M(p,q)+mean;
                end
            end
            J(i-2,j-2) = mean/(m*n);
            mean=0;
        end
end
J=uint8(J);
