function [FRQ,MODE,XYZ,KAKOM]=MAIN(FRQ0,NEIG)
[XYZ,D,KOTEI,KAKOM,T,ROW,NFREE]=DATAIN2;
[NODT,DIM]=size(XYZ);[NELT,KAKU]=size(KAKOM);
[NOFIX,JIYU]=size(KOTEI);NT=NODT*(JIYU-1);
TK=zeros(NT,NT);TM=zeros(NT,NT);
for NE=1:NELT
  K3=KAKOM(NE,1:3);
  X=XYZ(K3,1); Y=XYZ(K3,2);
  SM=STIFF(D,X,Y,T);  QM=MASSM(ROW,X,Y,T);
  TK=ASMAT(TK,SM,KAKOM,NE);
  TM=ASMAT(TM,QM,KAKOM,NE);
end
if NFREE==1
 MM=NT; KY=1:NT;
 else
[TK,MM,KY]=PREREA1(TK,NT,KOTEI);
[TM,MM,KY]=PREREA1(TM,NT,KOTEI);
end
% ++++++++ solver ++++++++++++++++++++++++
SHIFT=(2*3.1415926*FRQ0)^2;
TK=TK-SHIFT*TM;
[VEC,RAMDA]=SUBSPA(TK,TM,MM,NEIG);
FRQ=zeros(NEIG,1);
for J=1:NEIG
 FRQ(J,1)=sqrt(abs(SHIFT+RAMDA(J,1)));
 FRQ(J,1)=FRQ(J,1)/2.0/3.1415926;
end
[FRQ,NARABI]=sort(FRQ);
% -------- end (solve) ---------
MODE=zeros(NT,NEIG);
% ++++++++++ rearrangement +++++++++++++
for NE=1:NEIG
NARA=NARABI(NE);B=VEC(1:MM,NARA)';
if NFREE==1
 MODE(1:NT,NE)=B;
 else
 B=B'; [B]=ARRMAT1(B,NT,MM,KY); MODE(1:NT,NE)=B';
 end
end
