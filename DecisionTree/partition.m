function [left,right] = partition(data,column,thresholdValue,type)
%partitions table according to thresholdValue of column

%table:(m,n) array
%column: integer 0<column<n
%threshold value: type stored in table(:,column)
%type: one of 'numerical','categorical'

%returns 2 list of indices
%if column contains numerical features
%rightIdx are 1 where the column>=thresholdValue
%if column contains categorical features
%rightIdx are 1 where column==thresholdValue

if strcmp(type,'numerical')
    rightIdx = data(:,column)>=thresholdValue;
end
if strcmp(type,'categorical')
    rightIdx=strcmp(data(:,column),thresholdValue)
end

leftIdx=not(rightIdx);

left=data(leftIdx,:);
right=data(rightIdx,:);

end

