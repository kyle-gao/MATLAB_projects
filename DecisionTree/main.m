load fisheriris

categories = {'setosa','versicolor','virginica'};
labels=categorical(species,categories);
labels= grp2idx(labels);
data=[meas,labels];

%shuffle the data
data=data(randperm(length(data)),:);

%split into train and test sets
train_data=data(1:121,:);
test_data=data(121:end,1:end-1);
test_label=data(121:end,end);

tree=Tree(train_data,0,10);
tree.tree
Classify(test_data,tree.tree);


tree.evaluate(test_data,test_label)

%ans =0.9333
