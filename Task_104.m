clc;
pkg load symbolic;

eq = input('Enter an equation(in terms of x): ', 's');
f = str2func(['@(x) ', eq]);
syms x;
ff = diff(f(x), x);
k = matlabFunction(ff);
tol = input('Enter tolerance: ');
itr = 30;
results = [];

for i = 1:5
  a = input('Enter first interval: ');
  b = input('Enter second interval: ');
  if f(a)*f(b) < 0
    break;
  else
    fprintf('No root between given intervals.\n')
  end
end

c = (a+b)/2;

%Root calculation
for i = 1:itr
  f_c = f(c);
  k_c = k(c);
  results = [c, results];
  d = c - (f_c/k_c);
  if abs(d-c) <= tol
    break;
  endif
  c = d;
end

fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(results');

%Graph visualization
x = 0:0.1:10;
hold on;
plot(x, f(x));
plot(c, f(c), 'xr');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'xAxisLocation', 'origin');
legend('Function values ', 'Root');
fprintf('Root is %0.3f\n', c);
disp(results');
