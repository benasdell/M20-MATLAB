%Problem 3: Quadratic Function Extrema
%Benjamin Asdell, UID: 005114992
%Takes in lower bound, upper bound, and coefficients of a quadratic
%function from the user and returns the minimum and maximum values of the
%function on that interval (while loops with TA approval)

clc; clear all;
%bound inputs
L = input('Left bound: ');
R = input('Right bound: ');
while (L > R) %verifies order of bounds
    fprintf('Please make sure L is less than R. \n');
    L = input('Left bound: ');
    R = input('Right bound: ');
end
a = input('a: ');
while (a == 0) %verifies function is quadratic
    fprintf('a should not be zero for a quadratic function. \n');
    a = input('a: ');
end
b = input('b: ');
c = input('c: ');
fL = a*L^2 + b*L + c;
fR = a*R^2 + b*R + c;
disc = b^2 - 4 * a * c; %discriminant of quadratic formula
fposs = [fL, fR]; %array containing all possible f values
if (disc > 0) %two real roots
    x1 = (-b + disc)/(2*a);
    x2 = (-b - disc)/(2*a);
    if (x1 >= L) && (x1 <= R) %conditional checking if root is within bounds
       f1 = a*x1^2 + b*x1 + c;
       fposs = [fposs, f1];
    end
    if (x2 >= L) && (x2 <= R) %second conditional is independent of the first
       f2 = a*x2^2 + b*x2 + c;
       fposs = [fposs, f2];
    end
    fmax = max(fposs);
    fmin = min(fposs);
elseif (disc == 0) %one real root
    x = -b/(2*a);
    if (x >= L) && (x <= R)
        fx = a*x^2 + b*x + c;
        fposs = [fposs, fx];
    end
    fmax = max(fposs);
    fmin = min(fposs);
elseif (disc < 0) %no real roots, only bounds are evaluated
    fmax = max(fposs);
    fmin = min(fposs);
end
%displays to command window
fprintf('The function is %dx^2 + %dx + %d \n', a, b, c);
fprintf('The minimum value over [%d, %d] is: %f \n', L, R, fmin);
fprintf('The maximum value over [%d, %d] is: %f \n', L, R, fmax);