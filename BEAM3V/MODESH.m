function [FREQHZ]= MODESH(NM,MODE,FRQ,XX,YY,ZZ,KAKOM)
NELT=size(KAKOM,1);NODT=size(XX,2);
if NODT==1
 NODT=size(XX,1);
 XX=XX';YY=YY';ZZ=ZZ';
 else
end
NT=6*NODT;AMP=0;FREQHZ=0;
 for NE=1:NELT
   IN=KAKOM(NE,1);
     XI=XX(IN);YI=YY(IN);ZI=ZZ(IN);
   JN=KAKOM(NE,2);
     XJ=XX(JN);YJ=YY(JN);ZJ=ZZ(JN);
   X=[XI,XJ];Y=[YI,YJ];Z=[ZI,ZJ];
  plot3(X,Y,Z,':'),hold on
 end
if NM==0
else
 FREQHZ=FRQ(NM,1); SHI=reshape(MODE(1:NT,NM),6,NODT)';
 LX=max(XX)-min(XX);LY=max(YY)-min(YY);LZ=max(ZZ)-min(ZZ);
 LEN=max([LX,LY,LZ]);AMP=0.1*LEN;
 XS=SHI(1:NODT,1)'; YS=SHI(1:NODT,2)'; ZS=SHI(1:NODT,3)';
 XS=XX+XS*AMP; YS=YY+YS*AMP; ZS=ZZ+ZS*AMP;
 for NE=1:NELT
   IN=KAKOM(NE,1);
     XI=XS(IN);YI=YS(IN);ZI=ZS(IN);
   JN=KAKOM(NE,2);
     XJ=XS(JN);YJ=YS(JN);ZJ=ZS(JN);
   X=[XI,XJ];Y=[YI,YJ];Z=[ZI,ZJ];
  plot3(X,Y,Z),hold on
 end
end
axis('equal')
hold off
