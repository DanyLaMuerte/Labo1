function [k]=condnumb(A)

t=abs(eig(full(A)));
disp(t);
k=max(t)/min(t);

end
