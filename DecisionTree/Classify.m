        function prediction = Classify(features,node)
            if isa(node,"Leaf")
                prediction = node.Predict();
            else
                col=node.nodeCol;
                val=node.nodeValue;
                
                
                if iscellstr(val)||isstring(val)
                    %if feature is string, compare strings
                    if strcmp(features(col),val)
                        prediction = Classify(features,node.right);
                    else
                        prediction = Classify(features,node.left);
                    end
                else
                    %else compare numeric with >=
                    if features(col)>=val
                        prediction = Classify(features,node.right);
                    else
                        prediction = Classify(features,node.left);
                    end
                end
            end
        end   