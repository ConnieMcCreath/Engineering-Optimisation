function gaMultiObjective ()

clc
clear all
close all


FitnessFunction = @(x)DragCost3 (x);% objective

nvars = 6;

lb = [0, 0, 0, 0, 0, 0];
ub = [10, 10, 100, 1000, 2000, 10000];

popsize = 75;
maxgen = 2;


options.DistanceMeasureFcn = {@distancecrowding,'genotype'}; %defining options
options = optimoptions('gamultiobj','PopulationSize',popsize,'PlotFcn',@gaplotpareto,'MaxGenerations',maxgen,'ParetoFraction',0.5);


tic
[xval,fval,exitflag,output,population,scores] = gamultiobj(FitnessFunction,nvars,[],[],[],[],lb,ub,options);
toc

%Display corresponding f values and x values
fval
xval

exitflag
output
end
