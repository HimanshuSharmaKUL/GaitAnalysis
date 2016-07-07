%25/May/2016 
%Matlab code for size normalization and horizontal alighnment for 
%Gait Analysis
%Constants need to be changed for every subject
clear
for i=1:66 %cir
    M=0;
    if(i<10)
        pngFilename=sprintf('zyf-00_3-00%d.png',i); %change if req (cir)
    else
        pngFilename=sprintf('zyf-00_3-0%d.png',i); %cir
    end
    fullFilename=fullfile('F:','New folder (3)','New Folder (2)','silhouettes','zyf','00_3', pngFilename); %cir
    BW = imread(fullFilename);
    s = regionprops(BW, 'Centroid');
    centroids=cat(1,s.Centroid);
    C=centroids(255,:); %C(1) is X and C(2) is Y
%    imshow(BW);
%    hold on
%   plot(centroids(:,1),centroids(:,2),'b*');
%    hold off
    if((352-C(1))<50) %cir
        M=floor(2*(352-C(1)));
        for k=1:M
            for j=1:240
                B(j, k, :)=BW(j, floor((2*C(1)-352))+k, :);
            end
        end
    elseif((352-C(1)>50) && (C(1)-1)>50)
        M=100;
        for k=1:M
            for j=1:240
                B(j, k, :)=BW(j, floor(C(1)-50)+k, :);
            end
        end
    elseif(50>(C(1)-1)&& (C(1)-1)>26) %cir
        M=floor(C(1)-1+50);
        for k=1:M
            for j=1:240
                B(j, k, :)=BW(j, 1+k, :);
            end
        end
    end
    fullFilename2=fullfile('F:', 'New folder (3)', 'New Folder (2)','silhouettes_matlab','zyf', '00_3', pngFilename); %cir
    imwrite(B, fullFilename2);
end
