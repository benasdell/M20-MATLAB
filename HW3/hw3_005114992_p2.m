%Problem 2: Improved Population of Two Species Under Competition
%Benjamin Asdell, UID: 005114992
%Computes and plots two population sizes over time, including the effect
%from other factors on population X

clc;
%Initializing given constants
a = 3; b = 2; gamma = 2; p = 1.5; epsilon = 0.3; delta = 0.2; sigma = -0.4;
%Initializing time constants for calculation
t_i = 0; t_f = 10; delta_t = 0.01;
t_l = 5; %beginning time instant for effect on X
t_steps = ceil(t_f/delta_t);
t = linspace(t_i, t_f, t_steps);
%Initializing population values
x = zeros(1,t_steps);
y = zeros(1,t_steps);
x(1) = 5;
y(1) = 2;
%Discretized Lotka-Volterra calculation
for k = 2: t_steps/2
    x(k) = x(k-1) + delta_t*x(k-1)*(a - epsilon*x(k-1) - b*y(k-1));
    y(k) = y(k-1) + delta_t*y(k-1)*(-gamma + p*x(k-1) - delta*y(k-1));
end
%Effect on X happens after 5 time units, or half the total duration
for k = t_steps/2:t_steps
    x(k) = x(k-1) + delta_t*x(k-1)*(a*exp(-((k*delta_t - t_l)^2)/(2*sigma^2)) - epsilon*x(k-1) - b*y(k-1));
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
saveas(gcf, 'hw3_005114992_p2.png');
%output to command window
fprintf('The final X population is: %3.5f (thousands) \n', x(t_steps));
fprintf('The final Y population is: %3.5f (thousands)', y(t_steps));