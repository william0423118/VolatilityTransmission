%% Simulate three assets for test the model
clear;
clc;
sig=0.1; %volatity
m=1000; % number of step
DataMtx=generateDate(sig,m);
% DataH = xlsread('hourly data');
% DataD = xlsread('daliy hourly data');
% DataD=CancelZro(DataD);
% DataD=DataD(:,[4 9 5 7 8 6]);

% DateMtx= DataH(:,2:end);
% DataMtx=DataH(:,[1 3:end]);
% DataMtx=DataD(:,2:end);
% DataMtx=DataD(:,[1 3:end])
%DataMtx=diff(log(DataMtx));  % do log return on original data
%plot(DateMtx)

%% Get the mean-zero residuals for EGARCH
Resduals=GetRes(DataMtx);

%%  BEKK parameterisation for the MGARCH model
%   P            - Positive, scalar integer representing the number of symmetric innovations
%   O            - Non-negative, scalar integer representing the number of asymmetric innovations
%   Q            - Non-negative, scalar integer representing the number of conditional covariance lags
P=1;
O=1;
Q=1;
K=size(Resduals,2);
[PARAMETERS,LL,HT,VCV,SCORES] = bekk(Resduals,[],P,O,Q,'Full',[],[]);
[C,A,G,B] = bekk_parameter_transform(PARAMETERS,P,O,Q,K,3);

%% Get Volatility Spillover
[TS,Trans,Rec,SPS]=GetSpillover(A)