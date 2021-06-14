load('postVSpre_SX.mat');
load('postVSpre_DX.mat');
load('preDXVSpreSX.mat');
load('postDXVSpostSX.mat');
confronti=cat(1,postVSpre_SX,postVSpre_DX,preDXVSpreSX,postDXVSpostSX);
csvwrite('confronti.csv',confronti);