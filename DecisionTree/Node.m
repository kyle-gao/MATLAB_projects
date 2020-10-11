classdef Node
    %A node with Node or Leaf as node.left, node.right
    properties
        nodeValue
        nodeCol
        left
        right
    end
    methods
        function obj = Node(col,nodeValue,left,right)
            obj.nodeValue=nodeValue;
            obj.nodeCol=col;
            obj.left=left;
            obj.right=right;
        end
    end
    
end

