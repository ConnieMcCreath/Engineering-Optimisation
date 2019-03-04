% Loads the data
Data_LHC

%% This learns the data and creates the ANN
[net0,PN,minp,maxp,TN,mint,maxt]=ANN_interpolator(xdata,fdata,0.03);

%% This uses the output of the learning process to compute the ANN in the xdata points (xdata can be sobstituted by any point in the search space)
%% The functions needs "net0,minp,maxp,mint,maxt", which define the ANN 
[f]=ANN_simulator(xdata,net0,minp,maxp,mint,maxt);
disp([fdata f'])

