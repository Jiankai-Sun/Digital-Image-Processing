function edges = myMarrHildreth(Image, sigma)

% This is a simple implementation of the LoG edge detector. 

% Image: Gray-level input image
% sigma: try values like 1, 2, 4, 8, etc.
% edges: Output edge map

% Form the LoG filter
nLoG = filter_LoG(sigma);

% convResult = conv2(double(Image), nLoG, 'same');
% imfilter works better for border pixels (use conv2 above or imfilter below)
convResult = imfilter(double(Image), nLoG, 'replicate');

slope = mean( abs(convResult(:)) );

%% Vertical edges
% Shift image one pixel to the left and right
convLeft = circshift(convResult, [0, -1]);
convRight = circshift(convResult, [0, 1]);

% The vertical edges (-  +, +  -, - 0 +, + 0 -)
v_edge1 = convResult < 0 & convLeft > 0 & abs(convLeft - convResult) > slope;
v_edge2 = convResult < 0 & convRight > 0 & abs(convRight - convResult) > slope;
v_edge3 = convResult == 0 & sign(convLeft) ~= sign(convRight) & abs(convLeft - convRight) > slope;
v_edge = v_edge1 | v_edge2 | v_edge3; 
v_edge(:, [1 end]) = 0;

%% Horizontal edges
% Shift image one pixel to the top and bottom
convTop = circshift(convResult, [-1, 0]);
convBot = circshift(convResult, [1, 0]);

% The horizontal edges (-  +, +  -, - 0 +, + 0 -)
h_edge1 = convResult < 0 & convTop > 0 & abs(convTop - convResult) > slope;
h_edge2 = convResult < 0 & convBot > 0 & abs(convBot - convResult) > slope;
h_edge3 = convResult == 0 & sign(convTop) ~= sign(convBot) & abs(convTop - convBot) > slope;
h_edge = h_edge1 | h_edge2 | h_edge3; 
h_edge([1 end], :) = 0;

% Combine vertical and horizontal edges
edges = v_edge | h_edge;
end


function nLoG = filter_LoG(sigma)

% This function generates Laplacian of Gaussian filter given the sigma
% parameter as its input. Filter size is estimated by multiplying the 
% sigma with a constant.

%% The function
fsize = ceil(sigma) * 5; % filter size is estimated by: sigma * constant

fsize = (fsize - 1) / 2; 

[x, y] = meshgrid(-fsize : fsize, -fsize : fsize);

% The two parts of the LoG equation
a = (x .^ 2 + y .^ 2 - 2 * sigma ^ 2) / sigma ^ 4;
b = exp( - (x .^ 2 + y .^ 2) / (2 * sigma ^ 2) );
b = b / sum(b(:));

% The LoG filter
LoG = a .* b;

% The normalized LoG filter
nLoG = LoG - mean2(LoG);

% ** end of the function ** 

%% Uncomment to display LoG plot 
% surf(x, y , nLoG);
% xlabel('x'); 
% ylabel('y');
% zlabel('LoG'); 
% name = ['Laplacian of 2D Gaussian ( \sigma = ' , num2str(sigma), ' )']; 
% title(name);

%% Uncomment to save at output
% print(num2str(sigma), '-dpng', '-r400');

return

end


%% Additionally you can use the following code to overlay edges on the input image

% overlay = repmat(Image, 1, [1 3]);
% 
% for i = 1 : size(edges, 1)
%     for j = 1 : size(edges, 2)
%         if edges(i, j)
%             overlay(i, j, :) = [0 255 255];
%         end
%     end
% end