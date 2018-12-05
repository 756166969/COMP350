function x = geppMyVersion(A, b)

n = length(b);

for k = 1 : n-1
   [maxval, maxindex] = max(abs(A(k:n, k)));
   q = maxindex + k - 1;
   if maxval == 0, error("A is singular"), end
   
   A([k, q], k:n) = A([q, k], k:n);
   % We just need to switch from kth element to nth element
   % Because any elements before them are 0
   
   b([k, q]) = b([q, k]);
   % Now, we have already switched two rows
   
   for i = k+1 : n
        multi = A(i, k)/A(k,k);
        A(i, k+1:n) = A(i, k+1:n) - A(k, k+1:n) * multi;
        % We start from column k+1
        % Because any column before that is 0
        b(i) = b(i) - b(k) * multi;
   end
      
end

x = zeros(n, 1);

x(n) = b(n)/ A(n,n);

for k = n-1:-1:1
   x(k) = ( b(k) - A(k, k+1 : n) * x(k+1:n) ) / A(k,k); 
end