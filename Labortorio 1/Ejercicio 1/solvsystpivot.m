function [x]=solvsystpivot(A, b)
    nn=size(A);
    n=nn(1);
    p=zeros(n-1,2); % son n-1 filas de 2 elem q indican indices de columnas
    %a intercambiar, turbio
    %voy a asumir q si det(A)~=0 se puede hacer el intercambio y me va a
    %bastar con n-1 intercambios
    L=eye(n);
    
    
    for k=1:n-1
        if abs(A(k,k))<=0.00000001 
            bu=k+1;
            while A(bu,k)==0
                bu=bu+1;
            end
            p(k,1)=k; p(k,2)=bu;
            %las intercambio aqui
            aux=b(k); b(k)=b(bu); b(bu)=aux;
            
            A=intercambiofila(A,k,bu);       
        end
               
        for i=k+1:n
            
            L(i,k)=A(i,k)/A(k,k);
                for j=k:n
                    A(i,j)=A(i,j)-L(i,k)*A(k,j);

                end
            b(i)=b(i)-L(i,k)*b(k);
        end
                
    end
    %se supone q luego de esto tengo Ax=b con A triang sup, pero no es A
    %sino que fue algo que le intercambiaron las filas y tambien al b y
    %luego la A se volvio la U como de costumbre
    x=zeros(1,n);
    
    
    for c1=1:n
        if c1==1
            x(n)=b(n)/A(n,n);
            else
                x(n-c1+1)=b(n-c1+1);
                
                for c2=1:c1-1
                        
                    x(n-c1+1)= x(n-c1+1)-A(n-c1+1,n+1-c2)*x(n+1-c2) ;
                end
        
                x(n-c1+1)=x(n-c1+1)/A(n-c1+1,n-c1+1);
                
        end         
    end
   
    
end %function