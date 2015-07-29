function [ck]=SKMAT(L,RA,EA,EIZ,EIY,GJ,RI)
L2=L*L;
L3=L2*L;
ck=zeros(12,12);
ck(1,1)=EA/L;ck(1,7)=-EA/L; ck(7,1)=ck(1,7);
ck(2,2)=12*EIZ/L3;ck(2,6)=6*EIZ/L2; ck(6,2)=ck(2,6);
ck(2,8)=-12*EIZ/L3; ck(8,2)=ck(2,8);ck(2,12)=6*EIZ/L2;
 ck(12,2)=ck(2,12);ck(3,3)=12*EIY/L3;ck(3,5)=-6*EIY/L2;
 ck(5,3)=ck(3,5);ck(3,9)=-12*EIY/L3; ck(9,3)=ck(3,9);
ck(3,11)=-6*EIY/L2; ck(11,3)=ck(3,11);ck(4,4)=GJ/L;
ck(4,10)=-GJ/L; ck(10,4)=ck(4,10);ck(5,5)=4*EIY/L;
ck(5,9)=6*EIY/L2; ck(9,5)=ck(5,9);ck(5,11)=2*EIY/L;
 ck(11,5)=ck(5,11);ck(6,6)=4*EIZ/L;ck(6,8)=-6*EIZ/L2;
 ck(8,6)=ck(6,8);ck(6,12)=2*EIZ/L; ck(12,6)=ck(6,12);
ck(7,7)=EA/L;ck(8,8)=12*EIZ/L3;ck(8,12)=-6*EIZ/L2;
 ck(12,8)=ck(8,12);ck(9,9)=12*EIY/L3;ck(9,11)=6*EIY/L2;
 ck(11,9)=ck(9,11);ck(10,10)=GJ/L;ck(11,11)=4*EIY/L;
ck(12,12)=4*EIZ/L;
