function [c,ceq]=NC_EM2(x,flag1)
ceq=[];
c(1)=5-(x(1)-4).^2-(x(2)-8).^2;
c(2)=3-(x(1)-10).^2-(x(2)-12).^2;
