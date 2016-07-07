function [index]=find_element(A, k)
%A=Input Matrix or Array
%k=Prob element
%index=Index or Pos of prob element in A
la=length(A);
for i=1:la
    if A(i)==k
        index=i;
        break;
    else
        index=0;
    end
end