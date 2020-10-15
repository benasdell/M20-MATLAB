%Problem 4: Dropping Needle on a Grid
%Benjamin Asdell, UID: 005114992
%Simulates randomly dropping needles onto a tiled grid to calculate
%probability that a given needle crosses a grid line

clc; close all; clear all;
%constants for all trials
n = 10000; %number of needles dropped
gridWidth = 10;
gridHeight = 10;
%constants for multiple trial setup
i = 16; %number of needle lengths
L = linspace(0.1, 1.6, i);
count = zeros(1,i);
for j = 1:i %i trials, one per needle length value
    for k = 1:n %n needles dropped per trial
        [x,y,theta] = dropNeedle(L(j), gridWidth, gridHeight);
        x2 = x + L(j)*cospi(theta);
        y2 = y + L(j)*sinpi(theta);
        if floor(x2) ~= floor(x) %checks that endpts are in same x-interval
            count(j) = count(j) + 1;
        elseif floor(y2) ~= floor(y) %checks that endpts are in same y-interval
            count(j) = count(j) + 1;
        end
    end    
end
count = count / n;
%plotting grid crosses vs length
plot(L, count);
axis([0.1 1.6 0 1]);
xlabel('Needle Length (units)');
ylabel('Probability of Crossing Grid Lines');
title('Dropping Needles on a Grid Using Monte Carlo Method');
saveas(gcf, 'hw6_005114992_p4.png');