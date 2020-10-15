%Problem 3: Numerical Integration
%Benjamin Asdell, UID: 005114992
%Numerically integrates a function using Monte Carlo method to converge
%probability of randomly selected values being under the curve to the true
%value of the integral

clc; close all; clear all;
i = 5000; %number of trials
n = 1:i; %number of samples in specific trial
count = zeros(1,i);
for j = 1:i
    x = 5*rand(n(j),1); %randomly picked x-value from [0,5]
    y = rand(n(j),1); %randomly picked y-value from [0,1]
    for k = 1:n(j)
        if y(k) <= 1/(x(k)^2 +1) %check if y-value is below curve
            count(j)  = count(j) + 1;
        end
    end
    count(j) = count(j)/n(j);
end
plot(n,5*count, 'r'); %area under curve is 1/5 of the total rectangle
hold on
yline(atan(5), 'b');
legend('Points under Curve', 'True Value of Integral');
title('Numerical Integration Using Monte Carlo Method');
saveas(gcf,'hw6_005114992_p3.png');