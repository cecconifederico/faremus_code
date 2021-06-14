pazienti=[1 2 4 6 8 12 15 17 18 19];
POST_m_dx=zeros(1,8,10);%MANO DESTRA post-post
  for k=1:size(pazienti,2)
v11=zeros(1,1); %vettore per le posizioni degli spike della condizione 11
z=1;
for g=1:size(DX,1)
    if DX(g,2,k)==1 && DX(g,3,k)==1 %condizione post-stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v11(z,1)=g;
       z=z+1;
    end
end
z=1;
m_dx_post=zeros(1,8);
for i=1:size(v11,1)
    for j=1:size(v11,1)
        if j>i
        m_dx_post(z,1)=i; %indice dello spike di partenza
        m_dx_post(z,2)=1; %post
        m_dx_post(z,3)=1; %stimolaz sx
        m_dx_post(z,4)=j; %indice dello spike arrivo
        m_dx_post(z,5)=1; %post
        m_dx_post(z,6)=1; %stimolaz sx
        [cm,cSq]=DiscreteFrechetDist(DX(v11(i,1),5:end,k),DX(v11(j,1),5:end,k));
        m_dx_post(z,7)=cm; %distanza di frechet
        m_dx_post(z,8)=pazienti(k); %indice paziente
        z=z+1;
        end
    end
end
combo=size(m_dx_post,1);
POST_m_dx(1:combo,:,k)=m_dx_post;
  end
 postVSpost_DX=cat(1,POST_m_dx(:,:,1),POST_m_dx(:,:,2),POST_m_dx(:,:,3),POST_m_dx(:,:,4),POST_m_dx(:,:,5),POST_m_dx(:,:,6),POST_m_dx(:,:,7),POST_m_dx(:,:,8),POST_m_dx(:,:,9),POST_m_dx(:,:,10));
  A=postVSpost_DX(:,1);
   nulle=find(~A);
   postVSpost_DX(nulle,:)=[];

    save('postVSpost_DX.mat','postVSpost_DX');