T=1000;
K=3;
P=1;
O=1;
Q=1;
TYPE='Full';

[DATA,HT] = bekk_simulate(T,K,PARAMETERS,P,O,Q,TYPE);
Resduals=GetRes(DATA);
[PARAMETERS_New,LL,HT,VCV,SCORES] = bekk(Resduals,[],P,O,Q,'Full',[],[]);
result=[PARAMETERS PARAMETERS_New]

mean(result(:,1)-result(:,2))