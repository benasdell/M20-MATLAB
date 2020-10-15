%Problem 1: Euler-Bernoulli Beam Bending
%Benjamin Asdell, UID: 005114992
%Simulates stress from a point force on a hollow steel beam and the
%resultant bending across the length of the beam

clc; close all; clear all;
%initialize all constants from assignment
L = 1; %beam length
a = 0.075; %outer width
b = 0.065; %inner width
P = 800; %force applied
d = 0.99999999; %distance force is applied
E = 2*10^11; %elastic modulus in N/m^2
I = (a^4 - b^4)/12; %moment of inertia
%creating discretized nodes for beam
N = 100; %node count
x = linspace(0, L, N); %node points along beam
delta_x = x(2)-x(1); %node separation distance
A = zeros(N,N); %building A matrix
A(1,1) = 1; A(N,N) = 1;
for row = 2:N-1 
      A(row,row - 1) = 1;
      A(row,row) = -2;
      A(row,row+1) = 1;
end
b = zeros(N,1);
b(1) = 0; b(N)= 0; %enforcing boundary conditions
for k = 2:N-1
    b(k) = (delta_x)^2 * bendingMoment(P,d,L,x(k)) / (E*I);
end
y = A\b;%solves for y displacement
%plotting displacement against  x
plot(x,y,'o-');
xlabel('Distance X along Beam (m)');
ylabel('Displacement Y From Rest (m)');
title('Euler-Bernoulli Beam Bending');
saveas(gcf,'hw7_005114992_p1.png');
%calculating theoretical y displacement maximum
c = min(d,L-d);
y_theo = (P*c*(L^2 - c^2)^1.5) / (9*sqrt(3)*E*I*L);
%calculating percent error
error = abs(max(y) - y_theo)/abs(y_theo) * 100;

