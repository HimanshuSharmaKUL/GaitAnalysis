%Code to move files from one pos to another (can't be used anymore as it is)
%For DatasetB all folders at once (try)
clear
clc
count=0;
for e=1:124
    count=count+1;
    if(e<10)
        foldername=sprintf('00%d',e);
    elseif(e>=10 && e<100)
        foldername=sprintf('0%d',e);
    else
        foldername=sprintf('%d',e);
    end
    initialFname=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\',foldername, '\', 'nm-02\090\');
    initialFname2=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\','GII-EF_test\');
    D=dir([initialFname, '\*.png']);
    if isempty(D)
        continue;   %to escape from some folders which does not exists
    end
    %Num=length(D(not([D.isdir])));
    %i_start=str2num(D(1).name(end-6:end-4));
    mkdir(initialFname2);
    
    %for i=i_start:(i_start+Num-1) %cir
        
       % if(i<10)
            pngFilename=sprintf('gii-ef-%d.png',e); %change if req (cir)
      a=strcat(initialFname, pngFilename); %b=strcat(initialFname2, pngFilename);
            movefile(a, initialFname2);
end
            %fname_tr{e}=pngFilename;
            % elseif(i>=10 && i<100)
       %     pngFilename=sprintf('nm-02-090-0%d.png',i);
       % else
       %     pngFilename=sprintf('nm-02-090-%d.png',i);
       % end
%         fullFilename{e}=strcat(initialFname, pngFilename);
% end
% 
% %pname_tr='F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\train\';
% l_tr=length(fname_tr);
% %fullfilename1=fullfile(pname_tr,fname_tr(1));
% %BW1=imread(fullfilename1);
% %[m n ch1]=size(BW1);
% %train_set(1,:)=reshape(BW1,1,m*n);
% for i=1:l_tr
%     
%     fullfilename=fullfile(initialFname, pngFilename);%REMEMBER: to access cell elements use {}
%  %   fullfilename=cellstr(fullFilename{i});
%     BW1=im2double(imread(fullfilename));
%     [x_tr y_tr ch_tr]=size(BW1);  %pixels=x*y, ch= color channels
%     train_set(count,:)=reshape(BW1,1,x_tr*y_tr);
%     %G{i}={'fname_tr{%d}',i};
% 
% %ch=1;
% chr_max=100;
% for chr=1:chr_max
% clear fname_te a l_te;
% 
% 
% random_n=randi(20);
% final_test(chr)=random_n;
% a=cellstr(fname_tr{random_n});
% b=cellstr(initialFname2{random_n});
% l_te=length(a);
% %pname_te='F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\test\';
% 
% for j=1:l_te
%     
%     fullfilename=fullfile(b{j},a{j});%REMEMBER: to access cell elements use {}
%     BW=im2double(imread(fullfilename));
%     [x_te y_te ch]=size(BW);  %pixels=x*y, ch= color channels
%     test_set(j,:)=reshape(BW,1,x_te*y_te);
% end
% G=[1:124]';
% 
% [class Dist m]= knnclassification(test_set, train_set, G, 1);
% final_test_compare(chr)=class;
% end
% count2=0;aux=0;
% for alpha=1:chr_max
%     if final_test_compare(alpha)~=final_test(alpha)
%         count2=count2+1;
%         aux(count2)=alpha;
%         aux_2(count2)=final_test(alpha);
%         
%     end
% end
% lessthenR1=100-count2;