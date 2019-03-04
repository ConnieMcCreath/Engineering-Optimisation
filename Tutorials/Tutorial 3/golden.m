%% Golden Section Search
% Author: Sean Wu, UC Davis MAE Dept. 
% Date:   Mar. 2015

% CC BY-SA, Sean Wu 2015

%{

This function returns alpha from the golden section search. Inputs are the
vector x=[x1, x2,...xn] and the gradient vector gradf. 

Note: the golden section method is very sensitive to n.

%}

function [alpha,nf]=golden(FF,x, s,n)

%% Golden Section Search Parameters to det. min alpha
tau=0.381966;
nf=0;
lb=0;   % Lower Bound Alpha
ub=1;   % Upper Bound Alpha

alpha1=(1-tau)*lb+tau*ub;
x1=x+alpha1*s';
f1=feval(FF,x1); nf=nf+1;
alpha2=tau*lb+(1-tau)*ub;
x2=x+alpha2*s';
f2=feval(FF,x2);  nf=nf+1;

for k=3:n
    if f1>f2
        lb=alpha1;
        alpha1=alpha2;
        f1=f2;
        alpha2=tau*lb+(1-tau)*ub;
        x2=x+alpha2*s';
        f2=feval(FF,x2);  nf=nf+1;
    else
        ub=alpha2;
        alpha2=alpha1;
        f2=f1;
        alpha1=(1-tau)*lb+tau*ub;
        x1=x+alpha1*s';
        f1=feval(FF,x1);  nf=nf+1;
    end
end    

alpha=(alpha1+alpha2)/2;
end

% Sean Wu, 2015