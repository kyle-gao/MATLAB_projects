
mu_1 = 1;
mu_2 = -1;
sig_1 = 0.5
sig_2 = 0.5

%2 gaussians, one centered at (1,1) another at (-1,-1)
X = [normrnd(mu_1,sig_1,[100,2]);normrnd(mu_2,sig_2,[100,2])];

%Matlab's k means
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',1,'Options',opts);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids MATLAB kmeans'
hold off


%my k means
[idx,C] = k_means(X,2,5);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids My k_means'
hold off