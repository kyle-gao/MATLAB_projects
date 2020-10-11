function [node] = build_tree(data,depth,max_depth)
%recursively builds a tree of Node and Leaf
[gain,col,val]=bestSplit(data);
if gain==0
    node=Leaf(data);

elseif depth>=max_depth
    node=Leaf(data);
else
if iscategorical(val)||iscellstr(val)||isstring(val)
    [left,right]=partition(data,col,val,'categorical');
    
else
    [left,right]=partition(data,col,val,'numerical');
end

left_branch=build_tree(left,depth+1,max_depth);
right_branch=build_tree(right,depth+1,max_depth);
node=Node(col,val,left_branch,right_branch);
end
end

