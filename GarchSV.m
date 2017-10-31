function [TS,Trans,Rec,SPS self direct crosmkt]=GarchSV(Data,P,O,Q)
DataMtx=CancelZro(Data);
DataMtx=diff(log(DataMtx));
Resduals=GetRes(DataMtx);
K=size(Resduals,2);
[PARAMETERS,LL,HT,VCV,SCORES] = bekk(Resduals,[],P,O,Q,'Full',[],[]);
[C,A,G,B] = bekk_parameter_transform(PARAMETERS,P,O,Q,K,3);
% A is the effect of shock of vol
% B is the volatility spillover
[TS,Trans,Rec,SPS]=GetSpillover(A);
[TSsv,Transsv,Recsv,SPSsv]=GetSpillover(B);
[TStol,Transtol,Rectol,SPStol]=GetSpillover2(A,B);
TS=[TS; TSsv; TStol];
Trans=[Trans;Transsv;Transtol];
Rec=[Rec;Recsv;Rectol];
SPS=[SPS;SPSsv;SPStol];
[self direct crosmkt]=CalProportion(A,B);