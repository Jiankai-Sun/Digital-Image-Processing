function [ varargout ] = wavefilter( wname, type )
%WAVEFILTER Create wavelet decomposition and reconstruction filters
%   [VARARGOUT] = WAVEFILTER(WNAME, TYPE) returns the decomposition
%	and/or reconstruction filters used in the computation of the
%	forward and inverse FWT (fast wavelet transform)

%	EXAMPLES:
%		[ld, hd, lr, hr] = wavefilter('haar') Get the low and highpass
%											  decomposition (ld, hd)
%											  and reconstruction (lr, hr)
%											  filters for wavelet 'haar'
%		[ld, hd] = wavefilter('haar', 'd')	  Get decomposition filters 
%											  ld and hd
%		[lr, hr] = wavefilter('haar', 'r')	  Get reconstruction filters
%											  lr and hr
%
%	INPUTS:
%		WNAME				Wavelet Name		
%       -----------------------------------------------------------------
%		'haar' or 'db1'		Haar
%		'db4'				4th order Daubechies
%		'sym4'				4th order Symlets
%		'bior6.8'			Cohen-Daubechies-Feauveau biorthogonal
%		'jpeg9.7'			Antonini-Barlaud-Mathieu-Daubechies 
%
%		TYPE				Filter TYPE
%		-----------------------------------------------------------------
%		'd'					Decomposition filters
%		'r'					Reconstruction filters
%
%	See also WAVEFAST and WAVEBACK

% Check the input and output arguments
narginchk(1, 2)

if (nargin == 1 && nargout ~= 4) || (nargin == 2 && nargout ~= 2)
	error('Invalid number of output arguments.');
end

if nargin == 1 && ~ischar(wname)
    error('WNAME must be a string.');
end

if nargin == 2 && ~ischar(type)
    error('TYPE must be a string.');
end

% Create filters for the requested wavelet.
switch lower(wname)
    case{'haar', 'db1'}
        ld = [1 1] / sqrt(2);   hd = [1 -1]/sqrt(2);
        lr = ld;                hr = -hd;
    case 'db4'
        lr = [ 0.23037781 0.71484657 ...
               0.63088076 -0.02798376 ...
               -0.18703481 0.03084138 ...
               0.03288301 -0.01059740];
        t = (0:7);
        ld = lr;
        ld(end:-1:1) = lr;
        hr = (-1).^t .* ld;
        hd = hr;
        hd(end:-1:1) = hr;
    case 'sym4'
        lr = [ 0.0322 -0.0126 ...
               -0.0992 0.2979 ...
               0.8037 0.4976 ...
               -0.0296 -0.0758] ;
        t = (0:7);
        ld = lr;
        ld(end:-1:1) = lr;
        hr = (-1).^t .* ld;
        hd = hr;
        hd(end:-1:1)=hr;
    case 'bior6.8'
        ld = [ 0        0.0019 ...
               -0.0019  -0.017 ...
               0.0119   0.0497 ...
               -0.0773  -0.0941 ...
               0.4208   0.8259 ...
               0.4208   -0.0941 ...
               -0.0773  0.0497 ...
               0.0119   -0.017 ...
               -0.0019  0.0010 ...
            ];
        hd =[ 0         0 ...
              0         0.0144 ...
              -0.0145   -0.0787 ...
              0.0404    0.4178 ...
              -0.7589   0.4178 ...
              0.0404    -0.0787 ...
              -0.0145   0.0144 ...
              0         0 ...
              0         0 ...
            ];
        t = (0:17);
        lr = (-1).^(t+1) .* hd;
        hr = (-1).^t .* ld;
    case 'jpeg9.7'
        ld =   [0 0.02674875741080976 -0.01686411844287495 ...
                -0.07822326652898785 0.2668641184428723 ...
                0.6029490182363579 0.2668641184428723 ...
                -0.07822326652898785 -0.01686411844287495 ...
                0.02674875741080976 ];
        hd =   [0 -0.09127176311424948 0.05754352622849957 ...
                0.5912717631142470 -1.115087052456994 ...
                0.5912717631142470 0.05754352622849957 ...
                -0.09127176311424948 0 0 ];
        t = (0:9);
        lr = cos(pi * (t + 1)) .* hd;
        hr = cos(pi * t) .* ld;
    otherwise
        error('Unrecognizable wavelet name (WNAME).');
end
% Output the requested filters
if (nargin == 1)
    varargout(1:4) = {ld, hd, lr, hr};
else
    switch lower(type(1))
        case 'd'
            varargout = {ld, hd};
        case 'r' 
            varargout = {lr, hr};
        otherwise
            error('Unrecognizable filter TYPE.');
    end
end
end
