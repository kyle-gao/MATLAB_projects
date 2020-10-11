classdef Tree
    %a decision tree
    properties
        data
        tree
    end
    
    methods
        function obj = Tree(data,depth,max_depth)
            %populates Tree with data, tree is not fitted upon calling this
            obj.data=data;
            obj.tree = build_tree(data,depth,max_depth);
        end
        
        function evaluation = evaluate(obj,test_data,test_label)
            %returns the classification accuracy on a test set
            L=length(test_label);
            acc=0;
            for l=1:L
                prediction=Classify(test_data(l,:),obj.tree);
                if prediction==test_label(l)
                    acc=acc+1;
                end
            end
            evaluation= acc/L;
        end
        
        function prediction = predict(obj,X)
            %returns a list of predictions for a list of features
            prediction = Classify(X,obj.tree)        
        end
        
end
end

