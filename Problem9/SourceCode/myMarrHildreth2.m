function otptth = myMarrHildreth2( im )
im=im2double(im);
%smoothening the image with a filter
gfilter= [0 0 1 0 0;
       0 1 2 1 0;
       1 2 -16 2 1;
       0 1 2 1 0;
       0 0 1 0 0];
   
smim=conv2(im,gfilter);

% finding the zero crossings
[rr,cc]=size(smim);
zc=zeros([rr,cc]);

for i=2:rr-1
    for j=2:cc-1
        if (smim(i,j)>0)
            if (smim(i,j+1)>=0 && smim(i,j-1)<0) || (smim(i,j+1)<0 && smim(i,j-1)>=0)            
                zc(i,j)= smim(i,j+1); 
            elseif (smim(i+1,j)>=0 && smim(i-1,j)<0) || (smim(i+1,j)<0 && smim(i-1,j)>=0)
                zc(i,j)= smim(i,j+1);
            elseif (smim(i+1,j+1)>=0 && smim(i-1,j-1)<0) || (smim(i+1,j+1)<0 && smim(i-1,j-1)>=0)
                zc(i,j)= smim(i,j+1);
            elseif (smim(i-1,j+1)>=0 && smim(i+1,j-1)<0) || (smim(i-1,j+1)<0 && smim(i+1,j-1)>=0)
                zc(i,j)=smim(i,j+1);
            end
                        
        end
            
    end
end

otpt=im2uint8(zc);
% thresholding
% otptth = otpt>105;
otptth = otpt>250;

figure;
  subplot(2,2,1);imshow(im);title('Origional image');
  subplot(2,2,2);imshow(smim);title('Smoothened image');
  subplot(2,2,3);imshow(otpt);title('Output image');
  subplot(2,2,4);imshow(otptth);title('Output image with threshold');
end

