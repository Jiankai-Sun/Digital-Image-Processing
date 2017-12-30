function invFilt = invFilter(G,H)
%INVFILTER 
    [P, Q] = size(G);
    for x = (-P/2):1:(P/2)-1
         for y = (-Q/2):1:(Q/2)-1
            D = (x^2 + y^2)^(0.5);
            if(D < 258) 
                F(x+(P/2)+1,y+(Q/2)+1) = G(x+(P/2)+1,y+(Q/2)+1) ./ H(x+(P/2)+1,y+(Q/2)+1);
            % no noise D < 188
            % noise D < 56
            else F(x+(P/2)+1,y+(Q/2)+1) = G(x+(P/2)+1,y+(Q/2)+1);
            end 
         end
    end

    % Butterworth_Lowpass_Filters
%     H_B = zeros(P,Q);
%     D_0 = 70;
%     for x = (-P/2):1:(P/2)-1
%          for y = (-Q/2):1:(Q/2)-1
%             D = (x^2 + y^2)^(0.5);
%             H_B(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^20);
%          end
%     end
% 
%     F = F .* H_B;

    invFilt = real(ifft2(F));
    invFilt = invFilt(1:P,1:Q);

    for x = 1:P
        for y = 1:Q
            invFilt(x,y) = invFilt(x,y) * (-1)^(x+y);
        end
    end
end

