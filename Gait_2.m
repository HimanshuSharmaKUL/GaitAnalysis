%25/05/2016
%Matlab code for Energy Feature Extraction
clear
%?F:\GaitDatasetB\DatasetB\silhouettes_matlab\001\bg-01\018\001-bg-01-018-0
%01.png
fullFilename1=fullfile('F:','GaitDatasetB','DatasetB','silhouettes_matlab','001','bg-01','018', '001-bg-01-018-001.png');
BW = im2double(imread(fullFilename1));
for i=81:91
    if(i<10)
        pngFilename=sprintf('001-bg-01-018-00%d.png',i);
    else
        pngFilename=sprintf('001-bg-01-018-0%d.png',i);
    end
    fullFilename=fullfile('F:','GaitDatasetB','DatasetB','silhouettes_matlab','001','bg-01','018', pngFilename);
    B= im2double(imread(fullFilename));
    BW = imadd(BW, B);
   % s = regionprops(BW, 'Centroid');
   % centroids=cat(1,s.Centroid);
   % C=centroids(255,:); %C(1) is X and C(2) is Y  
end
%imshow(BW);
BW=BW/10; %constant depends on the no of images used
imshow(BW);
fullFilename2=fullfile('F:','GaitDatasetB','DatasetB','silhouettes_matlab','001','bg-01','018', 'gei-001-bg-01-018_1.png');
imwrite(BW, fullFilename2);