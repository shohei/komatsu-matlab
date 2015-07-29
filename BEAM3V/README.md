3次元骨組み構造の振動解析
=====================

MAIN.mの中のDATAIN2, DATAIN3などを使うものに置き換える。

``` matlab
[MODE,FRQ,TMM,XX,YY,ZZ,KAKOM] = MAIN(0,8); %８次モード
[HZ] = MODESH(8,MODE,FRQ,XX,YY,ZZ,KAKOM); %グラフ描画
```

![](./image/skelton.png)
