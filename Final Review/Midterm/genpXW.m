function x = genpXW(A, b)
% genp.m    Gauss elimination with no pivoting
% 
% input:  A is an n x n nonsingular matrix
%         b is an n x 1 vector
% output: x is the solution of Ax=b.
%
n = length(b);

for k = 1:n-1  
    i = k+1:n; 
   
   A(i,k) = A(i,k)/A(k,k);  
   A(i,i) = A(i,i) - A(i,k)*A(k,i); 
   b(i) = b(i) - A(i,k)*b(k);  
end


x = zeros(n,1);
x(n) = b(n)/A(n,n);

for k = n-1:-1:1  
  x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
end
