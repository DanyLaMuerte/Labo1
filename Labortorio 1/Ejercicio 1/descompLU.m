%funciona si no hay ceros en la diagonal o elementos cercanos a cero
function [L,U]=descompLU(A)
nn=size(A);
n=nn(1);
L=eye(n);

for k=1:n-1
    for i=k+1:n
        L(i,k)=A(i,k)/A(k,k);
        for j=k:n
            A(i,j)=A(i,j)-L(i,k)*A(k,j);
                        
        end
    end
end

U=A;
end %function