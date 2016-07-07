%Date- 24/06/2016
%Gait Size(frame size) normalization for (degree) (Atleast)
%Normalsation for All folders (try)
clear
for e=92:124
    if(e<10)
        foldername=sprintf('00%d',e);
    elseif(e>=10 && e<100)
        foldername=sprintf('0%d',e);
    else
        foldername=sprintf('%d',e);
    end
    initialFname=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes\',foldername, '\', 'nm-02\090\');
    initialFname2=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\',foldername, '\', 'nm-02\090\');
    D=dir([initialFname, '\*.png']);
    if isempty(D)
        continue;   %to escape from some folders which does not exists
    end
    Num=length(D(not([D.isdir])));
    i_start=str2num(D(1).name(end-6:end-4));
    mkdir(initialFname2);
for i=i_start:(i_start+Num-1) %cir
    B=0;
    if(i<10)
        pngFilename=sprintf('nm-02-090-00%d.png',i); %change if req (cir)
    elseif(i>=10 && i<100)
        pngFilename=sprintf('nm-02-090-0%d.png',i);
    else
        pngFilename=sprintf('nm-02-090-%d.png',i);
    end
    fullpath=strcat(initialFname, foldername, '-', pngFilename);
    %fullFilename=fullfile('F:','GaitDatasetB','DatasetB','silhouettes',partialpath); %cir
    if exist(fullpath, 'file')
    else
        continue;
    end
    BW = imread(fullpath);
    s = regionprops(BW, 'Centroid');
    centroids=cat(1,s.Centroid);
    C=centroids(255,:); %C(1) is X and C(2) is Y
    M_start=floor(C(1)-120);
    M_end=floor(C(1)+120);
    N_start=floor(C(2)-120);
    N_end=floor(C(2)+120);
    
    if(N_start<0) %top
        N_start_b=abs(N_start);
        Bt=zeros(N_start_b, 240);
    else
        N_start_b=0;
    end
    if N_end>240 %bottom
        N_end_b=N_end-240;
        Bb=zeros(N_end_b, 240);
    else
        N_end_b=0;
    end
    if M_end>320 %right side
        M_end_b=abs(320-M_end);
        Br=zeros(240+N_start_b+N_end_b, M_end_b);
    end
    if M_start<0 %left side
        M_start_b=abs(M_start);
        Bl=zeros(240+N_start_b+N_end_b, M_start_b);
    end
    
    k1=0;j1=0;k2=0;
    for k=M_start+1:M_end %+1 so that exact 240 iterations are there
        if k==0
            continue;
        end
        k1=k1+1;
        j1=0; j2=0; j3=0; 
        if k<0
            for ja=1:(240+N_start_b+N_end_b)
                B(ja, k1, :)=Bl(ja, k1, :);
            end
        elseif k>=0 && k<=320
            for j=N_start:N_end
                j1=j1+1;
                if j<0
                    j3=j3+1;
                    B(j1, k1, :)=Bt(j3, k1, :);
                elseif j>0 && j<=240
                    
                    B(j1, k1, :)=BW(j, k, :);
                elseif j>240
                    j2=j2+1;
                    B(j1, k1, :)=Bb(j2, k1, :);
                end
            end
        elseif k>320
            k2=k2+1;
            for jb=1:(240+N_start_b+N_end_b)
                
                B(jb, k1, :)=Br(jb, k2, :);
            end
        end
    end
    [x1 y1]=size(B);

    if x1>240 || y1>240
        alpha=x1-240; beta=y1-240;
        for u=alpha:-1:1
            B(240+u, :)=[];
        end
        for v=beta:-1:1
            B(:, 240+v)=[];
        end
        if beta<0
            beta=abs(beta);
            for v=1:beta
            B(:, y1+beta)=0;
            end
        end
    end
    fullFilename2=fullfile(initialFname2, pngFilename); %cir
    imwrite(B, fullFilename2);
end
end