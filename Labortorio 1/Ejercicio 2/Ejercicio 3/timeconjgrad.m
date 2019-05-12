function [t1,t2,t3,t4,k1,k2]=timeconjgrad(n) 

k1=zeros(1,n);
k2=zeros(1,n);

tol=0.000001;
t1=zeros(1,n);  %con precond  pcg  al final
t2=zeros(1,n);  %sin precond  pcg
t3=zeros(1,n);  % \
t4=zeros(1,n);  % lu   me falta este meto2

for i=1:n
    N=8*i*i*i;
    x0=zeros(N,1);

    [A,b]=generaterala(i);    
    
    tic;
    pcg(A,b',tol,N,{},{},x0);
    t2(i)=toc;
    
    
    tic;
    bn=A\b';
    t3(i)=toc;
    
    
    
    tic;
    [L,U,P] = lu(A);
    %usar formulita de ayuda F1 LU=PA  y con lo anterior del pivoteo ejerc 1
    bn=sols_posta_inci_a(L,U,P*b);
    t4(i)=toc;
    
    vals=eig(A);
    vals=abs(vals);
    k1(i)=max(vals)/min(vals);  %autovalores sin precond
    
    
    M=ilu(sparse(A));
    
    A=M*A;
    
    vals=eigs(A);
    vals=abs(vals);
    k2(i)=max(vals)/min(vals);  %ahora con precondicionamiento

    b=M*b';
    tic;
    pcg(A,b,tol,N,{},{},x0);
    t1(i)=toc;
end


end
