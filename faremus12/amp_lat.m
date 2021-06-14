A_L=zeros(11,9);
A_L(11,2)=11;
A_L(11,3)=0.1;
A_L(11,4)=10;
A_L(11,5)=0.0;
A_L(11,6)=11;
A_L(11,7)=0.1;
A_L(11,8)=10;
A_L(11,9)=0.0;
for j=1:size(pazienti,2)
% j=5;
    A_L(j,1)=pazienti(j);
provvisoria=zeros(1,500);
r=1;
for p=1:size(DX(:,:,j),1)
if DX(p,2,j)==1 && DX(p,3,j)==1
    provvisoria(r,:)=DX(p,5:end,j);
    r=r+1;
end
end
SM=sum(provvisoria);
k=SM/size(provvisoria,1);

MaX=max(k(1,150:370));
MiN=min(k(1,150:370));
A_L(j,2)=MaX-MiN;

for u=1:150
if k(u+1)-k(u)>5000
   trig=u+1;
end
end

k1=abs(k(1,150:370));
ind=find(k1==max(k1));
indice=ind+150;
lat=indice-trig;
A_L(j,6)=lat;

r=1;
for p=1:size(DX(:,:,j),1)
if DX(p,2,j)==0 && DX(p,3,j)==1
    provvisoria(r,:)=DX(p,5:end,j);
    r=r+1;
end
end
SM=sum(provvisoria);
k=SM/size(provvisoria,1);
MaX=max(k(1,150:370));
MiN=min(k(1,150:370));
A_L(j,3)=MaX-MiN;

for u=1:150
if k(u+1)-k(u)>5000
   trig=u+1;
end
end

k1=abs(k(1,150:370));
ind=find(k1==max(k1));
indice=ind+150;
lat=indice-trig;

A_L(j,7)=lat;

r=1;
for p=1:size(SX(:,:,j),1)
if SX(p,2,j)==1 && SX(p,3,j)==0
    provvisoria(r,:)=SX(p,5:end,j);
    r=r+1;
end
end
SM=sum(provvisoria);
k=SM/size(provvisoria,1);
MaX=max(k(1,150:370));
MiN=min(k(1,150:370));
A_L(j,4)=MaX-MiN;

for u=1:150
if k(u+1)-k(u)>5000
   trig=u+1;
end
end

k1=abs(k(1,150:370));
ind=find(k1==max(k1));
indice=ind+150;
lat=indice-trig;

A_L(j,8)=lat;
 
r=1;
for p=1:size(SX(:,:,j),1)
if SX(p,2,j)==0 && SX(p,3,j)==0
    provvisoria(r,:)=SX(p,5:end,j);
    r=r+1;
end
end
SM=sum(provvisoria);
k=SM/size(provvisoria,1);
MaX=max(k(1,150:370));
MiN=min(k(1,150:370));
A_L(j,5)=MaX-MiN;

for u=1:150
if k(u+1)-k(u)>5000
   trig=u+1;
end
end

k1=abs(k(1,150:370));
ind=find(k1==max(k1));
indice=ind+150;
lat=indice-trig;

A_L(j,9)=lat;
end
save('A_L.mat','A_L');