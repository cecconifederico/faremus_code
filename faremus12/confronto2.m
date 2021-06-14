pazienti=[1 2 4 6 8 12 15 17 18 19];
POSTDXvsPREDX=zeros(1,8,10);%MANO DESTRA
   for k=1:size(pazienti,2)
v11=zeros(1,1); %vettore per le posizioni degli spike della condizione 11
z=1;
for g=1:size(DX,1)
    if DX(g,2,k)==1 && DX(g,3,k)==1 %condizione post + stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v11(z,1)=g;
       z=z+1;
    end
end
v01=zeros(1,1); %vettore per le posizioni degli spike della condizione 01
z=1;
for g=1:size(DX,1)
    if DX(g,2,k)==0 && DX(g,3,k)==1 %condizione pre + stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
        v01(z,1)=g;
        z=z+1;
    end
end

z=1;
PPD=zeros(1,8); %matrice per il paziente 1
for i=1:size(v11,1)
    for j=1:size(v01,1)
        PPD(z,1)=i; %indice dello spike post
        PPD(z,2)=1; %post
        PPD(z,3)=1; %sx
        PPD(z,4)=j; %indice dello spike pre
        PPD(z,5)=0; %pre
        PPD(z,6)=1; %sx
        [cm,cSq]=DiscreteFrechetDist(DX(v11(i,1),5:end,k),DX(v01(j,1),5:end,k)); 
        PPD(z,7)=cm; %distanza di frechet
        PPD(z,8)=pazienti(k); %indice paziente
        z=z+1;
    end
end
combo=size(PPD,1);
POSTDXvsPREDX(1:combo,:,k)=PPD;
   end
   
   postVSpre_DX=cat(1,POSTDXvsPREDX(:,:,1),POSTDXvsPREDX(:,:,2),POSTDXvsPREDX(:,:,3),POSTDXvsPREDX(:,:,4),POSTDXvsPREDX(:,:,5),POSTDXvsPREDX(:,:,6),POSTDXvsPREDX(:,:,7),POSTDXvsPREDX(:,:,8),POSTDXvsPREDX(:,:,9),POSTDXvsPREDX(:,:,10));
   
   A=postVSpre_DX(:,1);
   nulle=find(~A);
   postVSpre_DX(nulle,:)=[];
   
   save('postVSpre_DX.mat','postVSpre_DX');
        
        
