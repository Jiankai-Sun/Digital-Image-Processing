function f = myErode(A,varargin)
    if length(varargin)==2
        s=varargin{1};
        b=varargin{2};
    else
        s=varargin{1};
        b=[];
    end
    [M,N]=size(A);
    [m,n]=size(s);
    
    if isempty(b)
        b=zeros(m,n);
    end
    % Processing of binary image
    g=zeros(M+m-1,N+n-1);
    f=A;
    for i=1:M
        for j=1:N
            g(i+(m-1)/2,j+(n-1)/2)=A(i,j);        
        end
    end
    h=zeros(m,n);
    % Processing of Gray-scale image
    for i=1:M
        for j=1:N
            for p=1:m
                for q=1:n
                   h(p,q)=g(p+i-1,q+j-1);
                end
            end
            r=h.*s-b+(1-s)*255;
            f(i,j)=min(r(:));
        end 
    end                               
end