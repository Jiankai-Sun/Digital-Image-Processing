function f = selfDefinedMedian( g, m, n )
%SELFDEFINEDMIDPOINT Self-defined Midpoint filter
	[height, width] = size(g);
    x1 = double(g);
    x2 = x1;
    for i = 1:height-m+1
        for j = 1:width-n+1
            c = x1(i:i+m-1, j:j+n-1);
            e = c(1,:);
            for k = 2:n
                e = [e, c(k, :)];
            end
            tmp = median(e);
            x2(i+(m-1)/2, j+(n-1)/2) = tmp;
        end
    end
    f = uint8(x2);
end

