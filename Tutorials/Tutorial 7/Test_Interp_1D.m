clear all
close all
clc
rng('default')
rng(220)


n=100;
x=linspace(0,6*pi,n);
y=3*cos(x)+x;

randomPermutation=randperm(n);

percentKept=5;
numKept=round(n*percentKept/100);

xKept=x(randomPermutation(1:numKept));
yKept=y(randomPermutation(1:numKept));

%%
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

yInterp=interp1(xKept,yKept,x,'spline');
plot1 = plot(x,yInterp,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('SPLINE')
grid
drawnow

hgsave(['SPLINE_b.fig'])
print(['SPLINE_b'],'-dpng')

%%
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
yInterp=interp1(xKept,yKept,x,'linear');
plot1=plot(x,yInterp,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('LINEAR')
grid
drawnow

hgsave(['LINEAR_b.fig'])
print(['LINEAR_b'],'-dpng')

%%
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
yInterp=interp1(xKept,yKept,x,'nearest');
plot1=plot(x,yInterp,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('NEAREST')
grid
drawnow

hgsave(['NEAREST_b.fig'])
print(['NEAREST_b'],'-dpng')

%%
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
yInterp=interp1(xKept,yKept,x,'pchip');
plot1=plot(x,yInterp,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('PCHIP')
grid
drawnow

hgsave(['PCHIP_b.fig'])
print(['PCHIP_b'],'-dpng')

%% 
reg = MultiPolyRegress(xKept',yKept',2);
func_str = func2str(reg.PolynomialExpression);
func_str = strrep(func_str, 'x1', 'x(1)');
func_str = strrep(func_str, 'x(1)','x');
func = str2func(func_str);
yPF2=feval(func,x);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,yPF2,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('PolyFun 2^{nd} order')
grid
drawnow
hgsave(['PolyFun_2nd_order_b.fig'])
print(['PolyFun_2nd_order_b'],'-dpng')



reg = MultiPolyRegress(xKept',yKept',3);
func_str = func2str(reg.PolynomialExpression);
func_str = strrep(func_str, 'x1', 'x(1)');
func_str = strrep(func_str, 'x(1)','x');
func = str2func(func_str);
yPF2=feval(func,x);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,yPF2,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('PolyFun 3^{rd} order')
grid
drawnow
hgsave(['PolyFun_3rd_order_b.fig'])
print(['PolyFun_3rd_order_b'],'-dpng')



reg = MultiPolyRegress(xKept',yKept',4);
func_str = func2str(reg.PolynomialExpression);
func_str = strrep(func_str, 'x1', 'x(1)');
func_str = strrep(func_str, 'x(1)','x');
func = str2func(func_str);
yPF2=feval(func,x);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,yPF2,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('PolyFun 4^{th} order')
grid
drawnow
hgsave(['PolyFun_4th_order_b.fig'])
print(['PolyFun_4th_order_b'],'-dpng')


%%
reg = MultiPolyRegress(xKept',yKept',5);
func_str = func2str(reg.PolynomialExpression);
func_str = strrep(func_str, 'x1', 'x(1)');
func_str = strrep(func_str, 'x(1)','x');
func = str2func(func_str);
yPF2=feval(func,x);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,yPF2,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('PolyFun 5^{th} order')
grid
drawnow
hgsave(['PolyFun_5th_order_b.fig'])
print(['PolyFun_5th_order_b'],'-dpng')


%%
reg = MultiPolyRegress(xKept',yKept',6);
func_str = func2str(reg.PolynomialExpression);
func_str = strrep(func_str, 'x1', 'x(1)');
func_str = strrep(func_str, 'x(1)','x');
func = str2func(func_str);
yPF2=feval(func,x);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,yPF2,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('PolyFun 6^{th} order')
grid
drawnow
hgsave(['PolyFun_6th_order_b.fig'])
print(['PolyFun_6th_order_b'],'-dpng')



%%
[net0,PN,minp,maxp,TN,mint,maxt]=ANN_interpolator(xKept',yKept',0.03,10,'trainbr');
[fANN1]=ANN_simulator(x',net0,minp,maxp,mint,maxt);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,fANN1,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('ANN TrainBR Nn=10')
grid
drawnow
hgsave(['ANN_TrainBR_Nn10_b.fig'])
print(['ANN_TrainBR_Nn10_b'],'-dpng')


%%
[net0,PN,minp,maxp,TN,mint,maxt]=ANN_interpolator(xKept',yKept',0.03,10,'trainlm');
[fANN1]=ANN_simulator(x',net0,minp,maxp,mint,maxt);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,fANN1,'k-',xKept,yKept,'ro',x,y,':m')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function')
title('ANN TrainLM Nn=10')
grid
drawnow
hgsave(['ANN_TrainLM_Nn10_b.fig'])
print(['ANN_TrainLM_Nn10_b'],'-dpng')




%%
addpath('.\dace')
theta = [10]; lob = [1e-1]; upb = [20];
[dmodel, perf] = dacefit(xKept',yKept', @regpoly0, @corrgauss, theta, lob, upb);
[YX MSE] = predictor(x', dmodel);
% Create figure
figure1 = figure('PaperOrientation','landscape',...
    'PaperSize',[29.69999902 20.99999864],...
    'OuterPosition',[-7 33 1382 744]);
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1=plot(x,YX,'k-',xKept,yKept,'ro',x,y,':m',x,MSE,'g-')
set(plot1(1),'LineWidth',2);
set(plot1(2),'MarkerSize',10,'Marker','o','LineWidth',2);
set(plot1(3),'LineWidth',2);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',24);
% Create legend
legend('Inter./Approx. Func.','Available Data','True Function','MSE')
title('Kriging')
grid
drawnow
hgsave(['Kriging_b.fig'])
print(['Kriging_b'],'-dpng')
