function [TS,Trans,Rec,SPS]=GetVS(A)
    %SPS=A;
    [row,col]=size(A);
    for j=1:row
        for k=1:col
            theta(j,k)=A(j,k)/sum(A(j,:)); % nomalize the contribution
        end
    end
    TS=(row-sum(diag(theta(:,:))))/row*100;
    for i=1:size(theta,2)
        Trans(i)=(sum(theta(i,:))-theta(i,i))/row*100;
        Rec(i)=(sum(theta(:,i))-theta(i,i))/row*100;
    end
    for j=1:row
        for k=1:col
            SPS(j,k)=(theta(j,k)-theta(k,j))/col*100;
        end
    end    