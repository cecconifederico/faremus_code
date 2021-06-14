load('postVSpost_SX.mat');
load('postVSpost_DX.mat');
load('preVSpre_SX.mat');
load('preVSpre_DX.mat');
confronti_interni=cat(1,preVSpre_DX,preVSpre_SX,postVSpost_DX,postVSpost_SX);
csvwrite('confronti_interni.csv',confronti_interni);