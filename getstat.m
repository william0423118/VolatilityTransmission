function getstat(window,Alldata)
data=Alldata(1:window,:);
datalog=diff(log(data));
Mean=mean(datalog);
Median=median(datalog);
Max=max(datalog);
Min=min(datalog);
Std=std(datalog);
Skewness=skewness(datalog);
Kurtosis=kurtosis(datalog);
Table=[Mean;Median;Max;Min;Std;Skewness;Kurtosis];
filename = 'stat.xlsx';
xlswrite(filename,Table,1,'B2');