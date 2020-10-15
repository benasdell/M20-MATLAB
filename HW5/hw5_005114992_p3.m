%Problem 3: Linear Regression
%Benjamin Asdell, UID: 005114992
%Applies a linear regression function to a sample data set, plots the
%values, and analyzes the fit of the data

clear all; clc; close all;
%plotting data set
load('hw5_p4_dataset.mat');
plot(x,y, 'g');
hold on
%plotting line of best fit
[alpha, beta] = linearRegression(x,y);
Y = alpha + beta*x;
plot(x,Y, 'r');
xlabel('X');
ylabel('Y');
legend('Original Data Set', 'Line of Best Fit');
title('Linear Regression of Given Data Set');
%coefficient of determination calculation and display
sRes = sum((y - alpha - beta*x).^2);
sTotal = sum((y-mean(y)).^2);
r2 = 1 - sRes/sTotal;
txt = ['r^2 = ' num2str(r2)];
text(5, 0, txt);
saveas(gcf,'hw5_005114992_p3.jpg'); 