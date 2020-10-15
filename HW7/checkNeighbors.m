%Function: Check Neighbors
%Benjamin Asdell, UID: 005114992
%Checks neighbors of specified cell and returns number of live neighbors

function count = checkNeighbors(row,col,A)
    count = 0;
    %extracting dimension data from pased 2D grid
    sz = size(A);
    M = sz(1);
    N = sz(2);
    %directional arrays for location checking
    north = [mod(row-2,M)+1, col];
    south = [mod(row,M)+1, col];
    west = [row, mod(col - 2,N)+1];
    east = [row,  mod(col,N)+1];
    northeast = [mod(row-2,M)+1, mod(col,N)+1];
    northwest = [mod(row-2,M)+1, mod(col - 2,N)+1];
    southeast = [mod(row,M)+1,  mod(col,N)+1];
    southwest = [mod(row,M)+1,  mod(col - 2,N)+1];
    %counting the number of live neighbors
    neighbors = [north;south;west;east;northeast;northwest;southeast;southwest];
    for k = 1:8
        loc = neighbors(k,:);
        if A(loc(1),loc(2)) == 1
            count = count + 1;
        end
    end
end