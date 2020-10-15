%Gradient Descent
%Benjamin Asdell, UID: 005114992
%Creates array of minimizer values based on first derivative of
%the given function

function xMins = gradientDescent(f,x0,iterations)
    xMins(1) = x0;
    gamma = 0.01;
    dx = 0.0001;
    for i = 1:iterations-1
       xMins(i+1) = xMins(i) - gamma*computeGradient(f,xMins(i),dx); 
    end
end