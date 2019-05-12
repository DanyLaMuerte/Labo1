function [x]=solsystdefp(A, b)
    [L,U]=descompLU(A);
    nn=size(A);
    n=nn(1);
    aux=b;
    
    for c=1:n-1   %cantidad de matrices L a multiplicarle
        
        for k=c+1:n   %multiplico mientras me muevo por el vector bajando L
            %tengo q restarle a los 
            aux(k)=aux(k)-L(k,c)*aux(c);
        end        
    end
    y=aux;
    x=inv(U)*y;
    
    
end %function