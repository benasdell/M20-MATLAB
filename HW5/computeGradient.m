%Compute Gradient
%Benjamin Asdell, UID: 005114992
%Calculates numerical first derivative of the given function at a point
%with a specified delta value

function dfdx = computeGradient(f,x,dx)
    dfdx = (f(x+dx)-f(x-dx))/2/dx;
end