        function [cont]=descompLUcont(A)
        nn=size(A);
        n=nn(1);
        L=eye(n);
        cont=0;
        for k=1:n-1
            for i=k+1:n
                L(i,k)=A(i,k)/A(k,k); cont=cont+1;
                for j=k:n
                    A(i,j)=A(i,j)-L(i,k)*A(k,j); cont = cont+2;
                                
                end
            end
        end

        end %function