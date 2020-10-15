%Problem 2: Monty Hall
%Benjamin Asdell, UID: 005114992
%Simulates Monty Hall problem to determine probabilities of picking the
%winning door and when switching is beneficial

clc; clear all; close all;
n = 10000; %number of trials
%simulating the player always switching
wins = 0;
x = ceil(3*rand(n,1));  %initial guess
y = ceil(3*rand(n,1)); %winning door
for k = 1:n
    if x(k) ~= y(k) %if initial guess is wrong, switching always wins
        wins = wins + 1;
    end
end
switchwin = wins / n;
fprintf('The probability of winning when switching is: %1.4f \n', switchwin);
switchloss = 1 - switchwin;
fprintf('The probability of losing when switching is: %1.4f \n', switchloss);
%simulating the player always staying with their initial guess
wins = 0;
x = ceil(3*rand(n,1));  %initial guess
y = ceil(3*rand(n,1)); %winning door
for k = 1:n
    if x(k) == y(k)
        wins = wins + 1;
    end
end
staywin = wins / n;
fprintf('The probability of winning when staying is: %1.4f \n', staywin);
stayloss = 1 - staywin;
fprintf('The probability of losing when staying is: %1.4f \n', stayloss);