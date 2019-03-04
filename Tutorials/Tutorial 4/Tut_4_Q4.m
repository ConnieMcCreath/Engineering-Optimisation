function Tut_4_Prob2_fmincon_EM2()
clc
clear all
close all
global fv
fv=[];
%% Initialise the objective function
FF=@EM2;
%% Initialise the constraint function
CC=@NC_EM2;
%% Initialise lower bounds,lb, and upper bounds, ub
lb=[0 0];
ub=[20 20];

x0=[10 12];
fmin=1e15;
options = optimoptions('fmincon','Algorithm','sqp','Display','none');

[x,fval,exitflag,output] = fmincon(FF,x0,[],[],[],[],lb,ub,CC,options);

figure ( 27 )
hold on
xlabel('x_1');ylabel('x_2');zlabel('f')
plot(fv(:,2),fv(:,3),'b-*')
plot(fv(1,2),fv(1,3),'g-o')
plot(fv(end,2),fv(end,3),'r-d')
x
fval
exitflag
output
