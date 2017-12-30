function out = idealHighpassFilter( I, freq )
% idealHighpassFilter function: Ideal Highpass Filter
% I: input image
% freq: cut-off frequency of lowpass filter
% out: return value
[M, N] = size(I);
out = ones(M, N);
for i = 1:M
    for j = 1:N
        if(sqrt(((i-M/2)^2+(j-N/2)^2)) <= freq)
            out(i, j) = 0;
        end
    end
end

