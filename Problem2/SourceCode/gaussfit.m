function d = gaussfit( k, n, s )
%GAUSSFIT gauss filter
%  @x: Input Image
%  @n: Filter size is n x n
Img = double(s);
n1 = floor((n+1)/2);  % Compute the image center
for i = 1:n
    for j = 1:n
        b(i,j) = exp(-((i-n1)^2+(j-n1)^2)/(4*k))/(4*pi*k);
    end
end
d = uint8(conv2(Img,b,'same'));


