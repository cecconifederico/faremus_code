pazienti=[1 2 4 6 8 12 15 17 18 19];
PRE_m_dx=zeros(1,8,10);%MANO DESTRA pre-pre
  for k=1:size(pazienti,2)
v01=zeros(1,1); %vettore per le posizioni degli spike della condizione 11
z=1;
for g=1:size(DX,1)
    if DX(g,2,k)==0 && DX(g,3,k)==1 %condizione pre-stimolazione a sx (sto prendendo i segnali destri, quindi vedo qualcosa solo se stimolo a sx)
       v01(z,1)=g;
       z=z+1;
    end
end
z=1;
m_dx_pre=zeros(1,8);
for i=1:size(v01,1)
    for j=1:size(v01,1)
        if j>i
        m_dx_pre(z,1)=i; %indice dello spike di partenza
        m_dx_pre(z,2)=0; %pre
        m_dx_pre(z,3)=1; %stimolaz sx
        m_dx_pre(z,4)=j; %indice dello spike arrivo
        m_dx_pre(z,5)=0; %pre
        m_dx_pre(z,6)=1; %stimolaz sx
        [cm,cSq]=DiscreteFrechetDist(DX(v01(i,1),5:end,k),DX(v01(j,1),5:end,k));
        m_dx_pre(z,7)=cm; %distanza di frechet
        m_dx_pre(z,8)=pazienti(k); %indice paziente
        z=z+1;
        end
    end
end
combo=size(m_dx_pre,1);
PRE_m_dx(1:combo,:,k)=m_dx_pre;
  end
 preVSpre_DX=cat(1,PRE_m_dx(:,:,1),PRE_m_dx(:,:,2),PRE_m_dx(:,:,3),PRE_m_dx(:,:,4),PRE_m_dx(:,:,5),PRE_m_dx(:,:,6),PRE_m_dx(:,:,7),PRE_m_dx(:,:,8),PRE_m_dx(:,:,9),PRE_m_dx(:,:,10));
  A=preVSpre_DX(:,1);
   nulle=find(~A);
   preVSpre_DX(nulle,:)=[];
   
    save('preVSpre_DX.mat','preVSpre_DX');