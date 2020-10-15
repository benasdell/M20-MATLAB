%Problem 2: The Game of Life
%Benjamin Asdell, UID: 005114992
%Simulates John Conway's 'Game of Life' on a 2D grid with wraparound
%boundaries

clc; close all; clear all;
%initialize 2D game grid
num_rows = 180;
num_cols = 140;
A = zeros(num_rows,num_cols); 
for i = 1:num_rows %initialization of 2D grid 'ecosystem'
    for j = 1:num_cols
        if rand() <= 0.8
            A(i,j) = 0;
        else 
            A(i,j) = 1;
        end
    end
end
imagesc(A)
saveas(gcf,'initial.png')
%initial distribution validated to be around 20% alive
%life cycle mechanism
t_i = 0;
t_f = 300;
t = linspace(t_i,t_f,t_f); 
A_new = zeros(num_rows,num_cols); %updated each time step
celltotal = numel(A); %number of total cells, alive or dead
B = zeros(1,t_f); %array for plotting living cells over time
%setup for video creation
vidHandle = VideoWriter('Game of Life','MPEG-4');
vidHandle.Quality = 100;
vidHandle.FrameRate = 30;
open(vidHandle);
im = figure();
%game simulation
for k = 1:t_f
    for row = 1:num_rows
        for col = 1:num_cols
            live = checkNeighbors(row,col,A);
            if A(row,col) == 1
                if live < 2 || live > 3
                    A_new(row,col) = 0;
                else
                    A_new(row,col) = 1;
                    if rand() >= 0.99
                        A_new(row,col) = 0;
                    end
                end
            else
                if live == 3
                    A_new(row,col) = 1;
                end
            end
        end
    end
    livetotal = nnz(A==1); %number of living cells at this timestep
    B(k) = livetotal/celltotal;
    A = A_new;
    imagesc(A);
    colorbar('Ticks',[0,1], 'TickLabels',{'Dead','Alive'})
    title('Simulation of the Game of Life');
    xlabel('X');
    ylabel('Y');
    writeVideo(vidHandle,getframe(im));
end
imagesc(A);
saveas(gcf,'final.png')
close(vidHandle);
figure
plot(t,B);
xlabel('Time (generations)');
ylabel('Fraction of Living Cells Out of Total');
axis([0 300 0 0.25]);
title('Living Cell Population in the Game of Life');
saveas(gcf,'hw7_005114992_p2.png');