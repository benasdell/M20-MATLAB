%Genetic Algorithm
%Benjamin Asdell, UID: 005114992
%Utilizes 4-step optimization process over several generations to find the
%optimal set of angles based on fitness and prints a graph of the maximum
%fitness of each generation over time

function xOpt = geneticAlgorithm(fitness, decodeChromosome, populationSize, pCrossover, pMutation)
    %initialization of random individuals in population array
    population = uint32(randi(intmax('uint32'),populationSize,1));
    %initializations for scope
    highestFitnessScore = 0;
    p_elite = population(1);
    genCount = 0;
    while 0.99 >= highestFitnessScore %while fittest not converged
        %selection step
        newPopulation = selection(population, @fitness, @decodeChromosome);
        %crossover step
        for k = 2:2:populationSize
            [newPopulation(k), newPopulation(k-1)] = crossover(newPopulation(k),newPopulation(k-1),pCrossover);
        end
        %mutation step
        m = @(newPopulation) mutation(newPopulation,pMutation);
        newPopulation = arrayfun(m,newPopulation);
        %elitism step (also determines convergence)
        for k = 1:populationSize
            p = decodeChromosome(population(k));
            if fitness(p) >= fitness(decodeChromosome(p_elite))
                p_elite = population(k);
            end
        end
        %sets highest fitness score to break loop if already converged
        highestFitnessScore = fitness(decodeChromosome(p_elite));
        %extracting data for plotting
        maxFitness(genCount + 1) = highestFitnessScore;
        genCount = genCount + 1;
        %updating population for next generation
        population = [newPopulation; p_elite];
        decodedPopulation = arrayfun(@(population)decodeChromosome(population),population, 'UniformOutput', false);
        fitData = zeros(populationSize,1);
        for k = 1:numel(decodedPopulation)
            fitData(k) = fitness(decodedPopulation{k}(1:4));
        end
        %plotting histogram of current population
        histogram(fitData,'Normalization','probability','BinWidth',1/24,'NumBins',24)
        ylim([0 1])
        xlabel('Normalized Fitness Scores')
        ylabel('Portion of Population')
        title('Distribution of Chromosomes According to Normalized Fitness')
    end
    saveas(gcf,'fitnessHistogram.png');
    xOpt = decodeChromosome(p_elite);
    %plotting max fitness vs generation
    figure
    hold on
    plot(maxFitness)
    title('Max Fitness Score per Generation')
    xlabel('Generation Count')
    ylabel('Normalized Fitness Score')
    hold off
    saveas(gcf,'generationFitness.png')
end