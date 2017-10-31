function [Shock VolSp VolT]=GarchVT(Data,P,O,Q)

for i=1:3
    switch i
        case 1
          data=Data([23:23:end],:);
        case 2
           data=Data([4:4:end],:);
        case 3
            data=Data;
    end
DataMtx=CancelZro(data);
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
%TS=[TS; TSsv; TStol];
%Trans=[Trans;Transsv;Transtol];
%Rec=[Rec;Recsv;Rectol];
%SPS=[SPS;SPSsv;SPStol];
[self direct crosmkt]=CalProportion(A,B);
%ret=(data(end)-data(1))/data(1);

Shock.TS(i,:)=TS;
Shock.Trans(i,:)=Trans;
Shock.Rec(i,:)=Rec;
Shock.SPS{i}=SPS;
Shock.self(i,:)=self(1,:);
Shock.direct(i,:)=direct(1,:);
Shock.crosmkt(i,:)=crosmkt(1,:);

VolSp.TS(i,:)=TSsv;
VolSp.Trans(i,:)=Transsv;
VolSp.Rec(i,:)=Recsv;
VolSp.SPS{i}=SPSsv;
VolSp.self(i,:)=self(2,:);
VolSp.direct(i,:)=direct(2,:);
VolSp.crosmkt(i,:)=crosmkt(2,:);

VolT.TS(i,:)=TStol;
VolT.Trans(i,:)=Transtol;
VolT.Rec(i,:)=Rectol;
VolT.SPS{i}=SPStol;
VolT.self(i,:)=self(3,:);
VolT.direct(i,:)=direct(3,:);
VolT.crosmkt(i,:)=crosmkt(3,:);
end