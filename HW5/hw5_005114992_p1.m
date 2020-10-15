%Problem 1: Optimization
%Benjamin Asdell, UID: 005114992
%Uses central difference gradient descent and Newton's second order method
%to minimize a given convex function

clear all; clc; close all;
%optimizing the given function
x0 = 4;
iterations = 100;
xMins = gradientDescent(@f,x0,iterations);
%calculating error based on global min at x = 2/3
error = abs(xMins - 2/3); %global min found by hand
plot(1:iterations, error);
hold on
xlabel('Iteration Number');
ylabel('Error Magnitude');
xMins = newtonsMethod(@f,x0,iterations);
error = abs(xMins - 2/3);
plot(1:iterations,error);
legend('Gradient Descent', "Newton's Method");
hold off
title('Optimization of 3x^2- 4x + 6 Using Two Different Methods');
saveas(gcf,'hw5_005144992_p1.jpg');
%function declaration
function fx = f(x)
    fx = 3*x^2 -4*x + 6;
end