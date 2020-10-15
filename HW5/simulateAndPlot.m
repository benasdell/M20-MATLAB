%Simulate and Plot (P2)
%Benjamin Asdell, UID: 005114992
%Simulates and plots first order differential equation using MATLAB's
%built-in ode45 function

function simulateAndPlot(f, tf, x0)
    [t,y] = ode45(f, [0 tf], x0);
    plot(t,y);
    xlabel('Time (units)');
    ylabel('Dependent Variable X');
end