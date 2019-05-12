function [t1,t2]=tiempo1(i) %luego le paso n pero cuidado, con 20 muere
%corralo bajo su propio riesgo, recomiendo max 13
%esta es basicamente pa probar hasta cual puedo llegar, ver tiempos()
tol=0.000001;
    N=8*i*i*i;
    
    [A,b]=generatellena(i);
    tic;
    %t0=datetime();      %esta parte es para la llena
    pcg(A,b',tol,N,{},{},zeros(N,1));
    t1=toc;
    
    
    [A,b]=generaterala(i);  %esta otra es para la rala
    tic;
    pcg(A,b',tol,N,{},{},zeros(N,1));
    %t2(i)=seconds(datetime()-t0);
    t2=toc;
end


