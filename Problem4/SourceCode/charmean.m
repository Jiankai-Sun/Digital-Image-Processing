function f = charmean( g, m, n, q )
%CHARMEAN Implements a contraharmonic mean filter
	[g, revertClass] = tofloat(g);
    f = imfilter(g .^ (q+1), ones(m, n), 'replicate');
    f = f ./ (imfilter(g .^ q, ones(m, n), 'replicate') + eps);
    f = revertClass(f);
end

