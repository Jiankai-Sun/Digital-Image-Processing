function f_Wiener = wienerFilter( K, H, HmultiplyFFT )
%WIENERFILTER 
    [M, N] = size(H);
    %H_Wiener = ((abs(H_1).^2)./((abs(H_1).^2)+K)).*(1./H_1);
    H_Wiener = ((abs(H).^2)./((abs(H).^2)+K)).*(1./H);

    F_Wiener = H_Wiener .*  HmultiplyFFT;
    f_Wiener = real(ifft2(F_Wiener));
    f_Wiener = f_Wiener(1:1:M,1:1:N);

    for x = 1:M
        for y = 1:N
            f_Wiener(x,y) = f_Wiener(x,y) * (-1)^(x+y);
        end
    end
end

