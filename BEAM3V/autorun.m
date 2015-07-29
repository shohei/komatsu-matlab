%MAIN.mの中のDATAINを使うものに変える
path(path,'.')
[MODE,FRQ,TMM,XX,YY,ZZ,KAKOM] = MAIN(0,8); %８次モード
[HZ] = MODESH(8,MODE,FRQ,XX,YY,ZZ,KAKOM); %グラフ描画
