function[QM]=MASSM(ROW,X,Y,T)
S1=X(2)*Y(3)+X(3)*Y(1)+X(1)*Y(2);
S=S1-X(2)*Y(1)-X(3)*Y(2)-X(1)*Y(3);
S6=ROW*T*S/6;QM=zeros(9,9);
QM(1,1)=S6;QM(4,4)=S6;QM(7,7)=S6;
