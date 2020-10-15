%Problem 3: Permutation
%Benjamin Asdell, UID: 005114992
%Calculates permutation of two integer inputs, n and r

clc;
%User input
n = input('Enter an integer n for the total number of objects: ');
while (mod(n,1) ~= 0)
    n = input('Enter an integer n for the total number of objects: ');
end
r = input('Enter an integer r for the sample: ');
while (mod(r,1) ~= 0)
    r = input('Enter an integer r for the sample: ');
end
%Permutation calculation
P = fact(n) / fact(n-r);
%output to command window
fprintf('The number of permutations is %i.', P);

%Factorial function creation
function f = fact(n)
    f = prod(1:n);
end