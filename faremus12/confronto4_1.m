pazienti=[1 2 4 6 8 12 15 17 18 19];
POSTDXvsPOSTSX=zeros(1,8,10);
   for k=1:size(pazienti,2)
v11=zeros(1,1); %vettore per le posizioni degli spike della condizione 11
z=1;
for g=1:size(DX,1)
    if DX(g,2,k)==1 && DX(g,3,k)==1 %condizione post + stimolazione a Sx (sto prendendo i segnali destri)
       v11(z,1)=g;
       z=z+1;
    end
end
v10=zeros(1,1); %vettore per le posizioni degli spike della condizione 10
z=1;
for g=1:size(SX,1)
    if SX(g,2,k)==1 && SX(g,3,k)==0 %condizione post + stimolazione a Dx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
        v10(z,1)=g;
        z=z+1;
    end
end

z=1;
PDPS=zeros(1,8); %matrice per il paziente 1
for i=1:size(v11,1)
    for j=1:size(v10,1)
        PDPS(z,1)=i; %indice dello spike postDx
        PDPS(z,2)=1; %post
        PDPS(z,3)=1; %STIMOLAZIONE A Sx
        PDPS(z,4)=j; %indice dello spike postSx
        PDPS(z,5)=1; %post
        PDPS(z,6)=0; %STIMOLAZIONE A Dx
        [cm,cSq]=DiscreteFrechetDist(DX(v11(i,1),5:end,1),SX(v10(j,1),5:end,1)); 
        PDPS(z,7)=cm; %distanza di frechet
        PDPS(z,8)=pazienti(k); %indice paziente
        z=z+1;
    end
end
combo=size(PDPS,1);
POSTDXvsPOSTSX(1:combo,:,k)=PDPS;
   end
   
   postDXVSpostSX=cat(1,POSTDXvsPOSTSX(:,:,1),POSTDXvsPOSTSX(:,:,2),POSTDXvsPOSTSX(:,:,3),POSTDXvsPOSTSX(:,:,4),POSTDXvsPOSTSX(:,:,5),POSTDXvsPOSTSX(:,:,6),POSTDXvsPOSTSX(:,:,7),POSTDXvsPOSTSX(:,:,8),POSTDXvsPOSTSX(:,:,9),POSTDXvsPOSTSX(:,:,10));
   
   A=postDXVSpostSX(:,1);
   nulle=find(~A);
   postDXVSpostSX(nulle,:)=[];
   
   save('postDXVSpostSX.mat','postDXVSpostSX');
