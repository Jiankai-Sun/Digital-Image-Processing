function f = harmean( g, m, n )
%HARMEAN Implements a harmonic mean filter
	[g, revertClass] = tofloat(g);
    f = m * n ./ imfilter(1 ./ (g + eps), ones(m, n), 'replicate');
    f = revertClass(f);
end

