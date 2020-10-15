%Problem 1: Day of the Week Calculator
%Benjamin Asdell, UID: 005114992
%Takes in user input for a certain date and uses a formula given in the
%assignment to output what day of the week it is

clc; clear all;
year = input('Please enter the year as YYYY (e.g. 2008): ');
if (mod(year,1) ~= 0) %year must be an integer
    error('Invalid input.');
end
month = input('Please enter the month as MMM (e.g. FEB): ', 's');
strday = input('Please enter the day as DD (e.g. 06): ', 's');
day = str2num(strday); %converts output day string to usable numeric value
if (mod(day, 1) ~= 0) %day must be an integer
    error('Invalid input.');
elseif (length(strday) ~= 2)
    error('Invalid input. (day must be entered as DD)');
end
validMonths = ["JAN";"FEB";"MAR";"APR";"MAY";"JUN";"JUL";"AUG";"SEP";"OCT";"NOV";"DEC"];
month = upper(month);
%month index search
X = ~cellfun('isempty', strfind(validMonths, month)); %builds 12x1 logical array where only selected month is true
midx = find(X); %finds the user selected month value from above array
%leap year verification
is_leap = (mod(year, 4) == 0) && (mod(year, 100) ~= 0) || (mod(year, 400) == 0);
%all date verifications
if (year < 0000) || (year > 9999) || (mod(year, 1) ~= 0) %year is integer within acceptable range
    error('Invalid input.');
elseif (contains(validMonths, month) == false) %month is valid
    error('Invalid input.');
elseif (strcmp(month, 'FEB') == 1) %date exists in february
    if (is_leap == false) && (day > 28)
        error('Invalid input.');
    elseif (is_leap == true) && (day > 29)
        error('Invalid input.');
    end
elseif (day > 31) %no month has 32 days
    error('Invalid input.');
elseif (day > 30) && ((strcmp(month, 'APR') == 1) || ... %days with only 30 days
        (strcmp(month, 'JUN') == 1) || (strcmp(month, 'SEP') == 1) || (strcmp(month, 'NOV') == 1))
    error('Invalid input.');
end
%day of the week preparation
myear = year; %sets modified year to actual year regardless of modification
if (midx <= 2)
    myear = year - 1; %modified year for january and february
end
m = (mod((midx + 9), 12)) + 1; %shifted month
yr = myear/1000;
a = floor(yr); %holds thousands place
b = myear - a * 1000;
b = b/100;
b = floor(b); %holds hundreds place
c = [num2str(a), num2str(b)]; 
c = str2num(c); %first two digits of year
i = myear - a * 1000 - b * 100;
i = i / 10;
i = floor(i); %holds tens place
j = myear - a * 1000 - b * 100 - i * 10; %holds ones place
y = [num2str(i), num2str(j)];
y = str2num(y); %last two digits of year
%day of the week calculation
w = day + floor(2.6*m - 0.2) + y + floor(y/4) + floor(c/4) - 2*c;
w = mod(w, 7);
%assigning day number to day name
dayList = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
%output to command window
fprintf('%s %s %s is a %s. \n', month, strday, num2str(year), dayList(w+1));
if (w == 0) || (w == 6)
    fprintf('Yay, it is a weekend!');
end