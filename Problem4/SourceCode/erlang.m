function R = erlang( M, N, a, b )
    if (b ~= round(b) || b <= 0)
        error('Param b must be a positive integer for Erlang.')
    end
    k = -1 / a;
    R = zeros(M, N);
    for j = 1:b
        R = R + k * log(1 - rand(M, N));
    end
end

