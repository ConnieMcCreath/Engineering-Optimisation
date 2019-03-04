function test_NM_fms_EXq1()
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
FF=@EM1;

%% Initialise the initial 3 solutions for search direction
xN=[6 10;2 10; 5 5];

%% Initialise lower bounds,lb, and upper bounds, ub (defining the limits of the funtion plotted)
lb=[0 0];
ub=[2*pi; 20];

%% Run the nelder_mead function
[x_opt, n_feval ] = nelder_mead (xN , FF, 1 , lb, ub);
f_opt=FF(x_opt);
[m,n]=size(fv);
fvNM=fv;

disp('Optimal point:')
disp(x_opt')
disp(' ')

disp('Optimal objective function value:')
disp(f_opt')
disp(' ')

disp('Computational cost (i.e., number of objective function evaluations):')
disp(m)
disp(' ')

fv=[];

%% Initialise the inital line search position for (x1,x2)
x0=[6 ];


[x,~,exitflag,output] = fminsearch(FF,x0)
plot(fv(1,2),fv(1,3),'go')
plot(fv(2:end-1,2),fv(2:end-1,3),'m-*')
plot(fv(end,2),fv(end,3),'gd')

return
