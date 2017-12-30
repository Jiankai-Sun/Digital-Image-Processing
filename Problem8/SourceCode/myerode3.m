function bw2 = myerode( bw, se )
%MYERODE My Self-defined imerode function 
%   bw: binary image
%   se: matrix
    [M, N] = size(bw);
    bw2 = zeros(M,N);
    [P, Q] = size(se);
    for i = 1+floor(P/2):M-floor(P/2)
        for j = 1+floor(Q/2):N-floor(Q/2)
%             i
%             j
%             size(bw(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2)))
            if bw(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2)) == se
                bw2(i, j) = 1;
            end
        end
    end
end

