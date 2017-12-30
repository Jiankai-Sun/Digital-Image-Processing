function f = alphatrim( g, m, n, d )
%ALPHATRIM Implements an alpha-trimmed mean filter
    if (d <= 0) %|| (d / 2 ~= round(d / 2))
        error('d must be a positive, even integer.')
    end
    [g, revertClass] = tofloat(g);
    f = imfilter(g, ones(m, n), 'symmetric');
    for k = 1 : d/2
        f = f - ordfilt2(g, k, ones(m, n), 'symmetric');
    end
    for k = floor((m * n - (d/2) + 1)) : m*n
        f = f - ordfilt2(g, k, ones(m, n), 'symmetric');
    end
    f = f / (m * n - d);
    f = revertClass(f);
end

