function [TS,Trans,Rec,SPS]=GetSpillover2(A,B)
TS=(sum(sum(A.^2))-sum(diag(A.^2))+sum(sum(B.^2))-sum(diag(B.^2)))/(sum(sum(A.^2))+sum(sum(B.^2)))*100;
C=A.^2;
D=B.^2;
for i=1:size(A,2)
    Trans(i)=(sum(C(i,:))-C(i,i)+sum(D(i,:))-D(i,i))/(sum(C(i,:))+sum(D(i,:)))*100;
    Rec(i)=(sum(C(:,i))-C(i,i)+sum(D(:,i))-D(i,i))/(sum(C(:,i))+sum(D(:,i)))*100;
end
SPS=A+B;