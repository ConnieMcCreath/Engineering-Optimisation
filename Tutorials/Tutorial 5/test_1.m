function test_1()

clc
clear all
close all


fitnessfcn = @(x)DragCost3(x);

nvars = 6;

lb = [0, 0, 0, 0, 0, 0];
ub = [10, 10, 100, 1000, 2000, 10000];

popsize = 20;
maxgen = 3;

options.DistanceMeasureFcn = {@distancecrowding,'fenotype'};
options = optimoptions('gamultiobj','PopulationSize',popsize,'PlotFcn',@gaplotpareto,'MaxGenerations',maxgen,'ParetoFraction',0.25);

tic
[xval,fval,exitflag,output,population,scores] = gamultiobj(fitnessfcn,nvars,[],[],[],[],lb,ub,[],options);
toc

fval
xval

exitflag
output
end