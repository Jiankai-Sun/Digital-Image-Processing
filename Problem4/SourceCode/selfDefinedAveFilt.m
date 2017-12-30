function f = selfDefinedAveFilt(g, m, n)
%SELFDEFINEDAVEFILT Self-defined average filter
	template = ones(m,n);
    [height, width] = size(g);
    x1 = double(g);
    x2 = x1;
    for i = 1 : height-m+1
        for j = 1: width-n+1
            c = x1(i:i+m-1, j:j+n-1).*template;
            s = sum(sum(c));
            x2(i+(m-1)/2, j+(n-1)/2) = s/(m*n);
        end
    end
    f = uint8(x2);
end

