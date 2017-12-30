function varargout = setDefaults( type, varargin )
varargout = varargin;
P = numel(varargin);
if P < 4
    % Set default b.
    varargout{4} = 1;
end
if P < 3
    % Set default a
    varargout{3} = 0;
end
if P < 2
    % Set default N.
    varargout{2} = 1;
end
if P < 1
    % Set default M.
    varargout{1} = 1;
end
if (P <= 2)
    switch type
        case 'salt & pepper'
            % a = b = 0.05.
            varargout{3} = 0.05;
            varargout{4} = 0.05;
        case 'lognormal'
            % a = 1; b = 0.25;
            varargout{3} = 1;
            varargout{4} = 0.25;
        case 'exponential'
            % a = 1.
            varargout{3} = 1;
        case 'erlang'
            % a = 2; b = 5
            varargout{3} = 2; 
            varargout{4} = 5;
    end
end

