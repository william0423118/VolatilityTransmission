function [Final_Shock Shock_TS]=maketable(Shock_AS,Shock_EU,Shock_NA,Shock_NO)
% ret=(Alldata1(end,:)-Alldata1(1,:))./Alldata1(1,:);
Shock_TS=[Shock_AS.TS Shock_EU.TS Shock_NA.TS Shock_NO.TS];
Shock_Trans=[Shock_AS.Trans Shock_EU.Trans Shock_NA.Trans Shock_NO.Trans];
Shock_Rec=[Shock_AS.Rec Shock_EU.Rec Shock_NA.Rec Shock_NO.Rec];
Shock_SPS=[Shock_AS.SPS Shock_EU.SPS Shock_NA.SPS Shock_NO.SPS];
Shock_self=[Shock_AS.self Shock_EU.self Shock_NA.self Shock_NO.self];
Shock_direct=[Shock_AS.direct Shock_EU.direct Shock_NA.direct Shock_NO.direct];
Shock_crosmkt=[Shock_AS.crosmkt Shock_EU.crosmkt Shock_NA.crosmkt Shock_NO.crosmkt];
Final_Shock=[zeros(1,11);Shock_Trans;zeros(2,11);Shock_Rec; ...
    zeros(2,11);Shock_self;zeros(2,11);Shock_direct;zeros(2,11);Shock_crosmkt];
end