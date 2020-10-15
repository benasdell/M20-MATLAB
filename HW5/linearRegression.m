%Linear Regression
%Benjamin Asdell, UID: 005114992
%Use covariance and variance of sample data sets to find optimal alpha and
%beta values for a line of best fit to the data
function [alpha, beta] = linearRegression(x,y)
    beta = calculateCovariance(x,y)/calculateCovariance(x,x); %var(x) = cov(x,x)
    x_bar = mean(x);
    y_bar = mean(y);
    alpha = y_bar - beta*x_bar;
end

