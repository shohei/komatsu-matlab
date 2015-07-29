function [H]=HMAT(D,X,Y,T)
H=zeros(9,9);AA=16/3*T;BB=8/15*(T*T*T);
A=0;XS=0;YS=0;XX=0;YY=0;XY=0;
for I=1:3
 J=I+1;
   if(I == 3) 
      J=1;
   else
   end
  XI=X(I);XJ=X(J);YI=Y(I);YJ=Y(J);
   if((XJ-XI) == 0)
     S=0;R=0;
   else
     S=(YJ-YI)/(XJ-XI);R=(XI*YJ-XJ*YI)/(XI-XJ);
   end
 Z1=XJ-XI; Z2=XJ*XJ-XI*XI;Z3=XJ^3-XI^3;Z4=XJ^4-XI^4;
 A=A-0.5*S*Z2-R*Z1;XS=XS-S*Z3/3-0.5*R*Z2;
 YS=YS-S*S*Z3/6-S*R*0.5*Z2-0.5*R*R*Z1;
 XX=XX-0.25*S*Z4-R*Z3/3;
 XY=XY-S*S*Z4/8-S*R*Z3/3-R*R*Z2/4;
 YY=YY-S*S*S*Z4/12-S*S*R*Z3/3-S*R*R*Z2*0.5-R*R*R*Z1/3;
end
H(1,1)=D(1)*AA*A;H(2,1)=D(1)*AA*XS;
 H(1,2)=H(2,1);H(3,1)=D(1)*AA*YS;
 H(1,3)=H(3,1);H(4,1)=D(3)*AA*A;
 H(1,4)=H(4,1);H(5,1)=D(3)*AA*XS;
 H(1,5)=H(5,1);H(6,1)=D(3)*AA*YS;
 H(1,6)=H(6,1);H(2,2)=D(1)*AA*XX+D(5)*BB*A;
H(3,2)=D(1)*AA*XY; H(2,3)=H(3,2);
H(4,2)=D(3)*AA*XS; H(2,4)=H(4,2);
H(5,2)=D(3)*AA*XX; H(2,5)=H(5,2);
H(6,2)=D(3)*AA*XY; H(2,6)=H(6,2);
H(9,2)=D(5)*BB*A; H(2,9)=H(9,2);
H(3,3)=D(1)*AA*YY;H(4,3)=D(3)*AA*YS;
 H(3,4)=H(4,3);H(5,3)=D(3)*AA*XY;
 H(3,5)=H(5,3);H(6,3)=D(3)*AA*YY;
 H(3,6)=H(6,3);H(4,4)=D(2)*AA*A;
H(5,4)=D(2)*AA*XS; H(4,5)=H(5,4);
H(6,4)=D(2)*AA*YS; H(4,6)=H(6,4);
H(5,5)=D(2)*AA*XX;H(6,5)=D(2)*AA*XY;
 H(5,6)=H(6,5);H(6,6)=D(2)*AA*YY+D(6)*BB*A;
H(8,6)=D(6)*BB*A; H(6,8)=H(8,6);
H(7,7)=D(4)*AA*A;H(8,7)=D(4)*AA*XS;
 H(7,8)=H(8,7);H(9,7)=D(4)*AA*YS;
 H(7,9)=H(9,7);H(8,8)=D(4)*AA*XX+D(6)*BB*A;
H(9,8)=D(4)*AA*XY; H(8,9)=H(9,8);
H(9,9)=D(4)*AA*YY+D(5)*BB*A;