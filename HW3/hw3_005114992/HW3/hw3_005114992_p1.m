%Problem 1: Population of Two Species Under Competition
%Benjamin Asdell, UID: 005114992
%Computes the population of two competing species and plots their
%respective population sizes over time

clc;
%Initializing given constants
a = 3; b = 2; gamma = 2; p = 1.5; epsilon = 0.3; delta = 0.2;
%Initializing time constants for calculation
t_i = 0; t_f = 10; delta_t = 0.01;
t_steps = ceil(t_f/delta_t);
t = linspace(t_i, t_f, t_steps);
%Initializing population values
x = zeros(1,t_steps);
y = zeros(1,t_steps);
x(1) = 5;
y(1) = 2;
%Discretized Lotka-Volterra calculation
for k = 2:t_steps
    x(k) = x(k-1) + delta_t*x(k-1)*(a - epsilon*x(k-1) - b*y(k-1));
    y(k) = y(k-1) + delta_t*y(k-1)*(-gamma + p*x(k-1) - delta*y(k-1));
end
%Plotting functions
plot(t, x);
xlabel('Time (units)');
ylabel('Population (thousands)');
hold on
plot(t, y);
legend('Population X', 'Population Y');
hold off
saveas(gcf,'hw3_005114992_p1.png');
%output to command window
fprintf('The final X population is: %3.5f (thousands) \n', x(t_steps));
fprintf('The final Y population is: %3.5f (thousands)', y(t_steps));