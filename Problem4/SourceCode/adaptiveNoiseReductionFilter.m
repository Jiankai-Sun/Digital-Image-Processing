function [ f, noise ] = adaptiveNoiseReductionFilter( g, nhood, noise )
% adaptiveNoiseReductionFilter
% @g: input image
% @nhood: [n x n]

if (nargin < 3)
    noise = [];
end

% Estimate the local mean of f.
localMean = filter2(ones(nhood), g) / prod(nhood);

% Estimate of the local variance of f.
localVar = filter2(ones(nhood), g.^2) / prod(nhood) - localMean.^2;

% Estimate the noise power if neccessay
if (isempty(noise))
    noise = mean2(localVar);
end

% Compute result
% f = localMean + (max(0, localVar - noise) ./ ...
%     max(localVar, noise)) .* (g - localMean);

% Compute is split up to minimize use of memory for temp arrays
f = g - localMean;
g = localVar - noise;
g = max(g, 0);

f = localMean + ((f ./ max(localVar, noise)) .* g);


end

