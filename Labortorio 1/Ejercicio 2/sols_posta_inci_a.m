function [x]=sols_posta_inci_a(L,U,b)  %este tiene q ser el posta, este es del 1
    nn=size(U);
    n=nn(1);
    y=b;
    x=zeros(1,n);

    for c=1:n-1   %cantidad de matrices L a multiplicarle
        
        for k=c+1:n   %multiplico mientras me muevo por el vector bajando L
            %tengo q restarle a los 
            y(k)=y(k)-L(k,c)*y(c);
        end        
    end
    
    
    for c1=1:n
        if c1==1
            x(n)=y(n)/U(n,n);
            else
                x(n-c1+1)=y(n-c1+1);
                
                for c2=1:c1-1
                        
                    x(n-c1+1)= x(n-c1+1)-U(n-c1+1,n+1-c2)*x(n+1-c2) ;
                end
        
                x(n-c1+1)=x(n-c1+1)/U(n-c1+1,n-c1+1);
                
        end         
    end
        
    
end %function