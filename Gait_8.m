%Gait Information Image Sigmoid Feature
clear
for i=1:75
    if(i<10)
        pngFilename=sprintf('fyc-00_1-00%d.png',i);
    else
        pngFilename=sprintf('fyc-00_1-0%d.png',i);
    end
    %?F:\New folder (3)\New Folder
    %(2)\silhouettes_matlab\fyc\00_1\fyc-00_1-001.png
    fullFilename=fullfile('F:','New folder (3)','New Folder (2)','silhouettes_matlab','fyc','00_1', pngFilename);
    B= im2double(imread(fullFilename));
    [M, N]=size(B); %M=x, N=y
    
    for j=1:M
        for k=1:N
            I{j,k}(i)=B(j, k);
        end
    end
end
%M=240; N=100;
for l=1:M
    for m=1:N
        x(l,m)=sum(I{l,m});
        variance(l,m)=var(I{l,m});
        f(l,m)=sqrt(variance(l,m));
        for n=1:75
            mu{l,m}(n)=exp(-(((I{l,m}(n)/75)-1)/(sqrt(2)*f(l,m)))^4);
            I_value{l,m}(n)=I{l,m}(n)*mu{l,m}(n);
        end
    end
end
X=x/75;
for o=1:M
    for p=1:N
        for q=1:75
            QW{o,p}(q)=X(o,p)/(1+exp(-(I_value{o,p}(q))));
        end
        BW(o,p)=sum(QW{o,p});
    end
end
BW=BW/75;

imshow(BW);