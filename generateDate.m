function DateMtx=generateDate(sig,m)
% In this function, we are going to generate three assets' return, with
% each one lag one step for last one.
% the parameters sig m stand for volatility, step number for custom design.
% the function with return a matrix that include all assets return.
noise=normrnd(0,sig,m,3);
asset1=noise(:,1);
asset2=asset1(2:end)+0.01.*noise(2:end,2);
asset3=asset1(3:end)+0.01.*noise(3:end,3);
asset1=asset1(1:end-2);
asset2=asset2(1:end-1);
DateMtx=[asset1 asset2 asset3];