function [net0,PN,minp,maxp,TN,mint,maxt]=ANN_interpolator(xdati,fdati,toll,nnn,tralg)
%%%
% Inputs:
% xdati: sampled parameters as design parameters and functioning parameters (Mach,
% AoA, Reynolds, etc.) - in columns
% fdati: sampled output (lift, drag, etc.)
% toll: tollerance on sampled data
%
%%%


[PN,minp,maxp,TN,mint,maxt] = premnmx(xdati',fdati(:,1)');
partr = mse(TN*toll)


net=newff(minmax(PN),[nnn,1],{'tansig','purelin'},tralg);
net.trainParam.epochs = 10000; % Maximum number of epochs to train
net.trainParam.goal = partr; % Performance goal
net.trainParam.max_fail = 1;
%net.trainParam.mu_inc = 5;
%net.trainParam.mu = 5;
net.trainParam.show=25;
net.trainParam.showWindow=0;
net.trainParam.showCommandLine=1;

randn('seed',sum(100*clock));
net = init(net);
[net,tr]=train(net,PN,TN);
disp('********** Perf *********')
disp([num2str(tr.perf(1,end)) ' ' num2str(partr)])
disp('**********')
a=sim(net,PN);
disp('********** MSE *******')
[mse(a-TN) sse(a-TN)]
disp('**********')
disp('')
disp('')
net0=net;
mse0=mse(a-TN);
figure(200)
[m,b,r]=postreg(a,TN)


