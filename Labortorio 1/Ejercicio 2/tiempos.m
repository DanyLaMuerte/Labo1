function [t1,t2]=tiempos(n) %luego le paso n pero cuidado, con 20 muere
%corralo bajo su propio riesgo, recomiendo max 13
tol=0.000001;
t1=zeros(1,n);
t2=zeros(1,n);
for i=1:n
    N=8*i*i*i;
    
    [A,b]=generatellena(i);
    tic;
    %t0=datetime();      %esta parte es para la llena
    pcg(A,b',tol,N,{},{},zeros(N,1));
    t1(i)=toc;
    
    
    [A,b]=generaterala(i);  %esta otra es para la rala
    tic;
    pcg(A,b',tol,N,{},{},zeros(N,1));
    %t2(i)=seconds(datetime()-t0);
    t2(i)=toc;
end

dif=t1-t2;
disp("t1: tiempos con llena");
disp("t2: tiempos con rala");
disp("diferencia:");
disp(dif);
plot(1:n,t1,'-o',1:n,t2,'-*')


end