function [Linv]=inverLut(L)% invierte matriz L triangular unitaria inferior
                           % cambiando el signo de los q estan bajo la
                           % diagonal
    nn=size(L);
    n=nn(1);
    for j=1:n
        for i=j+1:n
            L(i,j)=-1*L(i,j);
        end
    end
    Linv=L;

end %function