function Resduals=GetRes(DataMtx)
[row,col]=size(DataMtx);

Mdl = egarch('Offset',NaN','GARCHLags',1,'ARCHLags',1,'LeverageLags',1);
Resduals=[];
for i=1:col
    %Mdl = garch('GARCHLags',1,'ARCHLags',1);
    EstMdl = estimate(Mdl,DataMtx(:,i));
    v = infer(EstMdl,DataMtx(:,i));
    res = (DataMtx(:,i)-EstMdl.Offset)./sqrt(v);
    Resduals=[Resduals,res];
end


