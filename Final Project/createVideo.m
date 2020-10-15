%Final Project
%Benjamin Asdell, UID: 005114992
%Optimizes joint angles of 4-piece simulated robotic arm in order to avoid
%certain obstacles and reach a goal endpoint

clc; clear all; close all;
%function handles and constants for genetic algorithm input
f = @fitness;
d = @decodeChromosome;
populationSize = 1001;
%implementing genetic algorithm
pCrossover = 0.8;
pMutation = 0.3;
xOpt = geneticAlgorithmVideo(f,d,populationSize,pCrossover,pMutation);
fprintf('The final optimized angles (in radians) are:\n%f, %f, %f, and %f \n',xOpt(1),xOpt(2),xOpt(3),xOpt(4));    