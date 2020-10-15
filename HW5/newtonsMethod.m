%Newton's Method
%Benjamin Asdell, UID: 005114992
%Creates array of minimizer values based on first AND second derivatives of
%the given function

function xMins = newtonsMethod(f,x0,iterations)
    xMins(1) = x0;
    dx = 0.0001;
    for i = 1:iterations-1
       xMins(i+1) = xMins(i) - computeGradient(f,xMins(i),dx)/computeSecondGradient(f,xMins(i),dx); 
    end
end