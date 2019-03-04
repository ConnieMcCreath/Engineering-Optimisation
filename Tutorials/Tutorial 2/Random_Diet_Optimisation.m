clear all
close all
clc

t = cputime

% Optimise to give the cheapest food to give the recommended weekly % allowance of defined calories and main nutriens/elements
%Recommended Daily Allowance 
energy = 2000; %kcal 
fat = 70; %g 
satFat = 20; %g 
transFat = 5; %g 
carb = 260; %g 
sugars = 90; %g 
protein = 50; %g 
sodium = (6*1000)/2.5; %mg 
vitA = 0.6*1000; %microg 
vitE = 3; %mg 
vitC = 40; %mg 
vitB1 = 0.8; %mg 
iodine = 0.14*1000; %microg 
calcium = 700; %mg 
iron = 14.8; %mg
%Import Data %read in excel file in full format (used for the names) [sheet_num, sheet_txt, sheet_raw] = xlsread('DietData_v3.xlsx'); 
%load preformatted array downloaded from matlab (saves processing time) 
load('total_data.mat') %replace all NaNs with 0 
TOTmatrix(isnan(TOTmatrix)) = 0; 

%f is the cost vector 
f = TOTmatrix(:,1); 

%Define the equality constraints 
Aeq = (TOTmatrix(:, [2, 6, 9, 10, 7, 8, 5, 16, 12, 13, 15, 14, 27, 18, 21]))'; 
beq = ([energy, fat, satFat, transFat, carb, sugars, protein, sodium, ... 
    vitA, vitE, vitC, vitB1, iodine, calcium, iron]*7)'; 

%inequality matricies
A = [Aeq; -Aeq];
b = [1.1*beq; -0.9*beq];

ub = ones(1,2896)*15

%algorithm
options = optimoptions ('linprog', 'algorithm', 'interior-point')

%Use linprog to optimise 
[weight_a, cost_a] = linprog(f, [], [], Aeq, beq, zeros(1, 2896), ... 
    ub); 

%check how far from contraints the solution is as a percentage 
%A small error will exist due to the tolerance 
verify_a = (Aeq*weight_a - beq)./beq; 
if sum(verify_a)>0.0001 
    disp('Constraints not held') 
else
    disp('Contraints held') 
end
%Optimization terminated. Contraints held

%read in excel file in full format (used for the names) 
[sheet_num, sheet_txt, sheet_raw] = xlsread('DietData_v3.xlsx');
%read the food names 
food_names = sheet_txt(4:end, 1);
%Print results
dd=find(weight_a>0.001);
for j=1:size(dd,1)
    qq=weight_a(dd(j))*100;
    ss=[num2str(qq),'g of ',food_names{dd(j)}];
    disp(ss)
end
disp(['Cost: £',num2str(cost_a)])

cputime - t
