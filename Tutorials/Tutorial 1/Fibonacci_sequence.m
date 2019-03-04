clear all

x(1) = 0;
x(2) = 1;
n = 3;

while x(n-2) + x(n-1)<10000;
    
    x(n) = x(n-2) + x(n-1)
    n = n+1;
end

remainder_array = rem(x,2) == 0;

even_summation = x*remainder_array'

n_15 = x(15)





