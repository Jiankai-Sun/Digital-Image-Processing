function out = imfreqfilt(I, ff)
% imfreqfilt function: frequency domain filtering of grayscale image
% @I: input spatial image
% @ff: applied frequency domain filter same with the original image
if (ndims(I)==3) && (size(I,3)==3) % RGB Image
    I = rgb2gray(I);
end
if (size(I) ~= size(ff))
    msg1 = sprintf('%s: The filter is not the same size with the original image, please check the input.', mfilename);
    msg2 = sprintf('%s: The filtering operation has been cancelled.', mfilename);
    eid = sprintf('Images:%s:ImageSizeNotEqual',mfilename);
    error(eid,'%s %s',msg1,msg2);
end
% fast fourier transform
f = fft2(double(I));
% move the origin point
s = fftshift(f);
% Apply filter and inverse transform
% Multiply corresponding element to implement the frequency domain filtering
out = s .* ff; 
out = ifftshift(out);
out = ifft2(out);
% Modulus value
out = abs(out);
% Normalized for display
out = out/max(out(:));