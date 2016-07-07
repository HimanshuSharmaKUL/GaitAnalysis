%Date- 26-06-2016 12:32 AM!
%Energy Features (EF)
%For all folders at once!
%Gait Information Image- Energy Feature
clear
for e=1:1
    if(e<10)
        foldername=sprintf('00%d',e);
    elseif(e>=10 && e<100)
        foldername=sprintf('0%d',e);
    else
        foldername=sprintf('%d',e);
    end
    initialFname=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\',foldername, '\', 'nm-02\018\');
    initialFname2=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\','EF_test\', 'nm-02\018\');
    D=dir([initialFname, '\*.png']);
    if isempty(D)
        continue;   %to escape from some folders which does not exists
    end
    Num=length(D(not([D.isdir])));
    i_start=str2num(D(1).name(end-6:end-4));
    mkdir(initialFname2);
    count=0;
    for i=i_start:(i_start+Num-1) %cir
        B=0;
        count=count+1;
%         if(i<10)
%             pngFilename=sprintf('001-nm-02-018-00%d.png',i); %change if req (cir)
%         elseif(i>=10 && i<100)
%             pngFilename=sprintf('001-nm-02-018-0%d.png',i);
%         else
            pngFilename=sprintf('001-nm-02-018-%d.png',i);
      %  end
        fullFilename=strcat(initialFname, pngFilename);
        %fullFilename=fullfile('F:','New folder (3)','New Folder (2)','silhouettes_matlab','fyc','00_1', pngFilename);
        if exist(fullFilename, 'file')
        else
            continue;
        end
        if count==1
            BW=im2double(imread(fullFilename));
        end
        B=im2double(imread(fullFilename));
        BW=imadd(BW, B);
    end
     BW=BW/Num;
%     imshow(BW);
      finalFilename=sprintf('001-nm-02-018-ef-%d.png', e);
      fullFilename2=fullfile(initialFname2, finalFilename);
      imwrite(BW, fullFilename2);
end