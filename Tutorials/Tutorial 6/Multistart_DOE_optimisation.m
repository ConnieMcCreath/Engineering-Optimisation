close all
clc

load messenger.mat

lb=[1000 1 0 0 30 30 30 30 0.01 0.01 0.01 0.01 1.1 1.1 1.1 -3.14159265358979 -3.14159265358979 -3.14159265358979];
ub=[4000 5 1 1 400 400 400 400 0.99 0.99 0.99 0.99 6 6 6 3.14159265358979 3.14159265358979 3.14159265358979];

x0=rand(1,18);
x0=(ub-lb).*x0+lb;
foptions.prob=MGADSMproblem;

fobj=@(x)messenger(x,foptions.prob);

opts=optimset('Display','iter','LargeScale','off','Algorithm','sqp','TolX',1e-9,'TolFun',1e-6,'ScaleProblem','obj-and-constr');
problem=createOptimProblem('fmincon','objective',fobj,'x0',x0,'lb',lb,'ub',ub,'nonlcon',[],'options',opts);
ms=MultiStart;
[x,fval,exitflag,output]=run(ms,problem,150);

disp('Result obtained via FMINCON')
disp('Optimal objective function')
disp(fval)
disp('Number of model evaluations with FMINCON')
disp(output.funcCount)
