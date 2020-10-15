 %Problem 2: Pendulum Simulation
%Simulates and plots the position and velocity

clc;
%Part B: With Damping
%Initialization
t_i = 0; t_f = 100;
dt = 0.01;
t_steps = ceil(t_f/dt);
t = linspace(t_i,t_f,t_steps);
g = 10;
L = 10;
d = [0, 0.01, 10];
theta = zeros(1,t_steps);
w = zeros(1,t_steps);
theta(1) = 0.1;
w(1) = 0;
%Semi-Implicit Euler
for i = 1:3
    for k = 1:t_steps-1
        w(k+1) = (w(k) + dt*(-g/L)*sin(theta(k)))/(1+dt*L*d(i));
        theta(k+1) = theta(k) + dt*w(k+1);
    end
plot(t,theta);
hold on
end
hold off
xlabel('Time (units)');
ylabel('Angular Position (radians)');
legend('d = 0', 'd = 0.01', 'd = 10');
saveas(gcf, 'dampingpositioncomparison.png');