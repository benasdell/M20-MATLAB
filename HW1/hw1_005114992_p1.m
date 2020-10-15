%Problem 1: I Love M20
%Benjamin Asdell
%UID: 005114992
%Prints a simple message to the command window about how much I love this
%class

%user input
str1 = input('Enter a phrase: ', 's');
str2 = input('Enter another phrase: ', 's');
%horizontal flip of second phrase
str3 = fliplr(str2);
fprintf('%s %s \n', str1, str3);