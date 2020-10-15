%Compute Second Gradient
%Benjamin Asdell, UID: 005114992
%Calculates numerical second derivative of the given function at a point
%with a specified delta value

function d2ydx2 = computeSecondGradient(f, x, dx)
    d2ydx2 = (f(x+dx) - 2*f(x) + f(x-dx))/dx/dx;
end