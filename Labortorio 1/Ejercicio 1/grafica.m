%resolver el 1 bien inciso a)

function [a,s,t]=grafica(n) %n es rango de matriz A
cont=zeros(1,n-3);
t1=zeros(1,n-3);
for i=4:n   %voy a darle mas orden al inicial 
            %para que no sean tan poquitos pasos y no se muera entonces
            %pierdo los 3 primeros
    
    A=rand(i,i);
        while (det(A)==0)
            
            A=rand(i,i);  %para que A sea no singular,
                          %pero no debe haber problema con esto
        end
        
    x=rand(i,1);
    b=A*x;    
    
    %medir tiempo con dependencia cubica
    %t0=datetime();
    tic;
    [L,U]=descompLU(A);
    xf=(sols_posta_inci_a(L,U,b))';
    t1(i-3)=toc;
    %t1(i-3)=seconds(datetime()-t0);%cuento el tiempo
    %matlab me tira tiempos nulos, no me sirven para la grafica
    cont(i-3)=descompLUcont(A);       %la cantidad de pasos del metodo
    
    %ahora verifico que LU resuelva hallando la x que era rand a partir de
    %la b que calcule arriba
    
    if (norm(xf-x)<10^-6)
        disp("Resuelve el sistema");
        else
        disp("No se resuelve");    
    end
        
        
end

tlog=log(t1);
%contlog=log(cont);
logn=log(4:n);

tpol=polyfit(logn, tlog ,1);
%contpol=polyfit(logn, contlog ,1);
%disp(contlog);
%pendiente tiene q ser 3 por lo q tpol(1) es aprox 3 idem para contpol

%disp("Pendiente de log de los tiempos contra log de n:")
disp(tpol(1));

disp("Ese es el orden del metodo");
a=4:n;
s=cont;
t=t1;
end


