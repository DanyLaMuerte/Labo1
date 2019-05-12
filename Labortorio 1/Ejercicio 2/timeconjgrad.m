function [t1,t2,t3,t4,k1,k2]=timeconjgrad(n)

k1=zeros(1,5);    % guardo numeros de condicion
k2=zeros(1,5);

tol=0.000001;
t1=zeros(1,n);    % con precond  pcg  al final
t2=zeros(1,n);    % sin precond  pcg
t3=zeros(1,n);    % barra invertida  \
t4=zeros(1,n);    % lu

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
    %usar formulita de ayuda F1 LU=PA y con lo anterior del pivoteo ejerc 1
    bn=sols_posta_inci_a(L,U,P*b');
    t4(i)=toc;
    
      if i<=5
      k1(i)=condest(A,2);
      disp('k1');  %autovalores sin precond, 
      disp(i);
      disp(k1(i));
      end
    [L,U]=ilu(sparse(A));   %duda con lo del setup, no es lo mismo
      if i<=5
      k2(i)=cond(inv(L*U)*A,2);    %ahora con precondicionamiento, condest
      disp('k1');
      disp(i);
      disp(k2(i));
      end
    tic;
    pcg(A,b',tol,N,L,U,x0);   %warning, cosas turbias a modificar
    t1(i)=toc;
    disp(bn);
end

end
