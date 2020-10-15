%Problem 1: Correlation Coefficient of Lynx and Hare Populations
%Benjamin Asdell, UID: 005114992
%Calculates and plots data for two competing populations as they change
%over time

clc;
%Part A: Generating data set
%initializing time-related constants
t_i = 0; t_f = 40;
dt = 0.01;
t_steps = ceil(t_f/dt);
t = linspace(t_i,t_f,t_steps);
%initializing data arrays
x = zeros(1,t_steps);y = zeros(1,t_steps);
x(1) = 20;
y(1) = 2;
%Discretized Lotka-Volterra calculation
for k = 2:t_steps
    x(k) = x(k-1) + dt*(0.4*x(k-1) - 0.018*x(k-1)*y(k-1));
    y(k) = y(k-1) + dt*(-0.8*y(k-1) + 0.023*x(k-1)*y(k-1));
end
%generating the plot
plot(t,x);
xlabel('Time (units)');
ylabel('Population (thousands)');
hold on
plot(t,y);
hold off
legend('Population X (Hare)', 'Population Y (Lynx)');
saveas(gcf, 'hw4_005114992_p1.png');
%Part B: One period data for correlation coefficient
%Subarrays extracted from original data arrays
x2 = x(520:1895);
y2 = y(520:1895);
%Setup for correlation calculation
x_avg = mean(x2);
y_avg = mean(y2);
x3 = x2 - x_avg;
y3 = y2 - y_avg;
a = sum(x3.*y3);
b = sum(x3.^2);
c = sum(y3.^2);
r = a/(sqrt(b)*sqrt(c));
fprintf('The correlation coefficient is: %1.5f', r);