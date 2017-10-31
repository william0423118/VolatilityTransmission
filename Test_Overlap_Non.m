%% Experiment for Overlapping Counties
% In this section, we will focus on the overlapping trading time countries,
% we choose the Asian markets (HK, China, Japan), European Markets (UK,
% France, Germany), and North American Markets (US and Canada). 
% For three districts of trading area, we are going to 1. comparing the
% difference between daily data and intraday data; 2. Lag some countries'
% data to test their volatility spillover.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experiment for Asian
clear;
load('DataAsian.mat');
% data description: this data consists of Tokyo, Shanghai, Hongkong from
% 20150901-20170925,Tokyo trading time: 20:00-1:30; SH:21:15-3:00;
% HK:21:00-4:00 (EST)
P=1;
O=1;
Q=1;
N=1000;
%[TS,Trans,Rec,SPS]=GarchSV(DataAsian(1:N,:),P,O,Q);
[TS,Trans,Rec,SPS,TSsv,Transsv,Recsv,SPSsv]=GarchSV((DataAsian(1:N,:)),P,O,Q);
DataTemp=DataAsian(1:N,:);
DataAsianDaily=DataTemp([3:6:end],:);
%[TSd,Transd,Recd,SPSd]=GarchSV(DataAsianDaily,P,O,Q);
[TSd,Transd,Recd,SPSd,TSsvd,Transsvd,Recsvd,SPSsvd]=GarchSV(DataAsianDaily,P,O,Q);
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
%% experiment for European
clear;
load('DataEuro.mat');
% data description: this data consists of London, French, germany from
% 20150903-20170925,trading time: 03:00-11:00 9hours per day(EST)
P=1;
O=1;
Q=1;
N=2000;
%[TS,Trans,Rec,SPS]=GarchSV(DataEuro(1:N,:),P,O,Q);
[TS,Trans,Rec,SPS,TSsv,Transsv,Recsv,SPSsv]=GarchSV(DataEuro(1:N,:),P,O,Q);
DataTemp=DataEuro(1:N,:);
DataEuroDaily=DataTemp([9:9:end],:);
%[TSd,Transd,Recd,SPSd]=GarchSV(DataEuroDaily,P,O,Q);
[TSd,Transd,Recd,SPSd,TSsvd,Transsvd,Recsvd,SPSsvd]=GarchSV(DataEuroDaily,P,O,Q);
% The results shows below,
% The Total Spillover of Hourly data is :
TS
% The Total Spillover of Daily data is :
TSd
% The pairwise spillover of Hourly data is:
% London, French, germany
SPS
%The pairwise spillover is Daily data is:
% London, French, germany
SPSd
%% experiment for North American
clear;
load('DataNA.mat');
% data description: this data consists of US Canada from
% 20150919-20170925,trading time: 0930-15:30 7hours per day(EST)
P=1;
O=1;
Q=1;
N=1500;
%[TS,Trans,Rec,SPS]=GarchSV(DataNA(1:N,:),P,O,Q);
[TS,Trans,Rec,SPS,TSsv,Transsv,Recsv,SPSsv]=GarchSV(DataNA(1:N,:),P,O,Q);
DataTemp=DataNA(1:N,:);
DataNADaily=DataTemp([7:7:end],:);
%[TSd,Transd,Recd,SPSd]=GarchSV(DataNADaily,P,O,Q);
[TSd,Transd,Recd,SPSd,TSsvd,Transsvd,Recsvd,SPSsvd]=GarchSV(DataNADaily,P,O,Q);
% The results shows below,
% The Total Spillover of Hourly data is :
TS
% The Total Spillover of Daily data is :
TSd
% The pairwise spillover of Hourly data is:
% US Canada
SPS
%The pairwise spillover is Daily data is:
% US Canada
SPSd
%% experiment on Non-overlapping countries
% in this section, we choose US UK and China data to test is the daily
% vol spillover is absord by non-overlapping countries.
clear;
load('DataNonoverlap.mat');
% data description: this data consists of US, SHANGHAI, LONDON from
% 20150901-20170925,trading time: 03:00-11:00 6hours per day(EST)
P=1;
O=1;
Q=1;
N=1500;
%[TS,Trans,Rec,SPS]=GarchSV(DataNonOverlao(1:N,:),P,O,Q);
[TS,Trans,Rec,SPS,TSsv,Transsv,Recsv,SPSsv]=GarchSV(DataNonOverlao(1:N,:),P,O,Q);
DataTemp=DataNonOverlao(1:N,:);
DataNonDaily=DataTemp([6:6:end],:);
%[TSd,Transd,Recd,SPSd]=GarchSV(DataNonDaily,P,O,Q);
[TSd,Transd,Recd,SPSd,TSsvd,Transsvd,Recsvd,SPSsvd]=GarchSV(DataNonDaily,P,O,Q);
% The results shows below,
% The Total Spillover of Hourly data is :
TS
% The Total Spillover of Daily data is :
TSd
% The pairwise spillover of Hourly data is:
% US, SHANGHAI, LONDON
SPS
%The pairwise spillover is Daily data is:
% US, SHANGHAI, LONDON
SPSd
