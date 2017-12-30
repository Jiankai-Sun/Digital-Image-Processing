function R = saltpepper( M, N, a, b )
    % Check to make sure that Pa + Pb is not > 1.
    if (a + b) > 1
        error('The sum Pa + Pb must not exceed 1.')
    end
    R(1:M, 1:N) = 0.5;
    % Generate an M-by-N array of uniformly-distributed random numbers
    % in the range (0, 1). Then, Pa*(M*N) of them will have values <= a.
    % The coordinates of these points we call 0 (pepper noise).
    % Similarly, Pb*(M*N) points will have values in the range > a & <= 
    % (a + b). These we call 1 (salt noise).
    X = rand(M, N);
    R(X <= a) = 0;
    u = a + b;
    R(X > a & X <= u) = 1;
end

