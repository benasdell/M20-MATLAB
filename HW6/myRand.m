%Function: myRand
%Benjamin Asdell, UID: 005114992
%Calculates random sample of custom probability distribution using a random
%sample of the output and the inverse of the distribution function

function x = myRand()
y = rand();
x = -1 + 2*sqrt(y);
end