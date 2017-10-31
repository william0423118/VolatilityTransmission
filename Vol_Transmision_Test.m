clear;
clc;
%% Data process
% input the data
% Data description: We input the all index of North American Markets (CA
% US), Asian Markets (JP,IND,HK), and European Markets( UK GRM FRC), the
% data frequency is 15min, and we adjust for all markets have the same
% number of 15min data for each day. The data covers from 01/05/2015 to
% 12/29/2016, which contains some speacial events and significant
% fluctulation in Asian market.
load('AllData.mat');
window=2400;
N1=3500;
N2=N1+window;
Alldata1=Alldata(N1:N2,:);
Data_NA=Alldata1(:,1:2);
Data_AS=Alldata1(:,3:5);
Data_EU=Alldata1(:,6:8);
Data_NO=Alldata1(:,[1 4 6]);
testdata(Alldata1)
%% Volatility transimision calculation
% we focus on overlapping markets and Non-overlapping markets, and to test
% the different experiement result for 15min, hourly, and daily data.
P=1;
O=0;
Q=1;
[Shock_EU VolSp_EU VolT_EU]=GarchVT(Data_EU(:,:),P,O,Q);
[Shock_NA VolSp_NA VolT_NA]=GarchVT(Data_NA(:,:),P,O,Q);
[Shock_AS VolSp_AS VolT_AS]=GarchVT(Data_AS(:,:),P,O,Q);
[Shock_NO VolSp_NO VolT_NO]=GarchVT(Data_NO(:,:),P,O,Q);


[Final_Shock Shock_TS]=maketable(Shock_AS,Shock_EU,Shock_NA,Shock_NO,Alldata1);
[Final_VolSp VolSp_TS]=maketable(VolSp_AS,VolSp_EU,VolSp_NA,VolSp_NO,Alldata1);
[Final_VolT VolT_TS]=maketable(VolT_AS,VolT_EU,VolT_NA,VolT_NO,Alldata1);

filename = 'testdata5.xlsx';
xlswrite(filename,Shock_TS,1,'C2');
xlswrite(filename,Final_Shock,1,'C7');
xlswrite(filename,VolSp_TS,2,'C2');
xlswrite(filename,Final_VolSp,2,'C7');
xlswrite(filename,VolT_TS,3,'C2');
xlswrite(filename,Final_VolT,3,'C7');