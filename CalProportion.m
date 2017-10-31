function [self direct crosmkt]=CalProportion(A,B)
[row,col]=size(A);
for i=1:row
    self(i)=A(i,i)^2/(sum(A(i,:)))^2;
    direct(i)=(sum(A(i,:).^2)-A(i,i)^2)/(sum(A(i,:)))^2;
    crosmkt(i)=1-self(i)-direct(i);
end

for i=1:row
    self1(i)=B(i,i)^2/(sum(B(i,:)))^2;
    direct1(i)=(sum(B(i,:).^2)-B(i,i)^2)/(sum(B(i,:)))^2;
    crosmkt1(i)=1-self1(i)-direct1(i);
end

for i=1:row
    self2(i)=(A(i,i)^2+B(i,i)^2)/((sum(A(i,:)))^2+(sum(B(i,:)))^2);
    direct2(i)=((sum(B(i,:).^2)-B(i,i)^2)+(sum(A(i,:).^2)-A(i,i)^2))/((sum(A(i,:)))^2+(sum(B(i,:)))^2);
    crosmkt2(i)=1-self2(i)-direct2(i);
end

self=[self;self1;self2];
direct=[direct;direct1;direct2];
crosmkt=[crosmkt;crosmkt1;crosmkt2];