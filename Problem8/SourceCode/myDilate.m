function f = myDilate(A,s)
    [M,N] = size(A);
    [m,n] = size(s);
    g = zeros(M+m-1,N+n-1);
    f = A;
    for i=1:M
        for j=1:N
            g(i+(m-1)/2,j+(n-1)/2)=A(i,j);       
        end
    end
    h=zeros(m,n);
    % gray-scale image 
    for i=1:M
        for j=1:N
            for p=1:m
                for q=1:n
                    h(p,q)=g(p+i-1,q+j-1);
                end
            end
            r=h.*s;
            f(i,j)=max(r(:));
         end 
    end
end