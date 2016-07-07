  %fullFilename2=fullfile('F:', 'GaitDatasetB', 'DatasetB','silhouettes','001', '001','bh-01', '000','001-bg-01-000-089.png'  ); %cir
   % ?F:\GaitDatasetB\DatasetB\silhouettes\001\001\bg-01\000\001-bg-01-000-089.png
BW = imread(?F:\GaitDatasetB\DatasetB\silhouettes\001\001\bg-01\000\001-bg-01-000-089.png);
    s = regionprops(BW, 'Centroid');
    centroids=cat(1,s.Centroid);
    C=centroids(255,:); %C(1) is X and C(2) is Y
    imshow(BW);
    hold on
    plot(centroids(:,1),centroids(:,2),'b*');
    hold off