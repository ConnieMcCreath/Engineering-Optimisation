clear all

r = 1;
d = 2*r;
n = 4;
sn = sqrt(2 - 2* sqrt (1 - d^2/4));
pi_approx(1) = (n*sn)/d;

x = 10;

for nn = 2:x 
          
    sn = sqrt(2 - 2* sqrt (1 - sn^2/4));
    n = n*2;
    pi_approx(nn) = (n*sn)/d
    
        
end
