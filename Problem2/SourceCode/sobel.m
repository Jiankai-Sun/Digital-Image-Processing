function I=sobel(I)
[height,width]=size(I);
M = padarray(I,[1 1],'replicate','both');   %Ìî³äÍ¼Ïñ¡®replicate¡¯
M=double(M);                                %soble²Ù×÷
for i=2:height+1
    for j=2:width+1
        I(i-1,j-1)=abs((M(i+1,j-1)+2*M(i+1,j)+M(i+1,j+1))-(M(i-1,j-1)+2*M(i-1,j)+M(i-1,j+1)))+abs((M(i-1,j+1)+2*M(i,j+1)+M(i+1,j+1))-(M(i-1,j-1)+2*M(i,j-1)+M(i+1,j-1)));
    end
end