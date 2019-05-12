function [B]=intercambiofila(A,k,bu)
    nn=size(A);
    n=nn(1);
    for h=1:n
        aux=A(k,h); A(k,h)=A(bu,h); A(bu,h)=aux;
    end 
    B=A;
end %function