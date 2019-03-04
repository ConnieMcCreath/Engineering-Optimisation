function [f]=ANN_simulator(y,net0,minp,maxp,mint,maxt)
x=y';
for i=1:size(minp,1)
    xu(i,:)=2./(maxp(i)-minp(i)).*(x(i,:)-minp(i))-1;
end
a=sim(net0,xu);
[f] = postmnmx(a,mint,maxt);