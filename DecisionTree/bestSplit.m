function [best_gain,best_col,best_value] = bestSplit(data)
%Splits a table according to the best information gain using gini impurity
%returns the best information gain, and the column and value of the best
%split
current_gini = gini_impurity(data(:,end));
best_gain=0;
best_col=[];
best_value=[];
[rows,cols]=size(data);
for c=1:cols-1
    for r=1:rows
        value = data(r,c);
        if iscellstr(value)||isstring(value)
            [left,right]=partition(data,c,data(r,c),'categorical');      
        else
            [left,right]=partition(data,c,data(r,c),'numerical');
        end
    
        if or(isempty(left), isempty(right))
            %go to next loop if one of the splits is empty
            continue
        end       
        info_gain = informationGain(left,right,current_gini);
        if info_gain>best_gain
            %save the current split as best split
            best_col=c;
            best_value=value;
            best_gain=info_gain;
        end
             
    end
end
end

