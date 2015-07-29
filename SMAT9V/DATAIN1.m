function[XYZ,D,KOTEI,KAKOM,T,ROW,NFREE]=DATAIN1
A=3;B=2;E=1.0;PO=0.3;T=0.01;ROW=0.01;NFREE=0;
N=16;
N2=N*N;
N1=N-1;XX=1:N2;YY=1:N2;
for I=1:N
IN=(I-1)*N+(1:N);
XX(IN)=(1:N)-1;YY(IN)=(I-1)+0*(1:N);
end
XX=XX*(A/N1);YY=YY*(B/N1);ZZ=0*(1:N2);
XYZ=[XX;YY;ZZ]';
KA=2*((N-1)^2);KAKOM=zeros(KA,3);
for I=1:N1
IK=(I-1)*N1*2+(1:N1);IKN=N1+IK;
I1=(I-1)*N+(1:N1);I2=I1+1;I3=I2+N;
J1=I1;J2=J1+N+1;J3=I1+N;
III=[I1;I2;I3]';JJJ=[J1;J2;J3]';
KAKOM(IK,:)=III;KAKOM(IKN,:)=JJJ;
end
NC=N*2+(N-2)*2;KOTEI=1+zeros(NC,4);
IN=(1:N);KOTEI(IN,1)=IN;
for I=1:(N-2)
I2=N+I*2-1;I21=I2+1;
KOTEI(I2,1)=N*I+1;KOTEI(I21,1)=N*(I+1);
end
IK=I21+(1:N);KOTEI(IK,1)=N1*N+(1:N);
D1=1.0/E;D3=-PO*D1;D4=2*(1+PO)/E;
D=[D1 D1 D3 D4 D4 D4];
