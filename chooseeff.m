function datanew=chooseeff(Data)
data=Data([23:23:end],:,:);
Num=size(data,3);
Do=[];
for i=1:Num
Resduals=[];
Test=CancelZro(data(:,:,i));
Test=diff(log(Test));
try
Resduals(:,:)=GetRes(Test);
catch
end
if isempty(Resduals)==0
    Do=[Do,i];
end
Resduals=[];
end

datanew=Data(:,:,Do);

