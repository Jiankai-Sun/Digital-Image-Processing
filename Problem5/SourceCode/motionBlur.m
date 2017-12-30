function H = motionBlur( f,a,b,T )
%MOTIONBLUR motion blurring degradation function
% @ Image: Input Image
% @ a: parameter
% @ b: parameter
% @ T: parameter
% @ H: image after motion blurred

    [P,Q] = size(f);
    H = zeros(P, Q);
    for x = (-P/2):1:(P/2)-1
        for y = (-Q/2):1:(Q/2)-1
            R = (x*a + y*b)*pi;
            if(R == 0)
                H(x+(P/2)+1,y+(Q/2)+1) = T;
            else H(x+(P/2)+1,y+(Q/2)+1) = (T/R)*(sin(R))*exp(-1i*R);
            end
         end
    end
end

