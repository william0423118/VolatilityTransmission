%% 1. PRELIMINARIES
% =======================================================================
clear all; clear session; close all; clc
warning off all

% Load
exp1=[5:11];
exp2=[5:10 4];
exp3=[2:4];
DateMtx = xlsread('data.xlsx');
DateMtx=CancelZro(DateMtx);
DateMtx=diff(log(DateMtx));  % do log return on original data
DateMtx=DateMtx(:,exp1); % Only INDEX EXP1 USE
%DateMtx=DateMtx(:,[5:10 4]); % VIX INDEX EXP2 USE
%DateMtx=DateMtx(:,2:4); %VIX EXP# USE

[xlsdata, xlstext] = xlsread('Data.xlsx','Sheet1');
% Define data
X = DateMtx;
% Define label for plots
%dates = xlstext(2:end,1);
vnames = xlstext(1,exp1);
% Define number of variables and of observations
[nobs, nvar] = size(X);


%% VAR ESTIMATION
% =======================================================================
% Set the case for the VARout (0, 1, or 2)
det = 2;
% Set number of nlags
nlags = 4;
% Estimate 
[VAR, VARopt] = VARmodel(X,nlags,det);
% Print at screen and create table
VARopt.vnames = vnames;
[beta, tstat, TABLE] = VARprint(VAR,VARopt);


%% IMPULSE RESPONSE
% =======================================================================
% Set options some options for IRF calculation
VARopt.nsteps = 60;
VARopt.ident = 'oir';
VARopt.quality = 0;
% Compute IRF
[IRF, VAR] = VARir(VAR,VARopt);
% Compute error bands
[IRFINF,IRFSUP,IRFMED] = VARirband(VAR,VARopt);
% Plot
VARirplot(IRFMED,VARopt,IRFINF,IRFSUP);


%% HISTORICAL DECOMPOSITION
% =======================================================================
% Compute HD
HD = VARhd(VAR);
% Plot HD
VARhdplot(HD,VARopt);


%% FORECAST ERROR VARIANCE DECOMPOSITION
% =======================================================================
% Compute FEVD
[FEVD, VAR] = VARfevd(VAR,VARopt);
% Compute error bands
[FEVDINF,FEVDSUP,FEVDMED] = VARfevdband(VAR,VARopt);
% Plot
VARfevdplot(FEVDMED,VARopt,FEVDINF,FEVDSUP);

