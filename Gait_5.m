%25/May/2016 
%Matlab code for size normalization and horizontal alighnment for 
%Gait Analysis
%Constants need to be changed for every subject
clear
for i=1:75 %cir
    M=0;
    B=0;
    if(i<10)
        pngFilename=sprintf('fyc-00_1-00%d.png',i); %change if req (cir)
    else
        pngFilename=sprintf('fyc-00_1-0%d.png',i); %cir
    end
    fullFilename=fullfile('F:','New folder (3)','New Folder (2)','silhouettes','fyc','00_1', pngFilename); %cir
    BW = imread(fullFilename);
   % s = regionprops(BW, 'Centroid');
   % centroids=cat(1,s.Centroid);
   % C=centroids(255,:); %C(1) is X and C(2) is Y
   [Ilable num]=bwlabel(BW); 
   Iprops=regionprops(Ilable);
    box=[Iprops.BoundingBox];
    box=reshape(box,[4,num]);
    C=[Iprops.Centroid];
    C=reshape(C,[2,num]);
%    imshow(BW);
%    hold on
%   plot(centroids(:,1),centroids(:,2),'b*');
%    hold off
    p=find_remainder(box(3,1), 100);
    q=find_remainder(box(4,1), 240);
    M=floor(box(3,1)+p);
    N=floor(box(4,1)+q);
    for k=1:M
        for j=1:N
            if (floor(C(2,1)-(box(4,1)/2+(q/2)))+j)>240 || (floor(box(1,1))+k)>352
                break;
            else
               % B(j, k, :)= BW(floor(box(2,1))+j, floor(box(1,1))+k, :);
                B(j, k, :)=BW(floor(C(2,1)-(box(4,1)/2+(q/2)))+j, floor(C(1,1)-(box(3,1)/2+(p/2)))+k, :);
            end
        end
    end
    [y,x]=size(B); %142x52 :: 240x100
    B=imresize(B, [NaN 100]);
    
    imshow(B);
    %if((352-C(1))<50) %cir
    %    M=floor(2*(352-C(1)));
    %    for k=1:M
    %        for j=1:240
    %            B(j, k, :)=BW(j, floor((2*C(1)-352))+k, :);
    %        end
     %   end
   % elseif((352-C(1)>50) && (C(1)-1)>50)
   %     M=100;
   %     for k=1:M
   %         for j=1:240
   %             B(j, k, :)=BW(j, floor(C(1)-50)+k, :);
   %         end
   %     end
   % elseif(50>(C(1)-1)&& (C(1)-1)>26) %cir
   %     M=floor(C(1)-1+50);
   %     for k=1:M
   %         for j=1:240
   %             B(j, k, :)=BW(j, 1+k, :);
   %         end
   %     end
   % end
    fullFilename2=fullfile('F:', 'New folder (3)', 'New Folder (2)','silhouettes_matlab','fyc', '00_x', pngFilename); %cir
    imwrite(B, fullFilename2);
end
