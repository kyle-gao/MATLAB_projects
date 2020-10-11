classdef Leaf
%A Leaf
    
    properties
        features
        labels
    end
    
    methods
        function obj = Leaf(data)
            %builds a Leaf from an array of features and label
            obj.features=data(:,1:end-1);
            obj.labels=data(:,end);
        end
        
        function prediction = Predict(obj)
            %return the most common label
            prediction=mode(obj.labels);
        end
        function predictions = Predictions(obj)
            %return the occurence frequencies of all labels
            table = tabulate(obj.labels);
            predictions = table(:,[1,3]);
        end
    end
end