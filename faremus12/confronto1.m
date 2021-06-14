pazienti=[1 2 4 6 8 12 15 17 18 19];
POSTSXvsPRESX=zeros(1,8,10);
   for k=1:size(pazienti,2)
v10=zeros(1,1); %vettore per le posizioni degli spike della condizione 10
z=1;
for g=1:size(SX,1)
    if SX(g,2,k)==1 && SX(g,3,k)==0 %condizione post-stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v10(z,1)=g;
       z=z+1;
    end
end
v00=zeros(1,1); %vettore per le posizioni degli spike della condizione 01
z=1;
for g=1:size(SX,1)
    if SX(g,2,k)==0 && SX(g,3,k)==0 %condizione pre-stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
        v00(z,1)=g;
        z=z+1;
    end
end
z=1;
PPS=zeros(1,8); %matrice per il paziente 1
for i=1:size(v10,1)
    for j=1:size(v00,1)
        PPS(z,1)=i; %indice dello spike pre
        PPS(z,2)=1; %post
        PPS(z,3)=0; %dx
        PPS(z,4)=j; %indice dello spike post
        PPS(z,5)=0; %pre
        PPS(z,6)=0; %dx
        [cm,cSq]=DiscreteFrechetDist(SX(v10(i,1),5:end,k),SX(v00(j,1),5:end,k));
        PPS(z,7)=cm; %distanza di frechet
        PPS(z,8)=pazienti(k); %indice paziente
        z=z+1;
    end
end
% combo=length(v01)*length(v11);
combo=size(PPS,1);
POSTSXvsPRESX(1:combo,:,k)=PPS;
   end
   postVSpre_SX=cat(1,POSTSXvsPRESX(:,:,1),POSTSXvsPRESX(:,:,2),POSTSXvsPRESX(:,:,3),POSTSXvsPRESX(:,:,4),POSTSXvsPRESX(:,:,5),POSTSXvsPRESX(:,:,6),POSTSXvsPRESX(:,:,7),POSTSXvsPRESX(:,:,8),POSTSXvsPRESX(:,:,9),POSTSXvsPRESX(:,:,10));
   
   A=postVSpre_SX(:,1);
   nulle=find(~A);
   postVSpre_SX(nulle,:)=[];
   
   save('postVSpre_SX.mat','postVSpre_SX');