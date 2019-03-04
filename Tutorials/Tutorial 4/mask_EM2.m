function [f, g] = mask_EM2(x)
f=EM2(x);
n=size(x,2);
dx=0.01;
x0=x;
for i=1:n
    x=x0;
    x(i)=x(i)+dx;
    fb=EM2(x);
    g(i)=(fb-f)./dx;
end