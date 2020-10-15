%Crossover
%Benjamin Asdell, UID: 005114992
%Performs crossover on two parent chromosomes with a probability pCrossover
%to create two daughter chromosomes

function [daughter1, daughter2] = crossover(chromosome1, chromosome2, pCrossover)
   if rand() <= pCrossover %crossover occurs
       k = randi(32,1); %random arbitrary crossover point
       %parts are defined left to right (bits indexed right to left)
       mask = uint32(bitshift(intmax('uint32'), k-32));
       first1 = bitand(chromosome1,mask); %first part of parent 1
       first2 = bitand(chromosome2, mask); %first part of parent 2
       mask = bitcmp(mask,'uint32'); %reverse mask
       second1 = bitand(chromosome1,mask); %second part of parent 1
       second2 = bitand(chromosome2,mask); %second part of parent 2
       %actual crossover
       daughter1 = bitor(first2,second1);
       daughter2 = bitor(first1,second2);
   else %no crossover, daughters identical to parents
      daughter1 = chromosome1;
      daughter2 = chromosome2;
   end
end