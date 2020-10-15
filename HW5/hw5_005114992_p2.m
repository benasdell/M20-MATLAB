%Problem 2: Simulating Dynamics
%Benjamin Asdell, UID: 005114992
%Simulates and plots multiple first order differential equations of the
%same form but with different parameters

clear all; clc; close all;
%initialize constants
tf = 10.0;
x0 = 1.0;
%Trial 1 values
f_handle = @(t,x) -x/2; %k = 0, tau = 2
figure
simulateAndPlot(f_handle, tf, x0);
axis([0 tf -1 3]);
title('Trial 1');
saveas(gcf, 'p2trial1.png');
%Trial 2 values
f_handle = @(t,x) -1-x; %k = -1, tau = 1
figure
simulateAndPlot(f_handle, tf, x0);
axis([0 tf -1 3]);
title('Trial 2');
saveas(gcf, 'p2trial2.png');
%Trial 3 values
f_handle = @(t,x) (2-x)/4; %k = 2, tau = 4
figure
simulateAndPlot(f_handle, tf, x0);
axis([0 tf -1 3]);
title('Trial 3');
saveas(gcf, 'p2trial3.png');
%Trial 4 values
f_handle = @(t,x) (3-x)/5; %k = 3, tau = 5
figure
simulateAndPlot(f_handle, tf, x0);
axis([0 tf -1 3]);
title('Trial 4');
saveas(gcf, 'p2trial4.png');