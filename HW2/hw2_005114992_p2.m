%Problem 2: Neighbor Identification
%Benjamin Asdell, UID: 005114992
%Examines the adjacent cells to a user selected cell in a 2D array and
%prints the linear indexes of those neighbors to command window (while
%loops with TA approval)

clc; clear all;
%user inputs
while (true)
    M = input('Select the number of rows: ');
    N = input('Select the number of columns: ');
    if (M >= 3) && (mod(M,1) == 0) && (N >= 3) && (mod(N,1) == 0)
        break
    end
    disp('M or N must be greater than or equal to 3.');
end
P = input('Select a specific cell: ');
while (P < 1) || (P > M*N) || (mod(P,1) ~= 0)
    disp('P must be greater than 0 and within the product of rows and columns.');
    P = input('Select a specific cell: ');
end
%arrays holding various offsets from P depending on condition
B = [];
neighbors = [P - M - 1, P - M, P - M + 1, P - 1, P + 1, P + M - 1, P + M, P + M + 1];
topleft = [P + 1, P + M + 1];
botleft = [P - 1, P + M - 1];
topright = [P + 1, P - M + 1];
botright = [P - 1, P - M - 1];
%conditionals handling each positional case
if (P <= M) %left wall
    B = [B, P + M];
    if (mod(P,M) == 1)
        B = [B, topleft];
        disp('Corner node');
    elseif (mod(P,M) == 0)
        B = [B, botleft];
        disp('Corner node');
    else
        B = [B, topleft, botleft];
    end
elseif (P > M*(N-1)) %right wall
    B = [B, P - M];
    if (mod(P,M) == 1)
        B = [B, topright];
        disp('Corner node');
    elseif (mod(P,M) == 0)
        B = [B, botright];
        disp('Corner node');
    else
        B = [B, topright, botright];
    end
elseif (P > M) && (P <= M*(N-1))
    if (mod(P,M) == 1)
         B = [B, P - M, P + M, P + 1, P + M + 1, P - M - 1]; 
    elseif (mod(P,M) == 0)
         B = [B, P - M, P + M, P - 1, P + M - 1, P - M - 1];  
    else %any middle cell
         B = [B, neighbors];
    end
end
C = sort(B);
disp(C);