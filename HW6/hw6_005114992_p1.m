%Problem 1: Implementing Custom Probability Distributions
%Benjamin Asdell, UID: 005114992
%Modifies the process of gathering normal distributions to calculate
%probability samples on a non-uniform distribution

clc; clear all; close all;
n = 10000; %number of samples
X = zeros(1,n);
for k = 1:n - 1
    X(k) = myRand();
end
histogram(X, 'Normalization', 'pdf');
hold on
fplot(@(x) x/2 + 1/2, [-1 1]);
hold off
xlabel('Sample X');
ylabel('Probability Y Occurrence');
legend('Probability','p(x) = x/2 + 1/2');
legend('Location', 'northwest');
title('Custom Probability Distribution Histogram');
saveas(gcf,'hw6_005114992_p1.png');