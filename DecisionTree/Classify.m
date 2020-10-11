        function prediction = Classify(features,node)
            [rows,columns]=size(features);
            prediction=zeros(rows,1);
            
            for r=1:rows
                feature=features(r,:);
            if isa(node,"Leaf")
                prediction(r) = node.Predict();
            else
                col=node.nodeCol;
                val=node.nodeValue;
                
                
                if iscellstr(val)||isstring(val)
                    %if feature is string, compare strings
                    if strcmp(feature(col),val)
                        prediction(r) = Classify(feature,node.right);
                    else
                        prediction(r) = Classify(feature,node.left);
                    end
                else
                    %else compare numeric with >=
                    if feature(col)>=val
                        prediction(r) = Classify(feature,node.right);
                    else
                        prediction(r) = Classify(feature,node.left);
                    end
                end
            end
            
            end
        end