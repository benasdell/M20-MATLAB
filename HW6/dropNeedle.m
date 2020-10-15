%Function: dropNeedle
%Benjamin Asdell, UID: 005114992
%Simulates dropping a needle with x,y coordinates and phase angle from
%x-axis onto a tiled grid

function [x,y,theta] = dropNeedle(L, gridWidth, gridHeight)
    x2 = 10; y2 = 10; %initializes second endpoint
    while x2 >= gridWidth || y2 >= gridHeight %check that needle is on grid
        x = gridWidth*rand(1);
        y = gridHeight*rand(1);
        theta = 2*rand(1); %trig functions multiply value by pi
        x2 = x + L*cospi(theta); %x-coord for second endpt
        y2 = y + L*sinpi(theta); %y-coord for second endpt
    end
end