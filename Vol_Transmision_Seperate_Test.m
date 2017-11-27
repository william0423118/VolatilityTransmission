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
% AllData1 from 1/7/2013-3/1/2017 
load('AllData1.mat');
Alldata=Alldata(:,:);
X=23;
Day=20;
window=X*Day;
[Data_NA Data_AS Data_EU Data_NO]=seperatedata(window,Alldata);


%% Volatility transimision calculation
% we focus on overlapping markets and Non-overlapping markets, and to test
% the different experiement result for 15min, hourly, and daily data.
P=1;
O=1;
Q=1;
Res_As=[];
Res_Eu=[];
Res_Na=[];
Res_No=[];
for i=1:size(Data_AS,3)
[Shock_EU VolSp_EU VolT_EU]=GarchVT(Data_EU(:,:,i),P,O,Q);
[Shock_NA VolSp_NA VolT_NA]=GarchVT(Data_NA(:,:,i),P,O,Q);
[Shock_AS VolSp_AS VolT_AS]=GarchVT(Data_AS(:,:,i),P,O,Q);
[Shock_NO VolSp_NO VolT_NO]=GarchVT(Data_NO(:,:,i),P,O,Q);


%[Final_Shock Shock_TS]=maketable(Shock_AS,Shock_EU,Shock_NA,Shock_NO,Alldata1);
%[Final_VolSp VolSp_TS]=maketable(VolSp_AS,VolSp_EU,VolSp_NA,VolSp_NO,Alldata1);
[Final_VolT VolT_TS]=maketable(VolT_AS,VolT_EU,VolT_NA,VolT_NO);

filename = 'ExtendData2.xlsx';
xlswrite(filename,Day,i,'A1');
xlswrite(filename,Day*23*(i-1)+1,i,'A2');
% xlswrite(filename,Shock_TS,1,'C2');
% xlswrite(filename,Final_Shock,1,'C7');
% xlswrite(filename,VolSp_TS,2,'C2');
% xlswrite(filename,Final_VolSp,2,'C7');
xlswrite(filename,VolT_TS(:,1),i,'C2');
xlswrite(filename,VolT_TS(:,2),i,'F2');
xlswrite(filename,VolT_TS(:,3),i,'I2');
xlswrite(filename,VolT_TS(:,4),i,'K2');
xlswrite(filename,Final_VolT,i,'C7');


if sum(isnan(VolT_AS.TS))==0
    if VolT_AS.TS(3)>VolT_AS.TS(1)
        Res_As1=[[VolT_AS.TS,zeros(3,2)];VolT_AS.Trans;VolT_AS.Rec;VolT_AS.self;VolT_AS.direct;VolT_AS.crosmkt];
        Res_As=[Res_As,Res_As1];
    end
end
if sum(isnan(VolT_EU.TS))==0
    if VolT_EU.TS(3)>VolT_EU.TS(1)
        Res_Eu1=[[VolT_EU.TS,zeros(3,2)];VolT_EU.Trans;VolT_EU.Rec;VolT_EU.self;VolT_EU.direct;VolT_EU.crosmkt];
        Res_Eu=[Res_Eu,Res_Eu1];
    end
end
if sum(isnan(VolT_NA.TS))==0
    if VolT_NA.TS(3)>VolT_NA.TS(1)
        Res_Na1=[[VolT_NA.TS,zeros(3,1)];VolT_NA.Trans;VolT_NA.Rec;VolT_NA.self;VolT_NA.direct;VolT_NA.crosmkt];
        Res_Na=[Res_Na,Res_Na1];
    end
end
if sum(isnan(VolT_NO.TS))==0
    if VolT_NO.TS(1)>VolT_NO.TS(3)
        Res_No1=[[VolT_NO.TS,zeros(3,2)];VolT_NO.Trans;VolT_NO.Rec;VolT_NO.self;VolT_NO.direct;VolT_NO.crosmkt];
        Res_No=[Res_No,Res_No1];
    end
end

end
filename1 = 'ExtendDataSep2.xlsx';
xlswrite(filename1,Res_As,1,'C2');
xlswrite(filename1,Res_Eu,2,'C2');
xlswrite(filename1,Res_Na,3,'C2');
xlswrite(filename1,Res_No,4,'C2');