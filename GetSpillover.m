function [TS,Trans,Rec,SPS]=GetSpillover(A)
TS=(sum(sum(A.^2))-sum(diag(A.^2)))/sum(sum(A.^2))*100;
B=A.^2;
for i=1:size(A,2)
    Trans(i)=(sum(B(i,:))-B(i,i))/sum(B(i,:))*100;
    Rec(i)=(sum(B(:,i))-B(i,i))/sum(B(:,i))*100;
end
SPS=A;
