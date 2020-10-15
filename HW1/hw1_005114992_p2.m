%Problem 2: Ellipse Calculations
%Benjamin Asdell
%UID: 005114992
%Uses eight different formulas to estimate the perimeter of an ellipse and
%displays them in tabular format2

%input prompts
a = input('Enter a: ');
b = input('Enter b: ');
%helper calculation for circlehood evaluation
h = ((a-b)/(a+b))^2;
%perimeter calculations
p1 = pi*(a + b);
p2 = pi*sqrt(2*(a^2 + b^2));
p3 = pi*sqrt(2*(a^2 + b^2) - ((a-b)^2)/2);
p4 = p1 * (1+h/8)^2;
p5 = p1 * (1+(3*h/(10+sqrt(4-3*h))));
p6 = p1 * ((64-3*h^2)/(64-16*h));
p7 = p1 * ((256-48*h-21*h^2)/(256-112*h+3*h^2));
p8 = p1 * (3-sqrt(1-h))/2;
%displays
fprintf('\n Calculation Results \n \n');
fprintf('%10.5f\t%10.5f\t%10.5f\t%10.5f\n',p1,p2,p3,p4);
fprintf('%10.5f\t%10.5f\t%10.5f\t%10.5f\n',p5,p6,p7,p8);