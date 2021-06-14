pazienti=[1 2 4 6 8 12 15 17 18 19];
PRE_m_sx=zeros(1,8,10);%MANO SINISTRA pre-pre
  for k=1:size(pazienti,2)
v00=zeros(1,1); %vettore per le posizioni degli spike della condizione 00
z=1;
for g=1:size(SX,1)
    if SX(g,2,k)==0 && SX(g,3,k)==0 %condizione post-stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v00(z,1)=g;
       z=z+1;
    end
end
z=1;
m_sx_pre=zeros(1,8);
for i=1:size(v00,1)
    for j=1:size(v00,1)
        if j>i
        m_sx_pre(z,1)=i; %indice dello spike di partenza
        m_sx_pre(z,2)=0; %pre
        m_sx_pre(z,3)=0; %stimolaz dx
        m_sx_pre(z,4)=j; %indice dello spike arrivo
        m_sx_pre(z,5)=0; %pre
        m_sx_pre(z,6)=0; %stimolaz dx
        [cm,cSq]=DiscreteFrechetDist(SX(v00(i,1),5:end,k),SX(v00(j,1),5:end,k));
        m_sx_pre(z,7)=cm; %distanza di frechet
        m_sx_pre(z,8)=pazienti(k); %indice paziente
        z=z+1;
        end
    end
end
combo=size(m_sx_pre,1);
PRE_m_sx(1:combo,:,k)=m_sx_pre;
  end
 preVSpre_SX=cat(1,PRE_m_sx(:,:,1),PRE_m_sx(:,:,2),PRE_m_sx(:,:,3),PRE_m_sx(:,:,4),PRE_m_sx(:,:,5),PRE_m_sx(:,:,6),PRE_m_sx(:,:,7),PRE_m_sx(:,:,8),PRE_m_sx(:,:,9),PRE_m_sx(:,:,10));
  A=preVSpre_SX(:,1);
   nulle=find(~A);
   preVSpre_SX(nulle,:)=[];
   
    save('preVSpre_SX.mat','preVSpre_SX');
