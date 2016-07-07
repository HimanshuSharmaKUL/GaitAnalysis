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
    initialFname=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes\',foldername, '\', 'nm-02\018\');
    initialFname2=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\',foldername, '\', 'nm-02\018\');
    D=dir([initialFname, '\*.png']);
    if isempty(D)
        continue;   %to escape from some folders which does not exists
    end
    Num=length(D(not([D.isdir])));
    i_start=str2num(D(1).name(end-6:end-4));
    mkdir(initialFname2);
    count=0;
    for i=i_start:(i_start+Num-1) %cir
        if i>1
        clear BW BW2 BW3 Blank;
        end
        BW=0;
        count=count+1;
        if(i<10)
            pngFilename=sprintf('001-nm-02-018-00%d.png',i); %change if req (cir)
        elseif(i>=10 && i<100)
            pngFilename=sprintf('001-nm-02-018-0%d.png',i);
        else
            pngFilename=sprintf('001-nm-02-018-%d.png',i);
        end
        fullFilename=strcat(initialFname, pngFilename);
        %fullFilename=fullfile('F:','New folder (3)','New Folder (2)','silhouettes_matlab','fyc','00_1', pngFilename);
        if exist(fullFilename, 'file')
        else
            continue;
        end
        %%%%%%%%%%%%%%%%%%%%
        if count==1
            v=(i_start+Num-1);
            if(v<10)
                pngFilename_v=sprintf('001-nm-02-018-00%d.png',v); %change if req (cir)
            elseif(v>=10 && v<100)
                pngFilename_v=sprintf('001-nm-02-018-0%d.png',v);
            else
                pngFilename_v=sprintf('001-nm-02-018-%d.png',v);
            end
            fullFilename_v=strcat(initialFname, pngFilename_v);
            IM=imread(fullFilename_v);
            s_im=regionprops(IM, 'All');
            bb_im=s_im(255).BoundingBox;
        end
        
        BW=imread(fullFilename);
        s=regionprops(BW, 'All');
        bb=ceil(s(255).BoundingBox);
        for g=1:bb(3)
            for h=1:bb(4)
                BW2(h,g)=BW(bb(2)+h, bb(1)+g);
            end
        end
        scale=(bb_im(4)/bb(4));
        ht=ceil(bb(4)*scale);
        wd=ceil(bb(3)*scale);
        BW3=imresize(BW2, [ht, wd], 'bicubic');
        Blank=zeros(240,240);
        s_bw3=regionprops(BW3, 'All');
        bb_bw3=s_bw3(255).BoundingBox;
        horiz=ceil(120-(bb_bw3(3)/2));
        verti=ceil(120-(bb_bw3(4)/2));
        for u=1:bb_bw3(3) %x;across
            for w=1:bb_bw3(4) %y;vertical
                Blank(verti+w,horiz+u)=BW3(w,u);
            end
        end
              finalFilename=sprintf('001-nm-02-018-%d.png', i);
      fullFilename2=fullfile(initialFname2, finalFilename);
      imwrite(Blank, fullFilename2);  
    end
     
     %%%%%%%%%%%%%%%%
%     imshow(BW);
      
end