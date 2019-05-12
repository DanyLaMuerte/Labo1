%este es pa q yo le pase un entero y ver q el num de iter es entero^3, lo
%ajusto con polinom 3

function []=numop(m)
cont=zeros(1,m);
w=zeros(1,m);
    for g=1:m
        A=rand(g,g);
        
        n=g;
        L=eye(n);
        cant=0;
        w(g)=w(g)+g;
        for k=1:n-1
            for i=k+1:n
                L(i,k)=A(i,k)/A(k,k); cant=cant+1;
                for j=k:n
                    A(i,j)=A(i,j)-L(i,k)*A(k,j); cant=cant+2;
                end
            end
        end        
        cont(g)=cont(g)+cant;
    end
    
    cf=polyfit(1:m, cont, 3);
    d=zeros(1,m);

    for h=1:m
        d(h)=cf(1)*(h^3)+cf(2)*(h^2)+cf(3)*h+cf(4);
    end
    
    hold on

    plot(1:m,d,'r')
    grid on
    
end %function