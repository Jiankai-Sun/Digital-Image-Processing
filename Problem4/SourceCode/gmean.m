function f = gmean( g, m, n )
%GMEAN Implements a geometric mean filter
    [g, revertClass] = tofloat(g);
    f = exp(imfilter(log(g), ones(m, n), 'replicate')).^(1/m/n);
    f = revertClass(f);
end

