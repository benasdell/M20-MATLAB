%Selection
%Benjamin Asdell, UID: 005114992
%Creates a subpopulation array of chromosomes from a given population array
%that is 1 size smaller than the initial population

function  chromosomeSubpopulation = selection(chromosomePopulation, fitness, decode)
    size = length(chromosomePopulation);
    chromosomeSubpopulation = zeros(size-1,1,'uint32');
    for k = 1:length(chromosomeSubpopulation)
        %selecting two random indices of input array
        idx1 = randi(size,1); 
        idx2 = randi(size,1);
        %selecting encoded chromosome from input array at above indices
        p1 = chromosomePopulation(idx1);
        p2 = chromosomePopulation(idx2);
        %fitness comparisons to append to subpopulation array
        if fitness(decode(p1)) > fitness(decode(p2))
            chromosomeSubpopulation(k) = p1;
        elseif fitness(decode(p2)) > fitness(decode(p1))
            chromosomeSubpopulation(k) = p2;
        else %equality case, always selects p1
            chromosomeSubpopulation(k) = p1;
        end
    end
end