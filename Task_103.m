clc;

eq = input('Enter an equation(in terms of x): ', 's');
f = str2func(['@(x) ', eq]);
tol = input('Enter tolerance: ');
itr = 30;
results = [];

%Root calculation
for i = 1:5
  a = input('Enter first interval: ');
  b = input('Enter second interval: ');
  if f(a)*f(b) < 0
    break;
  else
    fprintf('No root lies between the given intervals.\n')
  end
end
for i = 1:itr
  c = (a*f(b) - b*f(a))/(f(b) - f(a));
  results = [c, results];
  if abs(c - b) < tol || abs(c - a) < tol
    break;
  endif
  if f(a)*f(c) < 0
    b = c;
  elseif f(b)*f(c) < 0
    a = c;
  end
end

fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(results');

%Graph visualization
x = 0:0.1:5;
hold on;
plot(x, f(x));
plot(c, f(c), 'or');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'xAxisLocation', 'origin');
legend('Function values ', 'Root');


