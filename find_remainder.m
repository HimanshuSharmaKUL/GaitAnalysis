function [k]=find_remainder(A, N)
%A+k=B where B/N or N/B is integer
for i=1:N
    x=A+i;
    value1=(A+i)/N;
    value2=N/(A+i);
    if (~mod(value1,1) || ~mod(value2,1))
        k=i;
        break;
    end
end
end