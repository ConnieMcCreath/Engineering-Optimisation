function [f,g]=EM1(x,flag1)
%% EM1 function ***********************************************************
%    I/O:
%
%    Input, x, 2D row vector of design variables 
%
%    Output, f, objective function
%    Output, g, gradient
%
%    Global variable, fv, matrix containing all the objective functions and
%                       design variables values computed during the
%                       optimisation process; to be initialised to [] at 
%                       the start of the main script - NOTE that the use 
%                       of the global variables should be limited!!!
%% ************************************************************************
global fv
f=[];g=[];
f=(x(2)-3.*x(1)).*sin(x(2))+(x(1)-2).^2; 
if nargout > 1 % gradient required
    g = [2*x(1)-3*sin(x(2))-4;
        (x(2)-3.*x(1)).*cos(x(2))+sin(x(2))];
end

if nargin==1
    fv=[fv;f x];
end
