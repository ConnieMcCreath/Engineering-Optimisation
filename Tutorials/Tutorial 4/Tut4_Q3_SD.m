function test_SD_fmu_EXq1()
clc
clear all
close all
%%    Global variable, fv, matrix containing all the objective functions and
%                       design variables values computed during the
%                       optimisation process; to be initialised to [] at 
%                       the start of the main script - NOTE that the use 
%                       of the global variables should be limited!!!
global fv
fv=[];
%% Initialise the objective function
FF=@mask_EM2;
%% Initialise lower bounds,lb, and upper bounds, ub (WHY ?????)
lb=[0 0];
ub=[20 20];


xp = linspace(lb(1),ub(1),101);
yp = linspace(lb(2),ub(2),101);
for i=1:101
    for j=1:101
        fp(j,i) = feval(FF,[xp(i),yp(j)]);
    end
end

figure ( 27 )
hold on
contour(xp,yp,fp,linspace(0,200,25))
xlabel('x_1');ylabel('x_2');zlabel('f')


fv=[];
x0=[10 12];
[xopt,fopt,nfeval]=SD(FF,x0)
plot(fv(:,2),fv(:,3),'r-o')
fvSD=fv;
