function [L,U,P] = luppMyVersion(A)

n = size(A,1);
P = eye(n);

for k = 1 : n-1
    [maxval, maxind] = max( abs(A(k:n, k)) );
    q = maxind + k - 1;
    if maxval == 0, error("A is singular"),end
    
    P([k,q], :) = P([q,k],:);
    A([k,q], :) = A([q,k],:);
    %You need to change entire two Rows here
    
    for i = k+1 : n
        A(i,k) = A(i, k) / A(k,k);
        A(i, k+1 : n) = A(i, k+1 : n) - A(i, k) * A(k, k+1: n);
    end
    
end

L = tril(A, -1) + eye(n);
U = triu(A);