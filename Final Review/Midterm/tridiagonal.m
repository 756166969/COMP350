function x = tridiagonal(n)
range = [1 50];
%range of integers

x = full(gallery('tridiag', n, randi(range, 1, n-1), randi(range, 1, n), randi(range, 1, n-1)));