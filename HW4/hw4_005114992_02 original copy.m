%Problem 2: Pendulum Simulation
%Simulates and plots the position and velocity

clc;
%Part A: Without Damping
%Initialization
t_i = 0; t_f = 50;
dt = 0.01;
t_steps = ceil(t_f/dt);
t = linspace(t_i,t_f,t_steps);
g = 10;
L = 10;
theta = zeros(1,t_steps);
w = zeros(1,t_steps);
theta(1) = 0.1;
w(1) = 0;
%Explicit Euler
for k = 2:t_steps
    w(k) = w(k-1) + dt*(-g/L)*sin(theta(k-1));
    theta(k) = theta(k-1) + dt*w(k-1);
end
plot(t,theta);
xlabel('Time (units)');
ylabel('Angular Position (radians)');
h1 = figure(1);
box on
hold on
%Semi-implicit Euler
for k = 1:t_steps-1
    w(k+1) = w(k) + dt*(-g/L)*sin(theta(k));
    theta(k+1) = theta(k) + dt*w(k+1);
end
plot(t,theta);
hold off
legend('Explicit Euler', 'Semi-Implicit Euler');
saveas(h1, 'position.png');
