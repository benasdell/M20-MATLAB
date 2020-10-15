%Problem 3: Trigonometric Calculation
%Benjamin Asdell
%UID: 005114992
%Utilizes trig identities to estimate the value of trig functions with
%uncommon angles and displays them

%Given values
c16 = 0.96126169593;
c60 = 0.5;
%Half Angle iterations from cos60
c30 = sqrt((1+c60)/2);
c15 = sqrt((1+c30)/2);
%Half Angle iterations from cos16
c8 = sqrt((1+c16)/2);
c4 = sqrt((1+c8)/2);
%Final trig identity manipulations
s15 = sqrt(1-c15^2);
s4 = sqrt(1-c4^2);
c11 = c15*c4 - s15*-s4;
s11 = sqrt(1-c11^2);
%output
fprintf('cos(11°) = %8.5f \nsin(11°) = %8.5f', c11, s11);
