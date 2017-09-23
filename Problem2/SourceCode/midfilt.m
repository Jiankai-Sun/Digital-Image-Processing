function d = midfilt( x, n )
%MIDFILT middle filter
%  @x: Input Image
%  @n: Filter size is n x n
p = size(x);
x1 = double(x);
x2 = x1;
for i = 1:p(1)-n+1
    for j = 1:p(2)-n+1
        c = x1(i:i+(n-1), j:j+(n-1));
        e = c(1,:);
        for u = 2:n
            e = [e, c(u,:)];
        end
        x2(i+(n-1)/2, j+(n-1)/2) = median(e);
    end
end

d = uint8(x2);

