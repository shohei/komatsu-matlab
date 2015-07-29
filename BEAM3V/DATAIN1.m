function[XX,YY,ZZ,KAKOM,NFREE,TEISUU,KOTEI]=DATAIN1
NELT=16;NODT=16;
XX=100*[0 4 4 0 0 4 4 0 0 4 4 0 2 4 2 0];
YY=100*[0 0 4 4 0 0 4 4 0 0 4 4 0 2 4 2];
ZZ=100*[0 0 0 0 2 2 2 2 4 4 4 4 4 4 4 4];
KAKOM=[1 5;5 9;2 6;6 10;3 7;7 11;4 8;8 12;9 13
       13 10;10 14;14 11;11 15;15 12;12 16;16 9];
% for the case of free boundary, NFREE=1
% for the constraint condition,NFREE=0 and input KOTEI 
  NFREE=0;
  KOTEI=[1 1 1 1 1 1 1
         2 1 1 1 1 1 1
         3 1 1 1 1 1 1
         4 1 1 1 1 1 1];
TEISUU=zeros(NELT,6);
for NE=1:NELT
   EA=1.055E6;EIY=4.222E6;EIZ=EIY;
   RA=3.971E-8;GJ=3.378E6;RI=3.177E-7;
TEISUU(NE,:)=[EA EIY EIZ RA GJ RI];
end
