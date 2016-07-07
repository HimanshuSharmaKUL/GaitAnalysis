%KNN Classification code to authenticate a person
clear
clc
[fname_tr, pname_tr]= uigetfile({'*.png;*.jpeg;*.jpg','Image Files(*.png,*.jpeg,*.jpg)'},'Select a file','F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\train\', 'MultiSelect', 'on');
l_tr=length(fname_tr);
%fullfilename1=fullfile(pname_tr,fname_tr(1));
%BW1=imread(fullfilename1);
%[m n ch1]=size(BW1);
%train_set(1,:)=reshape(BW1,1,m*n);
for i=1:l_tr
    
    fullfilename=fullfile(pname_tr,fname_tr{i});%REMEMBER: to access cell elements use {}
    BW1=im2double(imread(fullfilename));
    [x_tr y_tr ch_tr]=size(BW1);  %pixels=x*y, ch= color channels
    train_set(i,:)=reshape(BW1,1,x_tr*y_tr);
    %G{i}={'fname_tr{%d}',i};
end
ch=1;
while ch==1
clear fname_te a l_te;
[fname_te, pname_te]= uigetfile({'*.png;*.jpeg;*.jpg','Image Files(*.png,*.jpeg,*.jpg)'},'Select a file','F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\test\', 'MultiSelect', 'on');
a=cellstr(fname_te);
l_te=length(a);
for j=1:l_te
    
    fullfilename=fullfile(pname_te,a{j});%REMEMBER: to access cell elements use {}
    BW=im2double(imread(fullfilename));
    [x_te y_te ch]=size(BW);  %pixels=x*y, ch= color channels
    test_set(j,:)=reshape(BW,1,x_te*y_te);
end
G=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]';

[class D]= knnclassification(test_set, train_set, G, 1);

for k=1:length(class)
type = class(k);
switch type
    case 1
        fprintf('fyc\n');
    case 2
        fprintf('hy\n');
    case 3
        fprintf('lig\n');
    case 4
        fprintf('lqf\n');
    case 5
        fprintf('lsl\n');
    case 6
        fprintf('ml\n');
    case 7
        fprintf('nhz\n');
    case 8
        fprintf('rj\n');
    case 9
        fprintf('syj\n');
    case 10
        fprintf('wl\n');
    case 11
        fprintf('wq\n');
    case 12
        fprintf('wyc\n');
    case 13
        fprintf('xch\n');
    case 14
        fprintf('xxj\n');
    case 15
        fprintf('yjf\n');
    case 16
        fprintf('zc\n');
    case 17
        fprintf('zdx\n');
    case 18
        fprintf('zjg\n');
    case 19
        fprintf('zl\n');
    case 20
        fprintf('zyf\n');
end
end
ch=input('Do you want to continue? 0(N), 1(Y)');
end