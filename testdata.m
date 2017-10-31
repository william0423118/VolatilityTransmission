function testdata(Alldata1)
Data_NA=Alldata1(:,1:2);
Data_AS=Alldata1(:,3:5);
Data_EU=Alldata1(:,6:8);
Data_NO=Alldata1(:,[1 4 6]);
for i=1:4
    switch i
        case 1
            Data=Alldata1(:,1:2);
        case 2
            Data=Alldata1(:,3:5); 
        case 3
            Data=Alldata1(:,6:8);
        case 4
            Data_NO=Alldata1(:,[1 4 6]);
    end
for i=1:3
    switch i
        case 1
          data=Data([23:23:end],:);
        case 2
           data=Data([4:4:end],:);
        case 3
            data=Data;
    end
Test=CancelZro(data);
Test=diff(log(Test));
Resduals=GetRes(Test);
end
end