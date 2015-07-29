function[XX,YY,ZZ,KAKOM,NFREE,TEISUU,KOTEI]=DATAIN4
% FREE-FREE Frame Structure
L=1;NBAY=5;
NODT=(NBAY*2+1)*4;
XX=zeros(NODT,1);YY=XX;ZZ=XX;
XX(1:4)=[0 0 0 0];YY(1:4)=[0 L L 0];ZZ(1:4)=[0 0 L L];
for I=1:(NBAY*2)
NN=I*4+(1:4);
XX(NN)=[0 0 0 0]+(I*L);YY(NN)=YY(1:4);ZZ(NN)=ZZ(1:4);
end
KAKOM=zeros((13*NBAY*2+5),2);
KAKOM(1:13,:)=[1 2;2 3;3 4;4 1;1 5;2 6;3 7;4 8;
1 6;3 6;3 8;1 8;1 3];
KAKOM(14:26,:)=[5 6;6 7;7 8;8 5;5 9;6 10;7 11;8 12;
 6 9;6 11;8 11;8 9;8 6];
for I=1:(NBAY-1)
    NN=(1:26)+I*26;N13=(I+1)*26;
    KAKOM(NN,:)=KAKOM(1:26,:)+I*8;
end
NEND=[1 2 3 4 5]+NBAY*26;NN=NBAY*8+1;
KAKOM(NEND,:)=[NN (NN+1);(NN+1) (NN+2);(NN+2) (NN+3);(NN+3) NN;NN (NN+2)];
% for the case of free boundary, NFREE=1
% for the constraint condition,NFREE=0 and input KOTEI 
NFREE=1;
%  for clamped free case

KOTEI=[1 1 1 1 1 1 1;2 1 1 1 1 1 1;
       3 1 1 1 1 1 1;4 1 1 1 1 1 1];
NELT=size(KAKOM,1);
NODT=size(XX,1);
NT=6*NODT;
ELEMENT=0*(1:NELT);
for II=1:(2*NBAY)
 I1=(II-1)*13+(5:8);
 ELEMENT(I1)=[1 1 1 1];
end
%  TEISUU=[EA EIY EIZ RA GJ RI];
TEISUU=zeros(NELT,6);
EY=7.0E10;GG=3.0E10;RHR=30000;
for IN=1:NELT
 if ELEMENT(IN)==1
   TEISUU(IN,(1:3))=EY*[0.0003 1.5E-8 1.5E-8];
   TEISUU(IN,(4:6))=[RHR*0.0003 GG*3E-8 RHR*3E-8];
 else
   TEISUU(IN,(1:3))=EY*[0.0002 1E-8 1E-8];
   TEISUU(IN,(4:6))=[RHR*0.0002 GG*2E-8 RHR*2E-8]; 
 end
end
