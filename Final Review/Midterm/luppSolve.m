function x = luppSolve(A, b)

n = size(A,1);
P = eye(n);

for k = 1 : n-1
    [maxval, maxind] = max( abs(A(k:n, k)) );
    q = maxind + k - 1;
    if maxval == 0, error("A is singular"),end
    
    P([k,q], :) = P([q,k],:);
    A([k,q], :) = A([q,k],:);
    %You need to change entire two Rows here
    b([k,q]) = b([q, k]);
    
    for i = k+1 : n
        A(i,k) = A(i, k) / A(k,k);
        A(i, k+1 : n) = A(i, k+1 : n) - A(i, k) * A(k, k+1: n);
    end
    
end
L = tril(A,-1) + eye(n);
U = triu(A);

x = zeros(n, 1);


x(1) = b(1);
for k = 2 : n
   x(k) = b(k) - L(k, 1:k - 1) * x(1: k-1);  
end

x(n) = x(n)/ U(n,n);
for k = n-1 : -1 : 1
    x(k) = (x(k) -  U(k, k+1:n) * x(k+1:n)  ) / U(k,k);
end



