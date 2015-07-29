function [MODE,FRQ,TMM,XX,YY,ZZ,KAKOM]=MAIN(FRQ0,NEIG)
% DYNAMIC PROBLEM OF 3-DIMENSIONAL BEAM STRUCTURE
%  ++++++++++ data input ++++++++++++++++++
[XX,YY,ZZ,KAKOM,NFREE,TEISUU,KOTEI]=DATAIN4;
NELT=size(KAKOM,1);NODT=size(XX,1);
if NODT==1
  NODT=size(XX,2);
 else
end
NT=NODT*6;
%  ------- end (data input) -----------
 TK=zeros(NT,NT);
 TM=zeros(NT,NT);
%
%  +++++++ element assembly +++++++++++++
for NE=1:NELT

EA=TEISUU(NE,1);EIY=TEISUU(NE,2);EIZ=TEISUU(NE,3);
RA=TEISUU(NE,4);GJ=TEISUU(NE,5);RI=TEISUU(NE,6);
   IN=KAKOM(NE,1);
     XI=XX(IN);YI=YY(IN);ZI=ZZ(IN);
   JN=KAKOM(NE,2);
     XJ=XX(JN);YJ=YY(JN);ZJ=ZZ(JN);
   [HEN,FL]=HENKA1(XI,XJ,YI,YJ,ZI,ZJ);
   [CK]=SKMAT(FL,RA,EA,EIZ,EIY,GJ,RI);
     CK=HEN' * CK * HEN;
   K1=((KAKOM(NE,1)-1)*6)+(1:6);
   K2=((KAKOM(NE,2)-1)*6)+(1:6);
  TK(K1,K1)=TK(K1,K1)+CK(1:6,1:6);
  TK(K1,K2)=TK(K1,K2)+CK(1:6,7:12);
  TK(K2,K2)=TK(K2,K2)+CK(7:12,7:12);
  TK(K2,K1)=TK(K2,K1)+CK(7:12,1:6);
   [CM]=BQMAT(FL,RA,RI);
     CM=HEN' * CM * HEN;
   K1=((KAKOM(NE,1)-1)*6)+(1:6);
   K2=((KAKOM(NE,2)-1)*6)+(1:6);
  TM(K1,K1)=TM(K1,K1)+CM(1:6,1:6);
  TM(K1,K2)=TM(K1,K2)+CM(1:6,7:12);
  TM(K2,K2)=TM(K2,K2)+CM(7:12,7:12);
  TM(K2,K1)=TM(K2,K1)+CM(7:12,1:6);
%
end
% -------- end (assembly) --------------
TMM=TM;
% +++++++ boundary condition ++++++++++++
if NFREE==1
 MM=NT;
 KY=1:NT;
else
 [TK,MM,KY]=PREREA1(TK,NT,KOTEI);
 [TM,MM,KY]=PREREA1(TM,NT,KOTEI);
end
% ------- end (boundary) ----------------
% ++++++++ solver ++++++++++++++++++++++++
SHIFT=(2*3.1415926*FRQ0)^2;
TK=TK-SHIFT*TM;
[VEC,RAMDA]=SUBSPA(TK,TM,MM,NEIG);
 FRQ=zeros(NEIG,1);
for J=1:NEIG
 FRQ(J,1)=sqrt(abs(SHIFT+RAMDA(J,1)));
 FRQ(J,1)=FRQ(J,1)/2.0/3.1415926;
end
% -------- end (solve) ------------------
MODE=zeros(NT,NEIG);
% ++++++++++ rearrangement ++++++++++++++
for NE=1:NEIG
B=VEC(1:MM,NE);
 if NFREE==1 
  MODE(1:NT,NE)=B;
 else
  B=B';
  [B]=ARRMAT1(B,NT,MM,KY); MODE(1:NT,NE)=B';
 end
end
