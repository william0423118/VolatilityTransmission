clear;
load('DataAsian.mat');
% data description: this data consists of Tokyo, Shanghai, Hongkong from
% 20150901-20170925,Tokyo trading time: 20:00-1:30; SH:21:15-3:00;
% HK:21:00-4:00 (EST)
P=1;
O=1;
Q=1;
N=500;
[TS,Trans,Rec,SPS]=GarchSV(DataAsian(1:N,:),P,O,Q);
DataTemp=DataAsian(1:N,:);
DataAsianDaily=DataTemp([3:6:end],:);
[TSd,Transd,Recd,SPSd]=GarchSV(DataAsianDaily,P,O,Q);
% The results shows below,
% The Total Spillover of Hourly data is :
TS
% The Total Spillover of Daily data is :
TSd
% The pairwise spillover of Hourly data is:
% Tokyo, Shanghai, Hongkong
SPS
%The pairwise spillover is Daily data is:
% Tokyo, Shanghai, Hongkong
SPSd