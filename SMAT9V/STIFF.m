function [SM]=STIFF(D,X,Y,T)
H=HMAT(D,X,Y,T);%Ž®(4.40)‚Ì[H]
HI=inv(H);TM=TMATR(X,Y,T);
SM=(TM') * real(HI') * TM;
