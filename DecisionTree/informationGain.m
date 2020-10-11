function [gain] = informationGain(left,right,current_gini)
%returns the information gain of a left/right partition.

p = length(left)/(length(right)+length(left));
gain = current_gini - p*gini_impurity(left)-(1-p)*gini_impurity(right);
end

