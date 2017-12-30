function [I2] = myHoleFill(I)
%IMFILL Fill image regions and holes.
    if islogical(I)
        mask = uint8(I);
    else
        mask = I;
    end
    mask = padarray(mask, ones(1,ndims(mask)), -Inf, 'both');
    mask = imcomplement(mask);
    marker = mask;
    
    idx = cell(1,ndims(I));
    for k = 1:ndims(I)
        idx{k} = 2:(size(marker,k) - 1);
    end
    marker(idx{:}) = -Inf;
    conn = conndef(ndims(I),'minimal');
    
    I2 = imreconstruct(marker, mask, conn);
    I2 = imcomplement(I2);
    I2 = I2(idx{:});

    if islogical(I)
        I2 = logical(I2);
    end
end
