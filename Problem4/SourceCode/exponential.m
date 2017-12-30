function R = exponential( M, N, a )
    if a <= 0
        error('Parameter a must be positive for exponential type.')
    end
    k = -1 / a;
    R = k * log(1 - rand(M, N));
end

