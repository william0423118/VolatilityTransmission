%% Code test for Volatility Spillover

%% Daily Hourly Data preparation
clc
clear % input the data and some parameters
p = 1;             % VAR lag length included.  true lag order is 1.
lambda = 'NW';     % use Newey and West's (1994) automatic bandwidth selection% forecast error variance decomposition
vdhmax = 6;        % maximum horizon
h =6;              % focus on the specific horizon,LESS THAN vdhmax.
DataTable = readtable('daliy hourly data.xlsx');
%DataTable.Date=datestr(DataTable.Date,2);
DateMtx = xlsread('daliy hourly data');
DateMtx=CancelZro(DateMtx);
DateMtx=diff(log(DateMtx));  % do log return on original data
%DateMtx=DateMtx(:,2:end); % Only INDEX EXP1 USE
DateMtx=DateMtx(:,[1 3:end]); % VIX INDEX EXP2 USE

%% Hourly Data preparation
clc
clear % input the data and some parameters
p = 1;             % VAR lag length included.  true lag order is 1.
lambda = 'NW';     % use Newey and West's (1994) automatic bandwidth selection% forecast error variance decomposition
vdhmax = 6;        % maximum horizon
h =6;              % focus on the specific horizon,LESS THAN vdhmax.
DataTable = readtable('hourly data.xlsx');
%DataTable.Date=datestr(DataTable.Date,2);
DateMtx = xlsread('hourly data');
DateMtx=CancelZro(DateMtx);
DateMtx=diff(log(DateMtx));  % do log return on original data
%DateMtx=DateMtx(:,2:end); % Only INDEX EXP1 USE
DateMtx=DateMtx(:,[1 3:end]); % VIX INDEX EXP2 USE

%% Main part get the result for volatility spillover
[row,col]=size(DateMtx);
theta1=zeros(col); % initiate the volatility contribution portion matrix
NPS1=zeros(col); % initiate the net pairwise spillover matrix
windowSize=180; % initiate the window size of our simulation when we conduct hourly expirement 

for i=1:(row-windowSize-1)
    Data=DateMtx(i:i+windowSize,:);
    [TS(i),Nets(:,i),theta(:,:,i),NPS(:,:,i)]=GetVolSpov(Data,p,lambda,vdhmax,h); %get the total spillover, Net spillover, theta and NPS, see the function "GetVolSpov"
     theta1(:,:)=theta(:,:,i)+theta1;
     NPS1(:,:)=NPS(:,:,i)+NPS1;
end
theta1=theta1./(row-windowSize);
NPS1=NPS1./(row-windowSize);

%% Result process Make a table and show figures (Hourly)
close all
figure 
 plot(TS,'b')
 title('Total(VIX) Spillover Volatility hourly 0.4');
 xlabel('Time/Month');
 ylabel('Index');
 set(gca,'XtickLabel',{'Mar','Apr','May','Jun','July','Aug','Sep','Oct'});
 %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
 saveas(gcf,'TotalSpilloverIndex0.1.jpg')
 
figure  
subplot(3,2,1)
stem(Nets(1,:),'black')
title('US(VIX) Spillover Index(hourly)');
xlabel('Time/Month');
ylabel('Index');
set(gca,'XtickLabel',{'Mar','Apr','May','July','Aug','Sep'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'US(VIX) Spillover Index.jpg')


subplot(3,2,2)
stem(Nets(2,:),'black')
title('Japan(VIX) Spillover Index (hourly)');
xlabel('Time/Month');
ylabel('Index');
set(gca,'XtickLabel',{'Mar','Apr','May','July','Aug','Sep'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'Japn(VIX) Spillover Index.jpg')
 
subplot(3,2,5)
stem(Nets(5,:),'black')
title('HK(VIX) Spillover Index (hourly)');
xlabel('Time/Month');
ylabel('Index');
set(gca,'XtickLabel',{'Mar','Apr','May','July','Aug','Sep'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'HK(VIX) Spillover Index.jpg')

subplot(3,2,3)
stem(Nets(3,:),'black')
title('China(VIX) Spillover Index (hourly)');
xlabel('Time/Month');
ylabel('Index');
set(gca,'XtickLabel',{'Mar','Apr','May','July','Aug','Sep'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'China(VIX) Spillover Index.jpg')


subplot(3,2,4) 
stem(Nets(4,:),'black')
title('UK(VIX) Spillover Index (hourly)');
xlabel('Time/Month');
ylabel('Index');
set(gca,'XtickLabel',{'Mar','Apr','May','July','Aug','Sep'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'UK(VIX) Spillover Index.jpg')
 





% the volatility spillover (before 2008) table shows below,
thetaBf

% the volatility spillover (After 2008) table shows below,
thetaAf

% the net pairwise spillover table shows below,
NPS1

% the net pairwise spillover (before 2008) table shows below,
NPSBf

% the net pairwise spillover (After 2008) table shows below,
NPSAf

