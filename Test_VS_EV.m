clear;
%% North American
clear
load('Data_NA.mat')
P=1;
O=0;
Q=1;
% Estimate parameters for 15min,1 hour, and 1day
N=624;
data_15min=Data_NA_15min(1:N,:);
data_1h=data_15min([1:4:end],:);
data_1d=data_15min([1:27:end],:);
[TS_1d,Trans_1d,Rec_1d,SPS_1d self_1d direct_1d crosmkt_1d]=GarchSV(data_1d,P,O,Q);
[TS_15min,Trans_15min,Rec_15min,SPS_15min self_15min direct_15min crosmkt_15min]=GarchSV(data_15min,P,O,Q);
[TS_1h,Trans_1h,Rec_1h,SPS_1h self_1h direct_1h crosmkt_1h]=GarchSV(data_1h,P,O,Q);
ResultsTCV=[TS_15min TS_1h  TS_1d]
Resultsdetail=[self_15min direct_15min crosmkt_15min; self_1h direct_1h crosmkt_1h;self_1d direct_1d crosmkt_1d]
% ResultsTrans=[Trans_15min Transsv_15min;Trans_1h Transsv_1h;Trans_1d Transsv_1d];
% ResultsRec=[Rec_15min Recsv_15min;Rec_1h Recsv_1h;Rec_1d Recsv_1d];
% ResultSPS=[SPS_15min SPSsv_15min;SPS_1h SPSsv_1h;SPS_1d SPSsv_1d];
%% NA Hourly vs Daily
clear
load('Data_NA.mat')
P=1;
O=1;
Q=1;
N=1800;
data1_1h=Data_NA_Hourly_1213(1:N,:);
data1_1d=Data_NA_Hourly_1213(1:4:N,:);
data2_1h=Data_NA_Hourly_1213(N:end,:);
data2_1d=Data_NA_Hourly_1213(N:4:end,:);
data3_1h=Data_NA_Hourly_1517(1:N,:);
data3_1d=Data_NA_Hourly_1517(1:4:N,:);
data4_1h=Data_NA_Hourly_1517(N:end,:);
data4_1d=Data_NA_Hourly_1517(N:4:end,:);
[TS1_1h,Trans1_1h,Rec1_1h,SPS1_1h,TSsv1_1h,Transsv1_1h,Recsv1_1h,SPSsv1_1h]=GarchSV(data1_1h,P,O,Q);
[TS1_1d,Trans1_1d,Rec1_1d,SPS1_1d,TSsv1_1d,Transsv1_1d,Recsv1_1d,SPSsv1_1d]=GarchSV(data1_1d,P,O,Q);
[TS2_1h,Trans2_1h,Rec2_1h,SPS2_1h,TSsv2_1h,Transsv2_1h,Recsv2_1h,SPSsv2_1h]=GarchSV(data2_1h,P,O,Q);
[TS2_1d,Trans2_1d,Rec2_1d,SPS2_1d,TSsv2_1d,Transsv2_1d,Recsv2_1d,SPSsv2_1d]=GarchSV(data2_1d,P,O,Q);
[TS3_1h,Tran3s_1h,Rec3_1h,SPS3_1h,TSsv3_1h,Transsv3_1h,Recsv3_1h,SPSsv3_1h]=GarchSV(data3_1h,P,O,Q);
[TS3_1d,Trans3_1d,Rec3_1d,SPS3_1d,TSsv3_1d,Transsv3_1d,Recsv3_1d,SPSsv3_1d]=GarchSV(data3_1d,P,O,Q);
[TS4_1h,Trans4_1h,Rec4_1h,SPS4_1h,TSsv4_1h,Transsv4_1h,Recsv4_1h,SPSsv4_1h]=GarchSV(data4_1h,P,O,Q);
[TS4_1d,Trans4_1d,Rec4_1d,SPS4_1d,TSsv4_1d,Transsv4_1d,Recsv4_1d,SPSsv4_1d]=GarchSV(data4_1d,P,O,Q);
ResultsTCV=[TS1_1h TSsv1_1h; TS1_1d TSsv1_1d;TS2_1h TSsv2_1h; TS2_1d TSsv2_1d; ...
            TS3_1h TSsv3_1h; TS3_1d TSsv3_1d]
%% Asian
clear
load('Data_AS.mat')
P=1;
O=1;
Q=1;
N1=810;
N2=813;
% Estimate parameters for 15min,1 hour, and 1day
data_15min=Data_AS_15min_13(800:end,:);
data_1h=data_15min([1:4:end],:);
data_1d=data_15min([1:18:end],:);
[TS_1d,Trans_1d,Rec_1d,SPS_1d self_1d direct_1d crosmkt_1d]=GarchSV(data_1d,P,O,Q);
[TS_15min,Trans_15min,Rec_15min,SPS_15min self_15min direct_15min crosmkt_15min]=GarchSV(data_15min,P,O,Q);
[TS_1h,Trans_1h,Rec_1h,SPS_1h self_1h direct_1h crosmkt_1h]=GarchSV(data_1h,P,O,Q);
ResultsTCV=[TS_15min TS_1h  TS_1d]
Resultsdetail=[self_15min direct_15min crosmkt_15min; self_1h direct_1h crosmkt_1h;self_1d direct_1d crosmkt_1d]
% ResultsTrans=[Trans_15min Transsv_15min;Trans_1h Transsv_1h;Trans_1d Transsv_1d];
% ResultsRec=[Rec_15min Recsv_15min;Rec_1h Recsv_1h;Rec_1d Recsv_1d];
% ResultSPS=[SPS_15min SPSsv_15min;SPS_1h SPSsv_1h;SPS_1d SPSsv_1d];
%% AS Hourly vs Daily
clear
load('Data_AS.mat')
P=1;
O=1;
Q=1;
N=1200;
data1_1h=Data_AS_hourly_1213(1:N,:);
data1_1d=Data_AS_hourly_1213(1:4:N,:);
data2_1h=Data_AS_hourly_1213(N:end,:);
data2_1d=Data_AS_hourly_1213(N:4:end,:);
data3_1h=Data_AS_hourly_1517(1:N,:);
data3_1d=Data_AS_hourly_1517(1:4:N,:);
data4_1h=Data_AS_hourly_1517(N:end,:);
data4_1d=Data_AS_hourly_1517(N:4:end,:);
[TS1_1h,Trans1_1h,Rec1_1h,SPS1_1h,TSsv1_1h,Transsv1_1h,Recsv1_1h,SPSsv1_1h]=GarchSV(data1_1h,P,O,Q);
[TS1_1d,Trans1_1d,Rec1_1d,SPS1_1d,TSsv1_1d,Transsv1_1d,Recsv1_1d,SPSsv1_1d]=GarchSV(data1_1d,P,O,Q);
[TS2_1h,Trans2_1h,Rec2_1h,SPS2_1h,TSsv2_1h,Transsv2_1h,Recsv2_1h,SPSsv2_1h]=GarchSV(data2_1h,P,O,Q);
[TS2_1d,Trans2_1d,Rec2_1d,SPS2_1d,TSsv2_1d,Transsv2_1d,Recsv2_1d,SPSsv2_1d]=GarchSV(data2_1d,P,O,Q);
[TS3_1h,Tran3s_1h,Rec3_1h,SPS3_1h,TSsv3_1h,Transsv3_1h,Recsv3_1h,SPSsv3_1h]=GarchSV(data3_1h,P,O,Q);
[TS3_1d,Trans3_1d,Rec3_1d,SPS3_1d,TSsv3_1d,Transsv3_1d,Recsv3_1d,SPSsv3_1d]=GarchSV(data3_1d,P,O,Q);
[TS4_1h,Trans4_1h,Rec4_1h,SPS4_1h,TSsv4_1h,Transsv4_1h,Recsv4_1h,SPSsv4_1h]=GarchSV(data4_1h,P,O,Q);
[TS4_1d,Trans4_1d,Rec4_1d,SPS4_1d,TSsv4_1d,Transsv4_1d,Recsv4_1d,SPSsv4_1d]=GarchSV(data4_1d,P,O,Q);
ResultsTCV=[TS1_1h TSsv1_1h; TS1_1d TSsv1_1d;TS2_1h TSsv2_1h; TS2_1d TSsv2_1d; ...
            TS3_1h TSsv3_1h; TS3_1d TSsv3_1d;TS4_1h TSsv4_1h; TS4_1d TSsv4_1d]
%% European
clear
load('DATA_EU.mat')
P=1;
O=0;
Q=1;
N=1515;
% Estimate parameters for 15min,1 hour, and 1day
data_15min=Data_EU_15min_1213(1001:2050,:);
data_1h=data_15min([1:4:end],:);
data_1d=data_15min([1:35:end],:);
[TS_1d,Trans_1d,Rec_1d,SPS_1d self_1d direct_1d crosmkt_1d]=GarchSV(data_1d,P,O,Q);
[TS_15min,Trans_15min,Rec_15min,SPS_15min self_15min direct_15min crosmkt_15min]=GarchSV(data_15min,P,O,Q);
[TS_1h,Trans_1h,Rec_1h,SPS_1h self_1h direct_1h crosmkt_1h]=GarchSV(data_1h,P,O,Q);
ResultsTCV=[TS_15min TS_1h  TS_1d]
Resultsdetail=[self_15min direct_15min crosmkt_15min; self_1h direct_1h crosmkt_1h;self_1d direct_1d crosmkt_1d]
% ResultsTrans=[Trans_15min Transsv_15min;Trans_1h Transsv_1h;Trans_1d Transsv_1d];
% ResultsRec=[Rec_15min Recsv_15min;Rec_1h Recsv_1h;Rec_1d Recsv_1d];
% ResultSPS=[SPS_15min SPSsv_15min;SPS_1h SPSsv_1h;SPS_1d SPSsv_1d];
%% Daily vs Hourly EU
clear
load('DATA_EU.mat')
P=1;
O=1;
Q=1;
N=1900;
data1_1h=Data_EU_hourly_1213(1:N,:);
data1_1d=Data_EU_hourly_1213(1:4:N,:);
data2_1h=Data_EU_hourly_1213(N:end,:);
data2_1d=Data_EU_hourly_1213(N:4:end,:);
data3_1h=Data_EU_hourly_1517(1:N,:);
data3_1d=Data_EU_hourly_1517(1:4:N,:);
data4_1h=Data_EU_hourly_1517(N:end,:);
data4_1d=Data_EU_hourly_1517(N:4:end,:);
[TS1_1h,Trans1_1h,Rec1_1h,SPS1_1h,TSsv1_1h,Transsv1_1h,Recsv1_1h,SPSsv1_1h]=GarchSV(data1_1h,P,O,Q);
[TS1_1d,Trans1_1d,Rec1_1d,SPS1_1d,TSsv1_1d,Transsv1_1d,Recsv1_1d,SPSsv1_1d]=GarchSV(data1_1d,P,O,Q);
[TS2_1h,Trans2_1h,Rec2_1h,SPS2_1h,TSsv2_1h,Transsv2_1h,Recsv2_1h,SPSsv2_1h]=GarchSV(data2_1h,P,O,Q);
[TS2_1d,Trans2_1d,Rec2_1d,SPS2_1d,TSsv2_1d,Transsv2_1d,Recsv2_1d,SPSsv2_1d]=GarchSV(data2_1d,P,O,Q);
[TS3_1h,Tran3s_1h,Rec3_1h,SPS3_1h,TSsv3_1h,Transsv3_1h,Recsv3_1h,SPSsv3_1h]=GarchSV(data3_1h,P,O,Q);
[TS3_1d,Trans3_1d,Rec3_1d,SPS3_1d,TSsv3_1d,Transsv3_1d,Recsv3_1d,SPSsv3_1d]=GarchSV(data3_1d,P,O,Q);
[TS4_1h,Trans4_1h,Rec4_1h,SPS4_1h,TSsv4_1h,Transsv4_1h,Recsv4_1h,SPSsv4_1h]=GarchSV(data4_1h,P,O,Q);
[TS4_1d,Trans4_1d,Rec4_1d,SPS4_1d,TSsv4_1d,Transsv4_1d,Recsv4_1d,SPSsv4_1d]=GarchSV(data4_1d,P,O,Q);
ResultsTCV=[TS1_1h TSsv1_1h; TS1_1d TSsv1_1d;TS2_1h TSsv2_1h; TS2_1d TSsv2_1d; ...
            TS3_1h TSsv3_1h; TS3_1d TSsv3_1d;TS4_1h TSsv4_1h; TS4_1d TSsv4_1d]
%% Non_overlap
clear
load('Data_NO.mat')
P=1;
O=0;
Q=1;
% Estimate parameters for 15min,1 hour, and 1day
N=1080;
data_15min=Data_NO_15min_1213(1001:2000,:);
data_1h=data_15min([1:4:end],:);
data_1d=data_15min([1:18:end],:);
[TS_1d,Trans_1d,Rec_1d,SPS_1d self_1d direct_1d crosmkt_1d]=GarchSV(data_1d,P,O,Q);
[TS_15min,Trans_15min,Rec_15min,SPS_15min self_15min direct_15min crosmkt_15min]=GarchSV(data_15min,P,O,Q);
[TS_1h,Trans_1h,Rec_1h,SPS_1h self_1h direct_1h crosmkt_1h]=GarchSV(data_1h,P,O,Q);
ResultsTCV=[TS_15min TS_1h  TS_1d]
Resultsdetail=[self_15min direct_15min crosmkt_15min; self_1h direct_1h crosmkt_1h;self_1d direct_1d crosmkt_1d]
%% 
clear
load('Data_NO.mat')
P=1;
O=1;
Q=1;
N=1400;
data1_1h=Data_NO_hourly(1:N,:);
data1_1d=Data_NO_hourly(1:4:N,:);
data2_1h=Data_NO_hourly(N:end,:);
data2_1d=Data_NO_hourly(N:4:end,:);
% data3_1h=Data_NO_hourly_1517(1:N,:);
% data3_1d=Data_NO_hourly_1517(1:4:N,:);
% data4_1h=Data_NO_hourly_1517(N:end,:);
% data4_1d=Data_NO_hourly_1517(N:4:end,:);
[TS1_1h,Trans1_1h,Rec1_1h,SPS1_1h,TSsv1_1h,Transsv1_1h,Recsv1_1h,SPSsv1_1h]=GarchSV(data1_1h,P,O,Q);
[TS1_1d,Trans1_1d,Rec1_1d,SPS1_1d,TSsv1_1d,Transsv1_1d,Recsv1_1d,SPSsv1_1d]=GarchSV(data1_1d,P,O,Q);
[TS2_1h,Trans2_1h,Rec2_1h,SPS2_1h,TSsv2_1h,Transsv2_1h,Recsv2_1h,SPSsv2_1h]=GarchSV(data2_1h,P,O,Q);
[TS2_1d,Trans2_1d,Rec2_1d,SPS2_1d,TSsv2_1d,Transsv2_1d,Recsv2_1d,SPSsv2_1d]=GarchSV(data2_1d,P,O,Q);
% [TS3_1h,Tran3s_1h,Rec3_1h,SPS3_1h,TSsv3_1h,Transsv3_1h,Recsv3_1h,SPSsv3_1h]=GarchSV(data3_1h,P,O,Q);
% [TS3_1d,Trans3_1d,Rec3_1d,SPS3_1d,TSsv3_1d,Transsv3_1d,Recsv3_1d,SPSsv3_1d]=GarchSV(data3_1d,P,O,Q);
% [TS4_1h,Trans4_1h,Rec4_1h,SPS4_1h,TSsv4_1h,Transsv4_1h,Recsv4_1h,SPSsv4_1h]=GarchSV(data4_1h,P,O,Q);
% [TS4_1d,Trans4_1d,Rec4_1d,SPS4_1d,TSsv4_1d,Transsv4_1d,Recsv4_1d,SPSsv4_1d]=GarchSV(data4_1d,P,O,Q);
ResultsTCV=[TS1_1h TSsv1_1h; TS1_1d TSsv1_1d;TS2_1h TSsv2_1h; TS2_1d TSsv2_1d];