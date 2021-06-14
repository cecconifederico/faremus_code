pazienti=[1 2 4 6 8 12 15 17 18 19];
POST_m_sx=zeros(1,8,10);%MANO SINISTRA post-post
  for k=1:size(pazienti,2)
v10=zeros(1,1); %vettore per le posizioni degli spike della condizione 10
z=1;
for g=1:size(SX,1)
    if SX(g,2,k)==1 && SX(g,3,k)==0 %condizione post-stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v10(z,1)=g;
       z=z+1;
    end
end
z=1;
m_sx_post=zeros(1,8);
for i=1:size(v10,1)
    for j=1:size(v10,1)
        if j>i
        m_sx_post(z,1)=i; %indice dello spike di partenza
        m_sx_post(z,2)=1; %post
        m_sx_post(z,3)=0; %dx
        m_sx_post(z,4)=j; %indice dello spike arrivo
        m_sx_post(z,5)=1; %post
        m_sx_post(z,6)=0; %dx
        [cm,cSq]=DiscreteFrechetDist(SX(v10(i,1),5:end,k),SX(v10(j,1),5:end,k));
        m_sx_post(z,7)=cm; %distanza di frechet
        m_sx_post(z,8)=pazienti(k); %indice paziente
        z=z+1;
        end
    end
end
combo=size(m_sx_post,1);
POST_m_sx(1:combo,:,k)=m_sx_post;
  end
 postVSpost_SX=cat(1,POST_m_sx(:,:,1),POST_m_sx(:,:,2),POST_m_sx(:,:,3),POST_m_sx(:,:,4),POST_m_sx(:,:,5),POST_m_sx(:,:,6),POST_m_sx(:,:,7),POST_m_sx(:,:,8),POST_m_sx(:,:,9),POST_m_sx(:,:,10));
  A=postVSpost_SX(:,1);
   nulle=find(~A);
   postVSpost_SX(nulle,:)=[];
   
    save('postVSpost_SX.mat','postVSpost_SX');
