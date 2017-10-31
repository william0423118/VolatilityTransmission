
%% Code test for Volatility Spillover

%% Data preparation
clc
clear % input the data and some parameters
p = 1;             % VAR lag length included.  true lag order is 1.
lambda = 'NW';     % use Newey and West's (1994) automatic bandwidth selection% forecast error variance decomposition
vdhmax = 6;        % maximum horizon
h =6;              % focus on the specific horizon,LESS THAN vdhmax.
%DataTable = readtable('data.xlsx');
%DataTable.Date=datestr(DataTable.Date,2);
%DateMtx = xlsread('data');
%%DateMtx=diff(log(DateMtx));  % do log return on original data
%DateMtx=DateMtx(:,5:end); % Only INDEX EXP1 USE
%%DateMtx=DateMtx(:,2:4); %VIX EXP# USE
%% Simulate three assets for test the model
clc;
%clear;
sig=0.1; %volatity
m=1000; % number of step
DateMtx=generateDate(sig,m);


%% Main part get the result for volatility spillover
[row,col]=size(DateMtx);
theta1=zeros(col); % initiate the volatility contribution portion matrix
NPS1=zeros(col); % initiate the net pairwise spillover matrix
windowSize=360; % initiate the window size of our simulation
for i=1:(row-windowSize-1)
    Data=DateMtx(i:i+windowSize,:);
    [TS(i),Nets(:,i),theta(:,:,i),NPS(:,:,i)]=GetVolSpov(Data,p,lambda,vdhmax,h); %get the total spillover, Net spillover, theta and NPS, see the function "GetVolSpov"
     theta1(:,:)=theta(:,:,i)+theta1;
     NPS1(:,:)=NPS(:,:,i)+NPS1;
end
theta1=theta1./(row-windowSize);
NPS1=NPS1./(row-windowSize);

% %for countries daily data, please do next part, or command it
% thetaBf=zeros(col); NPSBf=zeros(col);     %from 2003-2007
% for i=1:1000     
%       thetaBf(:,:)=theta(:,:,i)+thetaBf;
%       NPSBf(:,:)=NPS(:,:,i)+NPSBf;   
% end
% thetaAf=zeros(col); NPSAf=zeros(col);
% for i=1300:2900
%       thetaAf(:,:)=theta(:,:,i)+thetaAf;
%       NPSAf(:,:)=NPS(:,:,i)+NPSAf;   
% end
% thetaBf=thetaBf./1000; NPSBf=NPSBf./1000;
% thetaAf=thetaAf./1000; NPSAf=NPSAf./1000;
%% Result process Make a table and show figures
close all
% figure 
% plot(TS,'b')
% title('Total Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2005','2008','2011','2013','2016','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'TotalSpilloverIndex.jpg')
% 
% figure 
% subplot(3,3,1)
% stem(Nets(1,:),'black')
% title('Japan Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'Japn Spillover Index.jpg')
%  
% subplot(3,3,2)
% stem(Nets(2,:),'black')
% title('HK Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'HK Spillover Index.jpg')
% 
% subplot(3,3,3)
% stem(Nets(3,:),'black')
% title('China Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'China Spillover Index.jpg')
% 
% subplot(3,3,4) 
% stem(Nets(4,:),'black')
% title('Germany Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'Germany Spillover Index.jpg')
% 
% subplot(3,3,5) 
% stem(Nets(5,:),'black')
% title('France Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'France Spillover Index.jpg')
% 
% subplot(3,3,6) 
% stem(Nets(6,:),'black')
% title('UK Spillover Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'UK Spillover Index.jpg')
%  
% subplot(3,3,7)
% stem(Nets(7,:),'black')
% title('US Index');
% xlabel('Time/year');
% ylabel('Index');
% set(gca,'XtickLabel',{'2003','2008','2013','2018'});
% %legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
% saveas(gcf,'US Index.jpg')
figure 
subplot(3,1,1)
stem(Nets(1,:),'black')
title('Original');
xlabel('Time/year');
ylabel('Index');
set(gca,'XtickLabel',{'2003','2005','2008','2011','2013','2016','2018'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'German VIX Index.jpg')
 
subplot(3,1,2)
stem(Nets(2,:),'black')
title('Lag 1');
xlabel('Time/year');
ylabel('Index');
set(gca,'XtickLabel',{'2003','2005','2008','2011','2013','2016','2018'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'Japan VIX Index.jpg')

subplot(3,1,3)
stem(Nets(3,:),'black')
title('Lag 2');
xlabel('Time/year');
ylabel('Index');
set(gca,'XtickLabel',{'2003','2005','2008','2011','2013','2016','2018'});
%legend('2Yoriginal yield','2Ybndbyzero yield','2Ybdt yield')
saveas(gcf,'VIX Index.jpg')
the volatility spillover table shows below,
theta1

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