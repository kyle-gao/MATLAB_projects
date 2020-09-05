load fisheriris
randomize = randi(150,150,1);
X = meas(randomize,:);
Y = species(randomize,:);
X_train = X(1:120,:);
Y_train = Y(1:120,:);
X_val = X(121:end,:);
Y_val = Y(121:end,:);

k = 3 %small k tend to overfit, large k tend to underfit. 
%k = 1 perfectly fits training set. 


Model = fitcknn(X_train,Y_train,'NumNeighbors',3,'Standardize',1)
[label,score,cost]= predict(Model,X_val);

s = size(label);
accuracy = sum(cellfun(@isequal, Y_val, label))/s(1);
disp(accuracy)
%accuracy=0.9333

mylabels = myKNN(X_train,Y_train, X_val, 3);
accuracy = sum(cellfun(@isequal, Y_val, mylabels))/s(1);
disp(accuracy)
%accuracy=0.9333

save('X_val.mat', 'X_val');
save('label.mat', 'label');
save('mylabels.mat', 'mylabels');
