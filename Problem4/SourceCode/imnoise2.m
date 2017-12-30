function R = imnoise2( type, varargin )
%IMNOISE2 Generate an array of random number with specified PDF
%   R = IMNOISE2(TYPE, M, M, A, B) generate an array, R, of size
%   M-by-N, whose elements are random numbers of the specified TYPE
%   with parameters A and B. If only TYPE is included in the input 
%   argument list, a single random number of the specified TYPE
%   and default parameters shown below is generated. If only 
%   TYPE, M, and N are provided, the default parameters shown 
%   below are used. If M = N = 1, IMNOISE2 generates a single random
%   number of the specified TYPE and parameters A and B.
%
%   Valid values for TYPE and parameters A and B are:
%   
%   'uniform'       Uniform random numbers in the interval (A, B).
%                   The default values are (0, 1).
%   'gaussian'      Gaussian random numbers of amplitude 0 with
%                   deviation B. The default values are A = 0, B = 1.
%   'salt & pepper' Salt and pepper numbers of amplitude 0 with
%                   probability Pa = A, and amplitude 1 with 
%                   Pb = A = B = 0.05. Note that the noise has
%                   values 0 (with probability Pa = A) and 1 (with
%                   probability Pb = B), so scaling is neccessary if 
%                   values other than 0 and 1 are required. The noise
%                   matrix R is assigned three values. If R(x, y) = 
%                   0, the noise at (x, y) is pepper (black). If 
%                   R(x, y) = 1, the noise at (x, y) is salt 
%                   (white). If R(x, y) = 0.5, there is no noise
%                   assigned to coordinates (x, y).
%   'lognormal'     Lognormal numbers with offset A and shape
%                   parameter B. The defaults are A = 1 and B = 
%                   0.25.
%   'rayleigh'      Rayleigh noise with parameters A and B. The default
%                   values are A = 0 and B = 1.
%   'exponential'   Exponential random numbers with parameter A. The 
%                   default is A = 1.
%   'erlang'        Erlang (gamma) random numbers with parameters A 
%                   and B. B must be a positive integer. The 
%                   defaults are A = 2 and B = 5. Erlang random
%                   numbers are approximated as the sum of B 
%                   exponential random numbers.
% Set default values.
%
    [M, N, a, b] = setDefaults(type, varargin{:});

    % Begin processing. Use lower(type) to protect against input being
    % capitalized.
    switch lower(type)
        case 'uniform'
            R = a + (b - a) * rand(M, N);
        case 'gaussian'
            R = a + b * randn(M, N);
        case 'salt & pepper'
            R = saltpepper(M, N, a, b);
        case 'lognormal'
            R = exp(b * randn(M, N) + a);
        case 'rayleigh'
            R = a + (-b * log(1 - rand(M, N))) .^ 0.5;
        case 'exponential'
            R = exponential(M, N, a);
        case 'erlang'
            R = erlang(M ,N, a, b);
        otherwise
            error('Unknown distribution type.')
    end
end

