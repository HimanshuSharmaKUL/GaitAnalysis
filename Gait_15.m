%KNN Classification code to authenticate a person (FOR EF)
%For DatasetB all folders at once (try)
%Cycle-1 (Cycle means how many times prob set is chosen), Probe set-124
clear
clc
count=0;
for e=1:124
    count=count+1;
    initialFname_tr=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\','EF_train\');
    
       pngFilename_tr=sprintf('nm-01-ef-%d.png', e);
       if exist(strcat(initialFname_tr, pngFilename_tr), 'file')
       fname_tr{e}=pngFilename_tr;
       else 
           continue;
       end
       fullfilename_tr=fullfile(initialFname_tr, pngFilename_tr);%REMEMBER: to access cell elements use {}
    BW1=im2double(imread(fullfilename_tr));
    [x_tr y_tr ch_tr]=size(BW1);  %pixels=x*y, ch= color channels
    train_set(count,:)=reshape(BW1,1,x_tr*y_tr);
    G(e)=e; %G are the lables of train set
end
count2=0;
for f=1:124
    count2=count2+1;
    initialFname_te=strcat('F:\','GaitDatasetB\','DatasetB\','silhouettes_matlab\','EF_test\');
    pngFilename_te=sprintf('nm-02-ef-%d.png',f); %change if req (cir)
       if exist(strcat(initialFname_te, pngFilename_te), 'file')
       fname_te{f}=pngFilename_te;
       else
           continue;
       end
    fullfilename_te=fullfile(initialFname_te,pngFilename_te);%REMEMBER: to access cell elements use {}
    BW=im2double(imread(fullfilename_te));
    [x_te y_te ch]=size(BW);  %pixels=x*y, ch= color channels
    test_set(count2,:)=reshape(BW,1,x_te*y_te);
end
G=G'; %G are the lables of train set
[class Dist m indices rank]= knnclassification(test_set, train_set, G, 1);
max_rank=max(rank);
h3=zeros(1,max_rank); h2=0;
for g=1:max_rank
    %h(g)=;
    h2=h2+numel(find(rank==g));
    h3(g)=h2;
    IDFR(g)=(h3(g)/124)*100;
end
h=1:max_rank;
figure(3);
hold on
plot(h, IDFR, '--*r');
xlabel('Rank');
ylabel('Identification Rate');
legend('GII-EF', 'EF');