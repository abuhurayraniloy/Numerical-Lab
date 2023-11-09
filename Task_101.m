a = input('Enter first matrix: ');
b = input('Enter second matrix: ');
r = rows(b);
c = columns(a);

%Maximum value of the first matrix
mx = max(a);
fprintf('Maximum value of A matrix: %d\n', mx);

%Matrix Multiplication
if r == c
  result = a*b;
  fprintf('Product of A and B: \n');
  disp(result);
else
  fprintf('Matrix multiplication is impossible');
end

