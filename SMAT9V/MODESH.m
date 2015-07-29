function [FREQHZ]= MODESH(NM,MODE,FRQ,XYZ,KAKOM)
XX=XYZ(:,1);YY=XYZ(:,2);ZZ=XYZ(:,3);
NELT=size(KAKOM,1);NODT=size(XX,1);NT=NODT*3;
AMP=0;FREQHZ=0;
 for NE=1:NELT
   IN=KAKOM(NE,1);
     XI=XX(IN);YI=YY(IN);ZI=ZZ(IN);
   JN=KAKOM(NE,2);
     XJ=XX(JN);YJ=YY(JN);ZJ=ZZ(JN);
   KN=KAKOM(NE,3);
     XK=XX(KN);YK=YY(KN);ZK=ZZ(KN);
  X=[XI,XJ,XK,XI];Y=[YI,YJ,YK,YI];Z=[ZI,ZJ,ZK,ZI];
  plot3(X,Y,Z,':'),hold on
 end
if NM==0
else
 FREQHZ=FRQ(NM,1); SHI=reshape(MODE(1:NT,NM),3,NODT)';
 LX=max(XX)-min(XX);LY=max(YY)-min(YY);LZ=max(ZZ)-min(ZZ);
 LEN=max([LX,LY,LZ]);
 WS=SHI(:,1);AMP=0.1*LEN;
XS=XX;YS=YY;ZS=ZZ+WS*AMP;
 for NE=1:NELT
   IN=KAKOM(NE,1);
     XI=XS(IN);YI=YS(IN);ZI=ZS(IN);
   JN=KAKOM(NE,2);
     XJ=XS(JN);YJ=YS(JN);ZJ=ZS(JN);
   KN=KAKOM(NE,3);
     XK=XS(KN);YK=YS(KN);ZK=ZS(KN);
   X=[XI,XJ,XK,XI];Y=[YI,YJ,YK,YI];Z=[ZI,ZJ,ZK,ZI];
  plot3(X,Y,Z),hold on
 end
end
axis('equal')
hold off
