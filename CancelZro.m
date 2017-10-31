function DateMtx=CancelZro(DateMtx)
% this fuction is designed for eliminate the row with "zero" and "NaN"
[row,col] = size(DateMtx);
for i=row:-1:1
    if (sum(find(DateMtx(i,:)==0))>0)||(sum(isnan(DateMtx(i,:))))
        DateMtx(i,:)=[];
    end
end
xlswrite('DataNew.xlsx',DateMtx(:,2:end));