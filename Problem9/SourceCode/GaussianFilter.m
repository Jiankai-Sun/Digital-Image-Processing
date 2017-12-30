function H = GaussianFilter( kh, kw, sigma )
cy = int32(kh / 2);
cx = int32(kw / 2);
x = 1-cx:cx-1;
y = 1-cy:cy-1;
[X, Y] = meshgrid(x, y);
table = double(X.^2 + Y.^2);
H = exp( ( - 0.5 / sigma ^ 2) .* table );
H = H/sum(sum(H));
end