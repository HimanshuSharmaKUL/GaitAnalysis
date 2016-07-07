function [result dist m indices rank]= knnclassification(test_set,train_set, samplesY, Knn,type)

% Classify using the Nearest neighbor algorithm
% Inputs:
% 	train_set	   - Train samples
%	samplesY	   - Train labels
%   testamplesX(1st argument)   - Test  samples
%	Knn(4th arg)		       - Number of nearest neighbors 
%
% Outputs
%	result	- Predicted targets
if nargin < 5
    type = '2norm';
end

L			= length(samplesY);
Uc          = unique(samplesY);

if (L < Knn),
   error('You specified more neighbors than there are points.')
end

N                   = size(test_set, 1); %no. of test cases
result              = zeros(N,1); 
rank                = zeros(N,1);
switch type
case '2norm'
    for i = 1:N,
        dist            = sum((train_set - ones(L,1)*test_set(i,:)).^2,2);
        [m, indices]    = sort(dist);
       % ind               =indices(i);
        n               = hist(samplesY(indices(1:Knn)), Uc);
        [mn, best]       = max(n);
        result(i)        = Uc(best);
        rank(i)         = find_element(indices, i);
    end
    
case '1norm'
    for i = 1:N,
        dist            = sum(abs(train_set - ones(L,1)*test_set(i,:)),2);
        [m, indices]    = sort(dist);   
        n               = hist(samplesY(indices(1:Knn)), Uc);
        [m, best]       = max(n);
        result(i)        = Uc(best);
    end
case 'match'
    for i = 1:N,
        dist            = sum(train_set == ones(L,1)*test_set(i,:),2);
        [m, indices]    = sort(dist);   
        n               = hist(samplesY(indices(1:Knn)), Uc);
        [m, best]       = max(n);
        result(i)        = Uc(best);
    end
otherwise
    error('Unknown measure function');
end
