%% Self defined function for opening by reconstruction
% function recon1 = myReconstruction( marker, mask )
% %     se = strel('square', 3);
%     se = ones(3, 3);
%     recon1 = marker;
%     recon1_old = zeros(size(recon1));
%     while (sum(sum(recon1 - recon1_old)) ~= 0)
%         % Retain output of previous iteration
%         recon1_old = recon1;
%         % Perform dilation
%         % recon1 = imdilate(recon1, se);
%         % The following command is slow. If you want to have better
%         % performance, uncomment the above `recon1 = imdilate(recon1, se);`
%         % and use `se = strel('square', 3);`
%         recon1 = myDilate(recon1, se);
%         % Restrict the dialated values using the mask
%         bw = recon1 > mask;
%         recon1(bw) = mask(bw);
%     end
% end

function [ h ] = myReconstruction( f, g, B )
% Implementation of morphlogical operation called reconstruction
    narginchk(1,3);
    nargoutchk(1,1);
    if ~islogical(f) || ~islogical(g)
        error('f, g must be logical matrix');
    end
    if nargin == 2
        B = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);
    end
    h = f;
    htmp = f;
    flag = false;
    while (~flag)
        h = logical(myDilate(htmp, B) .* g);
        flag = 1-any(any(h - htmp));
        htmp = h;
    end
end