function [impurity] = gini_impurity(data)
%Returns the Gini impurity of an array with the last column corresponding
%to class labels.
impurity = 1;
tab = tabulate(data(:,end));
probs = tab(:,3); %cell array of percent occurence
for i=1:length(probs)
    impurity = impurity - (probs(i)/100)^2;
end
end

