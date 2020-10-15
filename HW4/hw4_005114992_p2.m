%Problem 2: Pendulum Simulation
%Benjamin Asdell, UID: 005114992
%Simulates and plots the angular position of a pendulum in the
%presence of damping

clc;
%Part B: With Damping
%Initialization
t_i = 0; t_f = 50;
dt = 0.01;
t_steps = ceil(t_f/dt);
t = linspace(t_i,t_f,t_steps);
g = 10;
L = 10;
d = 0.01;
theta = zeros(1,t_steps);
w = zeros(1,t_steps);
theta(1) = 0.1;
w(1) = 0;
%explicit Euler
for k = 2:t_steps
    w(k) = w(k-1) + dt*((-g/L)*sin(theta(k-1)) - w(k-1)*L*d);
    theta(k) = theta(k-1) + dt*w(k-1);
end
plot(t,theta);
xlabel('Time (units)');
ylabel('Angular Position (radians)');
h2 = figure(2);
box on
hold on
%Semi-Implicit Euler
for k = 1:t_steps-1
    w(k+1) = (w(k) + dt*(-g/L)*sin(theta(k)))/(1+dt*L*d);
    theta(k+1) = theta(k) + dt*w(k+1);
end
plot(t,theta);
hold off
legend('Explicit Euler', 'Semi-Implicit Euler');
saveas(h2, 'dampingposition.png');