function [TS,Nets,theta,NPS]=GetVolSpov(Data,p,lambda,vdhmax,h)
%% Generate VAR model and decomposit the error
result1 = VAR_est1(Data, p, 1, lambda); % get the VAR model results from VAR model, see the function "VAR_est1"
vd_mf = var_decomp(result1, vdhmax); % decomposate covariance matrix for error, see the function"var_decomp"
[row,col,dim]=size(vd_mf);
for i=1:dim
    for j=1:row
        for k=1:col
            theta(j,k,i)=vd_mf(j,k,i)/sum(vd_mf(j,:,i)); % nomalize the contribution
        end
    end
end
%% Total spillover index
% The total spillover index measures the contribution of spillovers of shocks across all variables to the total forecast error variance
for i=1:dim
    TS(i)=(row-sum(diag(theta(:,:,i))))/row;
end
    
%% Directional spillover index
% spillover receiver and transmitter
for i=1:dim
    for j=1:col
        Rec(j,i)=(sum(theta(j,:,i))-theta(j,j,i))/row;
        Trs(j,i)=(sum(theta(:,j,i))-theta(j,j,i))/row;
    end
end
% Net spillover index
Nets=Trs-Rec;
% Net pairwise spillover indice
for i=1:dim
    for j=1:row
        for k=1:col
            NPS(j,k,i)=(theta(j,k,i)-theta(k,j,i))/col*100;
        end
    end
end
TS=TS(h);
Nets=Nets(:,h);
theta=theta(:,:,h);
NPS=NPS(:,:,h);
