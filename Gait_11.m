%Date- 25-06-2016 1:11 AM!
%Gait Information Image - Energy Features (GII-EF)
%For all folders at once!
%Gait Information Image- Energy Feature
clear
for e=123:124
    if(e<10)
        foldername=sprintf('00%d',e);
    elseif(e>=10 && e<100)
        foldername=sprintf('0%d',e);
    else
        foldername=sprintf('%d',e);
    end
    initialFname=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\',foldername, '\', 'nm-01\090\');
    initialFname2=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\', 'GII-EF_train\');
    D=dir([initialFname, '\*.png']);
    if isempty(D)
        continue;   %to escape from some folders which does not exists
    end
    Num=length(D(not([D.isdir])));
    i_start=str2num(D(1).name(end-6:end-4));
    %mkdir(initialFname2);
    count=0;
    for i=i_start:(i_start+Num-1) %cir
        B=0;
        count=count+1;
        if(i<10)
            pngFilename=sprintf('nm-01-090-00%d.png',i); %change if req (cir)
        elseif(i>=10 && i<100)
            pngFilename=sprintf('nm-01-090-0%d.png',i);
        else
            pngFilename=sprintf('nm-01-090-%d.png',i);
        end
        fullFilename=strcat(initialFname, pngFilename);
        %fullFilename=fullfile('F:','New folder (3)','New Folder (2)','silhouettes_matlab','fyc','00_1', pngFilename);
        if exist(fullFilename, 'file')
        else
            continue;
        end
        B= im2double(imread(fullFilename));
        [M, N]=size(B); %M=x, N=y
        
        for j=1:M
            for k=1:N
                I{j,k}(count)=B(j, k);
            end
        end
    end
    %M=240; N=100;
    for l=1:M
        for m=1:N
            x(l,m)=sum(I{l,m});
            variance(l,m)=var(I{l,m});
            f(l,m)=sqrt(variance(l,m));
            for n=1:Num
                mu{l,m}(n)=exp(-(((I{l,m}(n)/Num)-1)/(sqrt(2)*f(l,m)))^2); %change the power from 2 to 4 is required so (requirement will arise when mu^2 is to be used
                I_value{l,m}(n)=I{l,m}(n)*mu{l,m}(n);
            end
        end
    end
    X=x/Num;
    for o=1:M
        for p=1:N
            BW(o,p)=sum(I_value{o,p});
        end
    end
 %   imshow(BW);
     BW=BW/Num;
     finalFilename=sprintf('nm-01-90-gii-ef-%d.png', e);
     fullFilename2=fullfile(initialFname2, finalFilename);
     imwrite(BW, fullFilename2);
end