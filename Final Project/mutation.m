%Mutation
%Benjamin Asdell, UID: 005114992
%Randomly flips one bit in encoded chromosome with probability of
%occurrence pMutation

function mutatedChromosome = mutation(chromosome, pMutation)
    if rand() <= pMutation
        mutatedBit = randi(32,1); %location of mutation
        mask = bitset(0,mutatedBit);
        mutatedChromosome = bitxor(chromosome,mask);
    else
        mutatedChromosome = chromosome;
    end
end
    
