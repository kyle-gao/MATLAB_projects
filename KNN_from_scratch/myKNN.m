%Copyright 2020 Yi Lin(Kyle) Gao
%Licensed under the Apache License, Version 2.0 (the "License"); you may 
%not use this file except in compliance with the License. You may obtain a 
%copy of the License at http://www.apache.org/licenses/LICENSE-2.0 .

function [labels] = myKNN(X_train, Y_train, X_predict, k)
%Simple KNN classifier
%Inputs
% X_train - (m, num_features) array, X_training features
% Y_train - (m, 1) string cell, the training labels
% X_predict -(n,num_features) array, features on which to make predictions

%Returns
%labels - (n,1) string cell, predictions from X_predict

% We normalize each column to have a mean of 0 and std of 1.
% This is an optional argument in fitcknn.
X_train = normalize(X_train);
X_predict = normalize(X_predict);
[n, cols] = size(X_predict);

labels_arr = cell(n,k);
labels = cell(n,1);

for i = 1:n
    %find minumum distance for each X_pred
    features = X_predict(i,:);
    differences = (X_train - features);
    distances = vecnorm(differences,2,2);
    [sorted_dist, sorted_index] = sort(distances);
    %get k neareast labels
    k_idx = sorted_index(1:k);
    labels_arr(i,:) = Y_train(k_idx,1);    
    %find the most common
    labels(i,1) = cellstr(strtrim(mode(char(labels_arr(i,:)))));
end
end
