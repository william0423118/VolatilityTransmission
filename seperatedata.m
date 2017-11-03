function [Data_NA Data_AS Data_EU Data_NO]=seperatedata(window,Alldata)

N=[1:window:size(Alldata,1)];
for i=1:(size(N,2)-1)
    Alldata2(:,:,i)=Alldata(N(i):N(i+1),:);
    Data_NA(:,:,i)=Alldata2(:,1:2,i);
    Data_AS(:,:,i)=Alldata2(:,3:5,i);
    Data_EU(:,:,i)=Alldata2(:,6:8,i);
    Data_NO(:,:,i)=Alldata2(:,[1 4 6],i);
end

 Data_NA=chooseeff(Data_NA);
 Data_AS=chooseeff(Data_AS);
 Data_EU=chooseeff(Data_EU);
 Data_NO=chooseeff(Data_NO);
    