%Copyright 2020 Yi Lin(Kyle) Gao
%Licensed under the Apache License, Version 2.0 (the "License"); you may 
%not use this file except in compliance with the License. You may obtain a 
%copy of the License at http://www.apache.org/licenses/LICENSE-2.0 .


function [idx, C] = k_means(X, k, iter)

%X - dataset (n,2) array
%k - int, number of cluster
%iter - number of iterations

%preallocate for speed
[n,d] = size(X);
differences = zeros(k,n,d);
distances = zeros(k,n);
idx = zeros(n,1);

%randomly sample k unique points from X as initial centroids
C = datasample(X,k, 'replace',false);


for it = 1:iter
outmsg = sprintf("Iteration %d", it) ;
fprintf(outmsg)
    
%make an array of differences
for i = 1:k
    differences(i,:,:) = X - C(i);    
end

%calculate norms
for i = 1:k
    for j = 1:n
        vec = squeeze(differences(i,j,:));
        distances(i,j)= norm(vec);
    end
end

%print the mean distance to clusters
meandist = mean(distances,2);

disp("Mean distances ")
disp(meandist);

%assign to closest cluster
for i = 1:n
    [d,id] = min(distances(:,i));
    idx(i) = id;
end

%compute new centroids
for i = 1:k
    veclist = X(idx==i,:);
    C(i,:) = mean(veclist);
end

end
end
