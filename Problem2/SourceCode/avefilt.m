function d = avefilt( x, n )
%AVEFIT averaging filter
%  @x: Input Image
%  @n: Filter size is n x n
a(1:n, 1:n) = 1;  % a is a filter size of n x n
p = size(x);
x1 = double(x);
x2 = x1;
% A(a:b, c:d) represents Matrix `A` - row: from a to b, col: from c to d
for i = 1:p(1)-n+1
    for j = 1:p(2)-n+1
        c = x1(i:i+(n-1), j:j+(n-1)) .* a; 
        s = sum(sum(c)); 
        x2(i+(n-1)/2, j+(n-1)/2) = s/(n*n);  
    end
end

d = uint8(x2);

end

