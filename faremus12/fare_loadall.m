load ('tabella.mat');
N=19;
C=450000;
Cmax=C-2;
M=zeros(N*24,6);
M(:,:)=-9999;
D_data=zeros(N*24,C);
j=1;
k=1;
for i=1:N
    if i~=11
    sig=T{i,2};
    fare=T{i,3};
    pathname1=sprintf('./FaReMuS%d/%s/%s_MEP/%s_POST/',fare,sig,sig,sig);
     if isfile(strcat(pathname1,'MEP_DX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_DX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=1;%PRE-POST(POST)
        M(j,3)=0;%DX-SX(DX)
        M(j,4)=0;%MEP-SHAM(MEP)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
     end
     pathname1=sprintf('./FaReMuS%d/%s/%s_MEP/%s_POST/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_SX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_SX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=1;%PRE-POST(POST)
        M(j,3)=1;%DX-SX(SX)
        M(j,4)=0;%MEP-SHAM(MEP)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
    pathname1=sprintf('./FaReMuS%d/%s/%s_MEP/%s_PRE/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_DX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_DX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=0;%PRE-POST(PRE)
        M(j,3)=0;%DX-SX(DX)
        M(j,4)=0;%MEP-SHAM(MEP)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
    pathname1=sprintf('./FaReMuS%d/%s/%s_MEP/%s_PRE/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_SX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_SX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=0;%PRE-POST(PRE)
        M(j,3)=1;%DX-SX(SX)
        M(j,4)=0;%MEP-SHAM(MEP)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
    pathname1=sprintf('./FaReMuS%d/%s/%s_SHAM/%s_POST/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_DX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_DX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=1;%PRE-POST(POST)
        M(j,3)=0;%DX-SX(DX)
        M(j,4)=1;%MEP-SHAM(SHAM)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
     pathname1=sprintf('./FaReMuS%d/%s/%s_SHAM/%s_POST/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_SX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_SX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=1;%PRE-POST(POST)
        M(j,3)=1;%DX-SX(SX)
        M(j,4)=1;%MEP-SHAM(SHAM)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
    pathname1=sprintf('./FaReMuS%d/%s/%s_SHAM/%s_PRE/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_DX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_DX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=0;%PRE-POST(PRE)
        M(j,3)=0;%DX-SX(DX)
        M(j,4)=1;%MEP-SHAM(SHAM)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
    pathname1=sprintf('./FaReMuS%d/%s/%s_SHAM/%s_PRE/',fare,sig,sig,sig);
    if isfile(strcat(pathname1,'MEP_SX.vhdr'))
        a=pop_loadbv(pathname1,'MEP_SX.vhdr');
        M(j,1)=i;%ID paziente
        M(j,2)=0;%PRE-POST(PRE)
        M(j,3)=1;%DX-SX(SX)
        M(j,4)=1;%MEP-SHAM(MEP)
        M(j,5)=size(a.data,1);%NR registrazioni
        M(j,6)=j;%ID registrazione
        for h=1:M(j,5)
            D_data(k,1)=j;
            x=a.data(1,:);
            lx=length(x);
            if lx>Cmax
                lx=Cmax;
            end
            D_data(k,2)=lx;
            D_data(k,3:lx+2)=x(1:lx);
            k=k+1;
        end
        j=j+1;
    end
    end
end
save('M.mat','M');
save('D_data.mat','D_data');