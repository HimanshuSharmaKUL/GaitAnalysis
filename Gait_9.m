%KNN Classification code to authenticate a person
clear
clc
%"gei-fyc-00_1.png" "gei-hy-00_1.png" "gei-ljg-00_1.png" "gei-lqf-00_1.png" "gei-lsl-00_1.png" "gei-ml-00_1.png" "gei-nhz-00_2.png" "gei-rj-00_1.png" "gei-syj-00_1.png" "gei-wl-00_1.png" "gei-wq-00_1.png" "gei-wyc-00_1.png" "gei-xch-00_1.png" "gei-xxj-00_1.png" "gei-yjf-00_2.png" "gei-zc-00_1.png" "gei-zdx-00_1.png" "gei-zjg-00_1.png" "gei-zl-00_1.png" "gei-zyf-00_1.png" 
%[fname_tr, pname_tr]= uigetfile({'*.png;*.jpeg;*.jpg','Image Files(*.png,*.jpeg,*.jpg)'},'Select a file','F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\train\', 'MultiSelect', 'on');
fname_tr={'gei-fyc-00_1.png' 'gei-hy-00_1.png' 'gei-ljg-00_1.png' 'gei-lqf-00_1.png' 'gei-lsl-00_1.png' 'gei-ml-00_1.png' 'gei-nhz-00_2.png' 'gei-rj-00_1.png' 'gei-syj-00_1.png' 'gei-wl-00_1.png' 'gei-wq-00_1.png' 'gei-wyc-00_1.png' 'gei-xch-00_1.png' 'gei-xxj-00_1.png' 'gei-yjf-00_2.png' 'gei-zc-00_1.png' 'gei-zdx-00_1.png' 'gei-zjg-00_1.png' 'gei-zl-00_1.png' 'gei-zyf-00_1.png'};
pname_tr='F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\train\';
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
%ch=1;
chr_max=1;
for chr=1:chr_max
clear fname_te a l_te;
Z={'gei-fyc-00_3.png' 'gei-hy-00_3.png' 'gei-ljg-00_3.png' 'gei-lqf-00_3.png' 'gei-lsl-00_3.png' 'gei-ml-00_3.png' 'gei-nhz-00_4.png' 'gei-rj-00_3.png' 'gei-syj-00_3.png' 'gei-wl-00_3.png' 'gei-wq-00_3.png' 'gei-wyc-00_3.png' 'gei-xch-00_3.png' 'gei-xxj-00_3.png' 'gei-yjf-00_3.png' 'gei-zc-00_3.png' 'gei-zdx-00_3.png' 'gei-zjg-00_3.png' 'gei-zl-00_3.png' 'gei-zyf-00_3.png'};
%[fname_te, pname_te]= uigetfile({'*.png;*.jpeg;*.jpg','Image Files(*.png,*.jpeg,*.jpg)'},'Select a file','F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\test\', 'MultiSelect', 'on');
random_n=randi(20);
final_test(chr)=random_n;
a=cellstr(Z{random_n});
l_te=length(a);
pname_te='F:\New folder (3)\New Folder (2)\silhouettes_matlab\KNN\test\';
for j=1:l_te
    
    fullfilename=fullfile(pname_te,a{j});%REMEMBER: to access cell elements use {}
    BW=im2double(imread(fullfilename));
    [x_te y_te ch]=size(BW);  %pixels=x*y, ch= color channels
    test_set(j,:)=reshape(BW,1,x_te*y_te);
end
G=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]';

[class D m]= knnclassification(test_set, train_set, G, 1);
final_test_compare(chr)=class;
end
count=0;aux=0;
for alpha=1:chr_max
    if final_test_compare(alpha)~=final_test(alpha)
        count=count+1;
        aux(count)=alpha;
        aux_2(count)=final_test(alpha);
        
    end
end
lessthenR1=100-count;