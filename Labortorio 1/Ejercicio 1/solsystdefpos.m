function [x]=solsystdefpos(A, b)
    [L,U]=descompLU(A);
    nn=size(A);
    n=nn(1);
    y=zeros(1,n);
    aux=b;
    for c=1:n-1
        for i=1:n
            y(i)=aux(i);
            if i~=1
                for j=1:n-1
                    y(i)=y(i)-L(c,j)*y(j);
                end
                aux=y;

            end
        end
    end
    
    x=inv(U)*y';
    
end %function