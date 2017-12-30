function f = spfilt( g, type, varargin )
%SPFILT Performs linear and nonlinear spatial filtering
%   F = SPFILT(G, TYPE, M, N, PARAMETER) performs spatial filtering
%	of image G using a TYPE filter of size M-by-N. Valid calls to 
%	SPFILT are as follows:
%
%		F = SPFILT(G, 'amean1', M, N)		Arithmetric mean filtering.
%		F = SPFILT(G, 'amean2', M, N)		Self-defined arithmetric mean filtering.
%		F = SPFILT(G, 'gmean', M, N)		Geometric mean filtering.
%		F = SPFILT(G, 'hmean', M, N)		Harmonic mean filtering.
%		F = SPFILT(G, 'chmean', M, N, Q)	Contraharmonic mean 
%											filtering of order Q. The
%											default Q is 1.5.
%		F = SPFILT(G, 'median', M, N)		Median filtering 
%		F = SPFILT(G, 'max', M, N)			Max filtering 
%		F = SPFILT(G, 'min', M, N)			Min filtering
%		F = SPFILT(G, 'midpoint', M, N)		Midpoint filtering
%		F = SPFILT(G, 'atrimmed', M, N, D)	Alpha-trimmed mean
%											filtering. Parameter D must
%											be a nonnegative even 
%											integer; its default value
%											is 2.
%	The default values when only G and TYPE are input are M = N = 3, 
%	Q = 1.5, and D = 2.
%
    [m, n, Q, d] = processInputs(varargin{:});
    %   Do the filtering
    switch type
        case 'amean1'
            w = fspecial('average', [m n]);
            f = imfilter(g, w, 'replicate');
        case 'amean2'
            f = selfDefinedAveFilt(g, m, n);
        case 'gmean'
            f = gmean(g, m, n);
        case 'hmean'
            f = harmean(g, m ,n);
        case 'chmean'
            f = charmean(g, m, n, Q);
        case 'median1'
            f = medfilt2(g, [m n], 'symmetric');
        case 'median2'
            f = selfDefinedMedian(g, m, n);
        case 'max'
            f = imdilate(g, ones(m, n));
        case 'min'
            f = imerode(g, ones(m, n));
        case 'midpoint'
            f1 = ordfilt2(g, 1, ones(m, n), 'symmetric');
            f2 = ordfilt2(g, m*n, ones(m, n), 'symmetric');
            f = imlincomb(0.5, f1, 0.5, f2);
        case 'atrimmed'
            f = alphatrim(g, m, n, d);
        otherwise
            error('Unknown filter type')
    end
end

