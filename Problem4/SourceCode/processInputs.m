function [m, n, Q, d] = processInputs(varargin)
    m = 3;
    n = 3; 
    Q = 1.5;
    d = 2;
    if nargin > 0
        m = varargin{1};
    end
    if nargin > 1
        n = varargin{2};
    end
    if nargin > 2
        Q = varargin{3};
        d = varargin{3};
    end
end

