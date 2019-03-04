function [xopt,fopt,nfeval]=SD(fun,x0)
n=0;            %initialize iteration counter
eps=1;          %initialize error
a=0.5;         %set iteration parameter
x=x0;        %set starting value

%Computation loop
while eps>1e-4 && n<100;
    [f,gradf]= feval(fun,x);  
    gradf=gradf';
    n=n+1;         
    eps=norm(gradf);   
    [alpha,nf]=golden(fun,x, -gradf,10);
    n=n+nf;
    y=x-alpha*gradf';                                                 
    x=y;                                                                                                 
end
nfeval=n;
xopt=x;
fopt=f;        %display end values 