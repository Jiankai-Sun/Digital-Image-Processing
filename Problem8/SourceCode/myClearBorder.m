function im2 = myClearBorder(im, conn)
%IMCLEARBORDER Suppress light structures connected to image border.

%   Algorithm reference: P. Soille, Morphological Image Analysis:
%   Principles and Applications, Springer, 1999, pp. 164-165.

%   Input-output specs
%   ------------------
%   IM:     N-D, real, full matrix
%           any numeric or logical nonsparse type
%           if islogical(IM), treated as binary
%           empty ok
%           Infs ok
%           if logical, NaNs are ok and treated as 0s, otherwise
%              not allowed.
%
%   CONN:   connectivity
%
%   IM2:    Same class and size as IM

marker = im;

% Now figure out which elements of the marker image are connected to the
% outside, according to the connectivity definition.
im2 = true(size(marker));
im2 = padarray(im2, ones(1,ndims(im2)), 0, 'both');
im2 = imerode(im2,conn);
idx = cell(1,ndims(im2));
for k = 1:ndims(im2)
    idx{k} = 2:(size(im2,k) - 1);
end
im2 = im2(idx{:});

% Set all elements of the marker image that are not connected to the
% outside to the lowest possible value.
if islogical(marker)
    marker(im2) = false;
else
    marker(im2) = -Inf;
end

im2 = imreconstruct(marker, im, conn);
if islogical(im2)
    im2 = im & ~im2;
else
    im2 = im - im2;
end
