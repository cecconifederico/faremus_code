pazienti=[1 2 4 6 8 12 15 17 18 19];
PREDXvsPRESX=zeros(1,8,10);
   for k=1:size(pazienti,2)
v01=zeros(1,1); %vettore per le posizioni degli spike della condizione 01
z=1;
for g=1:size(DX,1)
    if DX(g,2,k)==0 && DX(g,3,k)==1 %condizione pre + stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v01(z,1)=g;
       z=z+1;
    end
end
v00=zeros(1,1); %vettore per le posizioni degli spike della condizione 00
z=1;
for g=1:size(SX,1)
    if SX(g,2,k)==0 && SX(g,3,k)==0 %condizione pre + stimolazione a dx (sto prendendo i segnali sinistri, quindi vedo qualcosa solo se stimolo a dx)
        v00(z,1)=g;
        z=z+1;
    end
end

z=1;
PDPS=zeros(1,8);
for i=1:size(v01,1)
    for j=1:size(v00,1)
        PDPS(z,1)=i; %indice dello spike preDx
        PDPS(z,2)=0; %pre
        PDPS(z,3)=1; %stimolazione a sx
        PDPS(z,4)=j; %indice dello spike preSx
        PDPS(z,5)=0; %pre
        PDPS(z,6)=0; %stimolazione dx
        [cm,cSq]=DiscreteFrechetDist(DX(v01(i,1),5:end,k),SX(v00(j,1),5:end,k)); 
        PDPS(z,7)=cm; %distanza di frechet
        PDPS(z,8)=pazienti(k); %indice paziente
        z=z+1;
    end
end
combo=size(PDPS,1);
PREDXvsPRESX(1:combo,:,k)=PDPS;
   end
   
   preDXVSpreSX=cat(1,PREDXvsPRESX(:,:,1),PREDXvsPRESX(:,:,2),PREDXvsPRESX(:,:,3),PREDXvsPRESX(:,:,4),PREDXvsPRESX(:,:,5),PREDXvsPRESX(:,:,6),PREDXvsPRESX(:,:,7),PREDXvsPRESX(:,:,8),PREDXvsPRESX(:,:,9),PREDXvsPRESX(:,:,10));
   
   A=preDXVSpreSX(:,1);
   nulle=find(~A);
   preDXVSpreSX(nulle,:)=[];
   
    save('preDXVSpreSX.mat','preDXVSpreSX');
